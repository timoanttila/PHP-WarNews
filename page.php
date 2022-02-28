<?php
$query = "SELECT a.*, s.title serviceName, s.timezone, l.abbr langAbbr FROM articles a INNER JOIN services s ON a.serviceId = s.id INNER JOIN languages l ON a.languageId = l.id WHERE l.abbr = '$lang' ORDER BY created DESC";

// Sending a request to the database
$result = db($query);

if ($result->num_rows == 0) {
	header("HTTP/1.1 404 Not Found");
	die();
}

// Open the results one by one
$data = "<ul id='news' aria-label='$listAria'>";
while ($row = $result->fetch_assoc()) {

	$data .= "<li role='none'><a href='{$row["website"]}' hreflang='{$row["langAbbr"]}' role='listitem' rel='nofollow'><strong>{$row["title"]}</strong></a>";

	if (!empty($row["summary"])) {
		$data .= "<div class='description'>{$row["summary"]}</div>";
	}

	$data .= "<div class='service' data-nosnippet><small>{$row["serviceName"]} " . date("d.m.Y H:i", strtotime($row["created"])) . "</small></div>";

	$data .= "</small></div>";
}
$data .= "</ul>";

$content = "<div id='header' role='banner'><h1>$title</h1><div id='description'>$summary</div><div id='author'><a href='https://twitter.com/_timoanttila' rel='author'>@_timoanttila</a></div></div></div>$data";
