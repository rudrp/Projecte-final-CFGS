 <script type="text/javascript"> 
/*window.onload = function() {  
	    $( "#connect" ).click(function() { 
	    alert($("#connect").val());
	    envia_hash($("#connect").val()); 
	    });
  }*/
  
//   $(document).load(envia_hash("lskjdaskl"));
//    $(document).ready(envia_hash("skdljsalkdas"));

//    window.onload = envia_hash("kfkfjskf");
   
//    $(window).on('load', function() { alert($("#connect").val()); envia_hash("kjdfklsdjfkls"); });
	
</script>
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
                  <td>Hash</td> 
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
		  echo "<td><button id='connect' onclick='envia_hash(\"$valors\")' type='button'>PLAY</button></td>";
		  echo "</tr>";
		  }
		}else {
			echo "<td>USUARI NO DISPONIBLE</td>";
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
