<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./IsCheckLogin.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Harita</title>
<link rel="stylesheet" type="text/css" href="./Css/styles.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="./js/jquery.panzoom.js"></script>
<script>
	$(document).ready(function() {
		var $section = $('#harita_content');
		var $panzoomElement = $section.find('.panzoom');

		$panzoomElement.panzoom({
			maxScale : 4, 
			minScale : 0.3, 
			increment : 0.1, 
			duration : 100, 
			$zoomIn : $section.find(".zoom-in"),
			$zoomOut : $section.find(".zoom-out"),
			$zoomRange : $section.find(".zoom-range"),
			$reset : $section.find(".reset"),
			startTransform : "scale(0.95)",
		});
		
	    $panzoomElement.on('wheel', function(event) {
	        event.preventDefault();

	        var delta = event.originalEvent.deltaY;
			console.log()

	        if (delta > 0) {
	        	$section.find(".zoom-out").click();
	        } else {
	        	$section.find(".zoom-in").click();
	        }
	    });	    
	});
	
	function zoomToLocation() {
        var istanbulX = -1200;  
        var istanbulY = -800;  

		var $section = $('#harita_content');
		var $panzoomElement = $section.find('.panzoom');
		
		$panzoomElement.panzoom("reset");
				
		$section.find(".zoom-in").click();
		$section.find(".zoom-in").click();
		$section.find(".zoom-in").click();
		$section.find(".zoom-in").click();
		$section.find(".zoom-in").click();
		$section.find(".zoom-in").click();
		$section.find(".zoom-in").click();
		$section.find(".zoom-in").click();
		$section.find(".zoom-in").click();
		$section.find(".zoom-in").click();
		$section.find(".zoom-in").click();
		$section.find(".zoom-in").click();
		$section.find(".zoom-in").click();
		$section.find(".zoom-in").click();
		$section.find(".zoom-in").click();
		$panzoomElement.panzoom("pan", -istanbulX, -istanbulY, { animate: true });
    }
</script>
</head>
<body>
	<jsp:include page="./Header.jsp"></jsp:include>
	<div class="layout">
		<section id="harita_content" class="harita_content">
			<div class="toolbar">
				<a href="MainPage.jsp" class="user_back-button"
					style="margin-left: 5px"><i class="fa fa-arrow-left"></i></a>
				<button id="zoominbtn" class="zoom-in" style="margin-left: 5px">Zoom+</button>
				<button id="zoomoutbtn" class="zoom-out" style="margin-left: 5px">Zoom-</button>
				<button id="restbtn" class="reset" style="margin-left: 5px">Default Zoom</button>
				<button id="zoomLoca" style="color:red; margin-left: 5px" onclick="zoomToLocation()">İstanbul</button>
			</div>

			<div class="parent"
				style="overflow: hidden; user-select: none; touch-action: none;">
				<div class="panzoom">
					<img id="harita" class="harita" src="./Images/turistik.jpg"
						usemap="#searchplot" />
				</div>
			</div>
		</section>
	</div>
</body>
</html>
