<?php
$query = "SELECT a.*, s.title serviceName, s.timezone, l.abbr langAbbr FROM articles a INNER JOIN services s ON a.serviceId = s.id INNER JOIN languages l ON a.languageId = l.id WHERE l.abbr = '$lang' ORDER BY created DESC";

// Sending a request to the database
$result = db($query);

if ($result->num_rows == 0) {
	header("HTTP/1.1 404 Not Found");
	die();
} else {
	/*
	$cache = 604800;
	header("Pragma: Cache");
	header("Expires: $cache");
	header("Cache-Control: must-revalidate, max-age=$cache, s-maxage=$cache");
	header("Cache-Control: max-age=$cache");
	header("HTTP/1.1 200 OK");
	*/
}

// Open the results one by one
$data = "<ul id=\"news\" aria-label=\"$listAria\">";
while ($row = $result->fetch_assoc()) {

	$data .= "<li role=\"none\"><a href=\"{$row["website"]}\" hreflang=\"{$row["langAbbr"]}\" role=\"listitem\"><strong>{$row["title"]}</strong></a>";

	if (!empty($row["summary"])) {
		$data .= "<div class=\"description\">{$row["summary"]}</div>";
	}

	$data .= "<div class=\"service\">{$row["serviceName"]} " . date("d.m.Y H:i", strtotime($row["created"])) . "</div>";

	$data .= "</small></div>";
}
$data .= "</ul>";

$content = "<div id=\"header\" role=\"banner\"><h1>$title</h1><div id=\"description\">$summary</div><div id='author'><a href='https://twitter.com/_timoanttila' rel='author'>@_timoanttila</a></div></div></div>$data";
