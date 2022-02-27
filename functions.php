<?php
function db($query)
{
	$keys = json_decode(file_get_contents(__DIR__ . "/.env"));
	$db = new mysqli("localhost", $keys->username, $keys->password, $keys->db);
	if ($db->connect_error) {
		die("Connection failed: " . $db->connect_error);
	}
	mysqli_set_charset($db, "utf8");

	return $db->query($query);
}
