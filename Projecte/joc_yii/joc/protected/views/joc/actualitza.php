<?php 
if(isset($_POST['json'])) {
    $json = $_POST['json'];
    $json = json_decode($json);
  
    foreach ($json as $key => $value) {
    	foreach ($value as $clau => $valor) {
    		if($clau=="username"){
    			$username=$valor;
    		}
    		if($clau=="hash"){
    		
    		$connection = yii::app()->db;
		$sql = "UPDATE cruge_user SET hash='$valor' WHERE username='$username'";
		$command=$connection->createCommand($sql);
		$command->execute();
    		
    			/*mysqli_query($con,"UPDATE cruge_user SET hash='$valor'
				WHERE username='$username'");*/
    		}
    	}
    }


 }
?>
