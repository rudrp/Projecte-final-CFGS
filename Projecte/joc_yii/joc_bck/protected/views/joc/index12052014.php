<!DOCTYPE HTML> 
<html lang="en"> 
<head>
<title>PeerJS chat demo</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<meta http-equiv="Content-Language" content="en-us"> 

<link href="css/fancy.css" rel="stylesheet" type="text/css">

<!--CONNEXIÓ + JOC REAL TIME -->
<script src="js/joc.js"></script>
<script src="http://cdn.peerjs.com/0.3/peer.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="dist/peer.min.js"></script>
</head> 
 
<body> 
<?php 
  echo Yii::app()->request->baseUrl."<br/>" ;
print_r(Yii::app()->request->baseUrl);
echo "<br/>";
var_dump(Yii::app()->getBaseUrl(true));
echo "<br/>";
echo Yii::app()->request->getBaseUrl(true);

?>

  <!-- ACCIONS DE SOBRE LA CONNEXIÓ -->
  <div id="actions">
    <!-- ID's de connexió -->
    Your PeerJS ID is <span id="pid"></span>
    <br>
    Connect to a peer: <input type="text" id="rid" placeholder="Someone else's id">
    <input class="button" type="button" value="Connect" id="connect">
    <br><br>

    <!-- Formulari per enviar missatges a l'oponent -->
    <form id="send">
      <input type="text" id="text" placeholder="Enter message">
      <input class="button" type="submit" value="Send to selected peers">
    </form>
    
    <!-- Abandona la partida -->
    <button id="close">Close selected connections</button>
  </div>

  <div class="pure-g">

      <!-- Video area -->
      <div class="pure-u-2-3" id="video-container">
        <video width="200" height="250" position="right" id="their-video" autoplay></video>
        <video width="200" height="250" position="left" id="my-video" muted="true" autoplay></video>
      </div>


          
        




      <!-- Steps -->
      <div class="pure-u-1-3">

        <!-- Get local audio/video stream -->
        <div id="step1">
         <p>Please click `allow` on the top of the screen so we can access your webcam and microphone for calls.</p>
          <div id="step1-error">
            <a href="#" class="button" id="step1-retry">Try again</a>
          </div>
        </div>

        <!-- Call in progress -->
        <div id="step3">
          <p>Currently in call with <span id="their-id">...</span></p>
          <p><a href="#" class="button" id="end-call">End call</a></p>
        </div>
      </div>
  </div>

  
  <!-- id que avisa que no hi ha cap connexió establerta -->
    <div id="wrap">
      <div id="connections">
	<span class="filler">NO HI HA CONNEXIONS ENCARA..</span></div>
      <div class="clear">
    </div>
  </div>
  <!-- FI DE LES ACCIONS -->
  
  
  <!-- DIV ON ES TROBA EL CANVAS / JOC -->
  <div id="box" style="background: #fff; font-size: 18px;padding:40px 30px; text-align: center;">
    <canvas id="gameCanvas" width="400" height="300"></canvas>
  </div>
  
  <!-- VERSIÓ DEL NAVEGADOR UTILITZAT I REQUERIMENTS DE NAVEGADOR -->
  <div class="warning browser">
    <div class="important">Your browser version: <span id="browsers"></span><br>
  Currently <strong>Firefox 22+ and Google Chrome 26.0.1403.0 or above</strong> is required.</strong></div>
  Status</a><br/>

  
  <!-- DIV AMB INFO DE L'ESTAT DE LA CONNEXIÓ -->
  <div class="log" style="color:#FF7500;text-shadow:none;padding:15px;background:#eee"><strong>Connection status</strong>:<br></div>
</div>
</body> 
</html> 