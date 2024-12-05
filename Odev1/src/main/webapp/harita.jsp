<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="./js/jquery.panzoom.js"></script>
<script>
	$(document).ready(function() {
		var $section = $('#focal').first();
		$section.find('.panzoom').panzoom({
			maxScale : 3,
			minScale : 0.5,
			increment : 0.1,
			duration : 500,
			$zoomIn : $section.find(".zoom-in"),
			$zoomOut : $section.find(".zoom-out"),
			$zoomRange : $section.find(".zoom-range"),
			$reset : $section.find(".reset"),
			startTransform : "scale(0.95)"
		});
	});
</script>
<style>
.Image {
	width: 100%;
	height: 600px;
}
</style>
</head>
<body>
	<section id="focal">
		<div class="buttons">
			<button id="zoominbtn" class="zoom-in">+</button>
			<button id="zoomoutbtn" class="zoom-out">-</button>
			<button id="restbtn" class="reset" style="margin-left: 254px;">Default
				Zoom</button>
		</div>
		<div class="parent"
			style="overflow: hidden; user-select: none; touch-action: none;">
			<div class="panzoom">
				<img id="img-searchplot" class="Image" src="./Images/turistik.jpg"
					usemap="#searchplot" />
			</div>
		</div>
	</section>
</body>
</html>
