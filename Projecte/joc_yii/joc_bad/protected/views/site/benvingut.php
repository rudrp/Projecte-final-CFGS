<?php
/* @var $this SiteController */
/* @var $model LoginForm */
/* @var $form CActiveForm  */

$this->pageTitle=Yii::app()->name . ' - Benvingut';
$this->breadcrumbs=array(
	'Benvingut',
);
?>
<?php

ini_set('display_errors','On'); ini_set('error_reporting','E_ALL | E_STRICT'); error_reporting(E_ALL);
?>

<h1>Benvingut</h1>

<?php 
		
		if (isset(Yii::app()->user->email)){
			$email = Yii::app()->user->email;
			$user = Yii::app()->user->um->loadUser($email);
			$_s = Yii::app()->user->um->findSession($user);
			echo "<p>Hola ".$user->username.", benvingut a la pàgina web, prova de jugar al joc </p>";
			}else{echo "que fots aqui";}

?>





