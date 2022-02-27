<?php
/*
// Set ETag header
$etag = 1645392468;
header("ETag: $etag");
if (
	isset($_SERVER['HTTP_IF_NONE_MATCH']) &&
	$_SERVER['HTTP_IF_NONE_MATCH'] == $etag
) {
	header("HTTP/1.1 304 Not Modified");
	die();
}
*/

if (empty($_GET["lang"]) || strip_tags($_GET["lang"]) == "en") {
	$lang = "en";
	$locale = "en_US";
	$site = $title = "War News";
	$summary = "Comprehensive news coverage in English about the war and its effects. The list is updated daily.";
	$listAria = "Current war-related news";
	$langChange = [
		"name" => "fi",
		"link" => "/?lang=fi"
	];
} else {
	$lang = "fi";
	$locale = "fi_FI";
	$site = $title = "Sotauutisia";
	$summary = "Kattava uutislista sodasta ja sen vaikutuksista suomeksi ja englanniksi. Listaa päivitetään päivittäin.";
	$listAria = "Ajankohtaisia sotaan liittyviä uutisia";
	$langChange = [
		"name" => "en",
		"link" => "/"
	];
}

$url = "https://warnews.info/";

$image = $url . "warnews.jpg";
$favicon = $url . "favicon.ico";

$tag;
$base = __DIR__ . "/../";

include_once($base . "functions.php");
include_once($base . "page.php");

if (!empty($tag)) {
	$title .= " &raquo; $tag";
}
?>
<!DOCTYPE html>
<html lang="<?= $lang ?>">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title><?= $title ?></title>
	<style>
		:root {
			--blue: #005ea0;
			--white: #fff
		}

		body {
			box-sizing: border-box;
			overflow-x: hidden;
			font: 400 16px Tahoma;
			line-height: 1.5
		}

		h1,
		a {
			color: var(--blue)
		}

		#header {
			max-width: 468px;
			padding: 3rem 2rem;
			margin-left: auto;
			margin-right: auto;
			text-align: center
		}

		h1 {
			text-transform: uppercase;
			font-size: 2rem;
			margin: 0 auto 15px;
			line-height: 1.2
		}

		#description {
			font-size: 1.2rem
		}

		#count {
			font-size: 1.1rem;
			margin-top: 10px
		}

		body,
		ul,
		figure {
			margin: 0
		}

		main,
		figure,
		img,
		#news li,
		li a {
			display: block
		}

		#news {
			display: grid;
			gap: 1.5rem;
			padding: 0 1.5rem;
			width: calc(100vw - 3rem);
			max-width: 800px;
			margin: 0 auto
		}

		a {
			cursor: pointer;
		}

		a:not(:hover) {
			text-decoration: none
		}

		body {
			color: rgba(0 0 0 / 87%)
		}

		img {
			width: 100%;
			height: auto
		}

		.description {
			margin-top: 2px
		}

		.service {
			margin-top: 5px;
			color: rgba(0 0 0 / 60%)
		}

		main {
			margin-bottom: 2rem
		}

		#changeLanguage {
			position: absolute;
			top: 0;
			right: 0;
			width: 48px;
			height: 48px;
			display: grid;
			font-size: 1.4rem;
			text-transform: uppercase;
			text-align: center;
			text-decoration: none
		}

		#changeLanguage span {
			align-self: center
		}

		h1,
		strong,
		#changeLanguage,
		#changeLanguage span {
			font-weight: 700
		}
	</style>
	<meta property="og:type" content="website" />
	<meta property="og:locale" content="<?= $locale ?>" />
	<link rel="alternate" href="<?= $url ?>" hreflang="x-default" />
	<link rel="alternate" hreflang="fi" href="<?= $url ?>?lang=fi" />
	<link rel="alternate" hreflang="en" href="<?= $url ?>" />
	<meta name="og:site_name" property="og:site_name" content="<?= $site ?>" />
	<meta name="canoncial" property="og:url" content="<?= $url ?>" />
	<meta name="twitter:title" property="og:title" content="<?= $title ?>" />
	<meta name="twitter:description" property="og:description" content="<?= $summary ?>" />
	<meta name="twitter:image" property="og:image" content="<?= $image ?>" />
	<meta name="twitter:image:width" content="1200" />
	<meta name="twitter:image:height" content="630" />
	<meta name="twitter:card" content="summary_large_image">
	<meta name="twitter:creator" content="@_timoanttila" />
	<link href="<?= $favicon ?>" rel="icon" type="image/x-icon">
	<link rel="apple-touch-icon" sizes="57x57" href="/icons/apple-icon-57x57.png">
	<link rel="apple-touch-icon" sizes="60x60" href="/icons/apple-icon-60x60.png">
	<link rel="apple-touch-icon" sizes="72x72" href="/icons/apple-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="76x76" href="/icons/apple-icon-76x76.png">
	<link rel="apple-touch-icon" sizes="114x114" href="/icons/apple-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="120x120" href="/icons/apple-icon-120x120.png">
	<link rel="apple-touch-icon" sizes="144x144" href="/icons/apple-icon-144x144.png">
	<link rel="apple-touch-icon" sizes="152x152" href="/icons/apple-icon-152x152.png">
	<link rel="apple-touch-icon" sizes="180x180" href="/icons/apple-icon-180x180.png">
	<link rel="icon" type="image/png" sizes="192x192" href="/icons/android-icon-192x192.png">
	<link rel="icon" type="image/png" sizes="32x32" href="/icons/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="96x96" href="/icons/favicon-96x96.png">
	<link rel="icon" type="image/png" sizes="16x16" href="/icons/favicon-16x16.png">
	<link rel="manifest" href="/manifest.json">
	<meta name="msapplication-TileColor" content="#005ea0">
	<meta name="msapplication-TileImage" content="/icons/ms-icon-144x144.png">
	<meta name="theme-color" content="#005ea0">
</head>

<body>
	<main>
		<a id="changeLanguage" href="<?= $langChange["link"] ?>" hreflang="<?= $langChange["name"] ?>"><span><?= $langChange["name"] ?></span></a>
		<?= $content ?>
	</main>
</body>

</html>