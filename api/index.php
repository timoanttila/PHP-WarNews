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

$offset = !empty($_GET["pageNumber"]) && (int)$_GET["pageNumber"] > 1 ? (int)$_GET["pageNumber"] * $limit : 0;

$query = "SELECT a.*, s.title serviceName, l.abbr langAbbr FROM articles a INNER JOIN services s ON a.serviceId = s.id INNER JOIN languages l ON a.languageId = l.id WHERE l.abbr = '$lang'";

if (!empty($_GET["search"])) {
	$items = explode(" ", strip_tags($_GET["search"]));

	$search = "";
	foreach ($items as $item) {
		if (!empty($search)) {
			$search .= " OR ";
		}
		$search .= "a.title LIKE '%{$item}%' OR a.summary LIKE '%{$item}%'";
	}

	$query .= "AND ($search)";
} else if (!empty($_GET["service"])) {
	$query .= "AND serviceId = '" . (int)$_GET["service"] . "'";
}

$query .= " ORDER BY created DESC LIMIT $limit OFFSET $offset";

// Sending a request to the database
$result = db($query);

if ($result->num_rows == 0) {
	header("HTTP/1.1 204 No Content");
	die();
}

$data = [];

while ($row = $result->fetch_assoc()) {
	$date = strtotime($row["created"]);

	$data[] = [
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
		],
		"modified" => $row["updated"]
	];
}

header("Content-Type: application/json; Charset=UTF-8");
header("HTTP/1.1 200 OK");
echo json_encode($data);
