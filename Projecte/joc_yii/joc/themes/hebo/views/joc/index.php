<!DOCTYPE HTML> 
<head>
  <title>Real-time</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
  <script src="http://cdn.peerjs.com/0.3/peer.js"></script>
  <link href="<?php echo Yii::app()->request->baseUrl;?>/css/fancy.css" rel="stylesheet" type="text/css">
  <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl;?>/dist/peer.min.js"></script>
</head> 

<style type="text/css">
  span.hidden{visibility:hidden;}
  canvas{background-image:url('../img/bac.jpg');}
</style>
<?php 
if (isset(Yii::app()->user->email))
{
	$email = Yii::app()->user->email;
	$user = Yii::app()->user->um->loadUser($email);
	$_s = Yii::app()->user->um->findSession($user);
	$my_json = json_encode((array) $user);
	if (isset($_GET["page"])){
	$page = $_GET["page"]; 
	}else{
	$page=0;}
	$_SESSION['page'] = $page;
	
}
?>

<script type="text/javascript"> 
 var Data=<?php echo $my_json; ?>;
 var user=Data["\u0000CActiveRecord\u0000_attributes"].username;

</script>


<script src="<?php echo Yii::app()->request->baseUrl;?>/js/joc.js"></script>

 
<body> 

<script type="text/javascript">
    var auto_refresh = setInterval(
      function ()
      {
	$('#load_tweets').load('<?php echo Yii::app()->request->baseUrl;?>/joc/reload?page?=<?php echo $page; ?>').fadeIn("slow");
      }, 3000); //refresh
</script>
 <!-- DIV ON ES TROBA EL CANVAS / JOC -->
<div id='contains' class="hidden">
  <div id="box" style="background: #fff; font-size: 18px;padding:40px 30px; text-align: center;">
    <canvas id="gameCanvas" width="800" height="336"></canvas>
  </div>
	<div id="connections" >
	<!-- Formulari per enviar missatges a l'oponent -->
	<form id="send">
	  <input class="search-query" type="text" id="text" placeholder="Escriu un missatge...">
	  <input class="button btn-warning "  type="submit" value="envia">
	</form>
	</div>
	
	<span class="hidden" id="pid"></span><br/>

      <!-- Video area -->
        <video width="200" height="250" position="right" id="their-video" autoplay></video>
        <video width="200" height="250" position="left" id="my-video" muted="true" autoplay></video>

      <!-- Steps -->
      <div class="pure-u-1-3">
	    <!-- Get local audio/video stream -->
	    <div id="step1">
	      <div id="step1-error">
		<!--<a href="#" class="button" id="step1-retry">Try again</a>-->
	      </div>
	    </div>

	    <!-- Call in progress -->
	    <div id="step3">
	      <!--<p>Currently in call with <span id="their-id">...</span></p>-->
	      <!--<p><a href="#" class="button" id="end-call">End call</a></p>-->
	    </div>
      </div>  
</div>
<div id="load_tweets"><img src="../img/load.gif"></div>
</body> 
</html> 