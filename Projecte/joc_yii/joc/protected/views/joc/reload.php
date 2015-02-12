<style>
.btn {
height: 22px; 
width: 22px;   
background-image:url('../img/available.png');
background-repeat:no-repeat;
background-color: #fff;
border:none;
}
</style>
<?php
$rows = Yii::app()->db->createCommand()
    ->select('username,hash')
    ->from('cruge_user')
    //->where('id=:id', array(':id'=>$id))
    ->queryAll();
  //  print_r($rows);
/*
 $connect = mysql_connect("127.0.0.1","root", "sra-45-ls");
    if (!$connect) {
          die(mysql_error());
    }
      mysql_select_db("joc");
      $results = mysql_query("SELECT * FROM cruge_user");*/
      if (isset(Yii::app()->user->email)){
			$email = Yii::app()->user->email;
			$user = Yii::app()->user->um->loadUser($email);
			$_s = Yii::app()->user->um->findSession($user);
			
			
			$user= $user->username;
			
			}else{
			echo "que fots aqui";
			}
      
      echo "<table id='connect_table' border=1 style='width:300px'>
                <tr>
                  <td>Username</td>
                  <td>Estat</td> 
                </tr><tr>";
      foreach ($rows as $key => $valor) {
      foreach ($valor as $col => $valors) {
		if($col=='username'){
		$username=$valors;
		if($username!=$user){
		echo "<td>".$valors."</td>";
		}
		}
		//  $( document ).ready(function() {
		if($col=='hash'){
		  if($valors!=""){
		  if($username!=$user){
		  //echo "<td><button id='connect' value='\"$valors\"' type='button'>PLAY</button></td>";
		  echo "<td><button title='clica per jugar' class='btn' id='connect' onclick='envia_hash(\"$valors\")' type='button'></button></td>";
		  echo "</tr>";
		  }
		}else {
			echo "<td><img title='desconectat' src='../img/disable.png'></td>";
			echo "</tr>";
		}
		}
		
      }
    }
   /*   while($row = mysql_fetch_array($results)) {
           $hash=$row["hash"];
           if($hash!=""){
           echo "<td>".$row["username"]."</td>";
           echo "<td><button id='connect' onclick='envia_hash(\"$hash\")' type='button'>PLAY</button></td>";
           echo "</tr>";
           }
      }*/
?>
