<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header("Access-Control-Allow-Origin: https://warnews.info");
header("Access-Control-Allow-Headers: Content-Type, X-Requested-With, Upgrade-Insecure-Requests, Keep-Alive");
header("Access-Control-Allow-Methods: GET");
header("X-Robots-Tag: noindex, nofollow", true);

// Method
$method = strtolower($_SERVER['REQUEST_METHOD']);

// CORS preflight
if ($method == "options") {
	header("Access-Control-Max-Age: 31556926");
	header("HTTP/1.1 200 OK");
	die();
}

include_once("../functions.php");

$lang = !empty($_GET["lang"]) && in_array($_GET["lang"], ["fi", "en"]) ?
	$_GET["lang"] : "en";

$limit = !empty($_GET["limit"]) ? (int)$_GET["limit"] : 50;

$pageNumber = !empty($_GET["pageNumber"]) ? (int)$_GET["pageNumber"] : 1;

$query = "FROM articles a INNER JOIN services s ON a.serviceId = s.id INNER JOIN languages l ON a.languageId = l.id WHERE ";

if (!empty($_GET["photos"])) {
	$query .= "isGallery = 1";
} else {
	$query .= "l.abbr = '$lang'";

	if (!empty($_GET["search"])) {
		$items = explode(" ", strip_tags($_GET["search"]));

		$search = "";
		foreach ($items as $item) {
			if (!empty($search)) {
				$search .= " OR ";
			}
			$search .= "a.title LIKE '%{$item}%' OR a.summary LIKE '%{$item}%'";
		}

		$query .= " AND ($search)";
	} else if (!empty($_GET["service"])) {
		$query .= " AND serviceId = '" . (int)$_GET["service"] . "'";
	}
}

$query .= " ORDER BY created DESC";

$result = db("SELECT count(a.id) totalCount $query");

if ($result->num_rows == 0) {
	header("HTTP/1.1 204 No Content");
	die();
}

$item = $result->fetch_all(MYSQLI_ASSOC);
$item = array_shift($item);

$data = [
	"info" => [
		"totalCount" => (int)$item["totalCount"],
		"pageSize" => $limit,
		"currentPage" => $pageNumber
	],
	"articles" => []
];

$data["info"]["totalPages"] = $data["info"]["totalCount"] > $data["info"]["pageSize"] ? ceil($data["info"]["totalCount"] / $data["info"]["pageSize"]) : 1;

if ($data["info"]["totalPages"] > $data["info"]["currentPage"]) {
	$data["info"]["nextPage"] = 1;
}

if ($data["info"]["currentPage"] > 1) {
	$data["info"]["previousPage"] = 1;
}

$offset = $pageNumber > 1 ? ($pageNumber - 1) * $limit : 0;

// Sending a request to the database
$result = db("SELECT a.*, s.title serviceName, l.abbr langAbbr $query LIMIT $limit OFFSET $offset");

while ($row = $result->fetch_assoc()) {
	$date = strtotime($row["created"]);

	$data["articles"][] = [
		"id" => (int)$row["id"],
		"title" => $row["title"],
		"summary" => $row["summary"],
		"url" => $row["website"],
		"service" => (int)$row["serviceId"],
		"serviceName" => $row["serviceName"],
		"language" => (int)$row["languageId"],
		"languageName" => $row["langAbbr"],
		"created" => [
			"datetime" => date("Y-m-d\TH:i:s", $date),
			"view" => date("d.m.Y H:i", $date)
		]
	];
}

header("Content-Type: application/json; Charset=UTF-8");
header("HTTP/1.1 200 OK");
echo json_encode($data);
