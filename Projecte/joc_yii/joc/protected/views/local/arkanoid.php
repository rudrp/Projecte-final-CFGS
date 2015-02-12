<!DOCTYPE html>

<html>
	<head>
		<title>Implementing advanced animation</title>
		<meta charset="utf-8">
		
		<link href="canvas.css" rel="stylesheet" type="text/css">
		  <link href="<?php echo Yii::app()->request->baseUrl;?>/css/canvas.css" rel="stylesheet" type="text/css">
		<script src="<?php echo Yii::app()->request->baseUrl;?>/js/arkanoid_mou.js"></script>
	</head>
	
	<body>
		<div id="dades">
		</div>
		<canvas id="myCanvas" width="513" height="300">
			<!-- Insert fallback content here -->
		</canvas>
		<div id="myButtons">
			<button id="startAnimation">Start</button>
			<button id="stopAnimation">Stop</button>
		</div>
				<img id="atlas" src="../img/atla.png" alt="atlas" style="display: none;">
				<br/>
				Soporte para movimiento Mouseover y flechas.<br/>
				Cuando fallas se reinicia a una posición para que aciertes.

	</body>
</html>