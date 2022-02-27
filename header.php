<button id="menubutton" onClick="openMenu(this)" aria-haspopup="true" aria-controls="menuList">
	<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24">
		<path d="M24 6h-24v-4h24v4zm0 4h-24v4h24v-4zm0 8h-24v4h24v-4z" />
	</svg>
</button>

<nav id="menu">
	<ul id="menuList" role="menu" aria-labelledby="menubutton">
		<?php
		$result = db("SELECT * FROM tags ORDER BY tag_title ASC");
		while ($row = $result->fetch_assoc()) {
			echo "<li onClick=\"openMenu(this)\" role=\"none\">";
			echo "<a href=\"/?tag={$row["tag_link"]}\" role=\"menuitem\">{$row["tag_title"]}</a>";
			echo "</li>";
		}
		?>
	</ul>
</nav>