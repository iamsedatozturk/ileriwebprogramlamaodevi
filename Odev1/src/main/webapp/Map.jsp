<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
	  	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script> 
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
		<script type="text/javascript" src="https://raw.github.com/brandonaaron/jquery-mousewheel/master/jquery.mousewheel.js"></script>
		<script type="text/javascript" src="./Script/jquery-panzoom.js"></script>
		
		<link rel="stylesheet" type="text/css" media="screen" href="./Css/style.css" />
		<script type="text/javascript">
			$(document).ready(function () {
		        function initPanZoom() {
		          $('#pan img').panZoom({
		            'zoomIn'   	: 	$('#zoomin'),
		            'zoomOut' 	: 	$('#zoomout'),
		            'panUp'		:	$('#panup'),
		            'panDown'	: 	$('#pandown'),
		            'panLeft'	:	$('#panleft'),
		            'panRight'	:	$('#panright'),
		            'fit'       :   $('#fit'),
		            'destroy'   :   $('#destroy'),
		            'out_x1'    :   $('#x1'),
		            'out_y1'    :   $('#y1'),
		            'out_x2'    :   $('#x2'),
		            'out_y2'    :   $('#y2'),
		            'directedit':   true,
		            'debug'     :   false
		          });
		        };
		
		        initPanZoom();
		
				// init the image switcher
				$('#images img').bind('click', function () {
					$('#pan img').attr('src', $(this).attr('src'));
				});
		
		        // init the init button (for testing destroy/recreate)
		        $('#reinit').bind('click', function (event) {
		          if ($('#pan img').data('panZoom')) {
		            alert('Click destroy before trying to re-initialise panZoom');
		            return;
		          }
		          event.preventDefault();
		          initPanZoom();
		        });
			});
		</script>
	</head>
	
	<body>
    <div class="wrapper">
      <div id="pan">
        <img src="./Images/turistik.jpg">
      </div>

      <div id="controls">
        <h2>Controls</h2>
        <h3>Zoom</h3>
        <a id="zoomin" href="#">
          <img src="./Images/zoom_in.png"><br />
          Zoom In
        </a>
        <a id="zoomout" href="#">
          <img src="./Images/zoom_out.png"><br />
          Zoom Out
        </a>

        <h3>Pan</h3>
        <a id="panup" href="#">
          <img src="./Images/arrow_up.png"><br />
          Pan Up
        </a>
        <a id="pandown" href="#">
          <img src="./Images/arrow_down.png"><br />
          Pan Down
        </a>
        <a id="panleft" href="#">
          <img src="./Images/arrow_left.png"><br />
          Pan Left
        </a>
        <a id="panright" href="#">
          <img src="./Images/arrow_right.png"><br />
          Pan Right
        </a>

        <h3>Fit/Destroy</h3>
        <a id="fit" href="#">
          <img src="./Images/arrow_out.png"><br />
          fit/reset
        </a>
        <a id="destroy" href="#">
          <img src="./Images/cross.png"><br />
          destroy
        </a>
        <a id="reinit" href="#">
          <img src="./Images/tick.png"><br />
          re-initialise
        </a>

        <h3>Other Controls</h3>
        <p>You can also drag the image around or zoom with your mousewheel when hovering. Double click will zoom too.</p>
      </div>
     </div>

     <div id="output">
       <h2>Output</h2>
       <p>View the current co-ordinates live. You will probably want hidden fields, but whilst they are visible, try changing the numbers.</p>
       <table>
         <tr>
           <td>x1: <input type="text" name="x1" value="0" id="x1"></td><td>x2: <input type="text" name="x2" value="0" id="x2"></td>
         </tr>
         <tr>
           <td>y1: <input type="text" name="y1" value="0" id="y1"></td><td>y2: <input type="text" name="y2" value="0" id="y2"></td>
         </tr>
       </table>
     </div>
	</body>
</html>