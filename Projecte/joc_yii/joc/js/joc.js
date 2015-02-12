  //variables 
  var enemyYPositions = [];
  var enemyXPositions = [];
  var x_enemie=[];
  var y_enemie=[];
  var avatarX = 400;
  var avatarY = 100;
  var avatar2x = 320;
  var avatar2y = 100;
  var img_avatar;
  var img_enemy;
  var img_explosion;
  var master;
  var json_ids=[];
  var pixels;
  var token= Math.floor((Math.random() * 100) + 1);
  var aux = token;
  var num_enemies=0;
  var local_mov;
  var connectedPeers = {};
  var timer;
  var id_;
  
  //videocall
  navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia;
  
	      
  
  // Connect to PeerJS, have server assign an ID instead of providing one
  // Showing off some of the configs available with PeerJS :).
  //connexió al PeerJS server 
  var peer = new Peer({
      // Set API key for cloud server (you don't need this if you're running your own.
      key: 'x7fwx2kavpy6tj4i',
      debug: 3,
  });

  //id aleatori
  peer.on('open', function(id){
      $('#pid').text(id);
      id_=id;
      json_ids.push({"username":user,"hash": id});
      json_ids=JSON.stringify(json_ids);
      //console.log(json_ids+"json_ids");
      
      //webservice
      $.post("actualitza",{json: json_ids}, function(data){/*console.log("data="+data);*/});    
  });
  
    // Receiving a call
    peer.on('call', function(call){
      // Answer the call automatically (instead of prompting user) for demo purposes
      call.answer(window.localStream);
      step3(call);
    });
    
    peer.on('error', function(err){
      alert("No està disponible en aquest moment");
      $('#step1, #step3').hide();
    });

    $('#end-call').click(function(){
      $('#load_tweets').removeClass('hidden');
       $('#contains').addClass('hidden');
      window.existingCall.close();
      $('#step1, #step3').hide();
    });

      // Retry if getUserMedia fails
    $('#step1-retry').click(function(){
       $('#step1-error').hide();
       step1();
    });

    // Get things started
    step1();

    function step1 () {
      // Get audio/video stream
      navigator.getUserMedia({audio: true, video: true}, function(stream){
        // Set your video displays
        $('#my-video').prop('src', URL.createObjectURL(stream));

        window.localStream = stream;
        $('#step1, #step3').hide();
      }, function(){ $('#step1-error').show(); });
    }

    function step3 (call) {
      // Hang up on an existing call if present
      if (window.existingCall) {
        window.existingCall.close();
      }

      // Wait for stream on the call, then set peer video display
      call.on('stream', function(stream){
        $('#their-video').prop('src', URL.createObjectURL(stream));
      });

      // UI stuff
      window.existingCall = call;
      $('#their-id').text(call.peer);
      call.on('close', $('#step1, #step3').hide());
      $('#step1').hide();
      $('#step3').show();
    }

  //receive connetions
  peer.on('connection', connect);

  // Handle a connection object.
  function connect(c) {
    
    // Handle a chat connection.
    if (c.label === 'chat') {
      
      $('#load_tweets').addClass('hidden');
      $('#contains').removeClass('hidden');
      /*CREACIÓ DEL XAT MOSTRANT ID DEL CLIENT */
      var chatbox = $('<div></div>').addClass('connection').addClass('active').attr('id', c.peer);
      var header = $('<h1></h1>').html('Chat with <strong>' + c.peer + '</strong>');
      var messages = $('<div><em>Connexió establerta.</em></div>').addClass('messages');
      //c.peer id del client.
      
      
      //append dels atributs creats anteriorment
      chatbox.append(header);
      chatbox.append(messages);
  
      //Quant fem click a chatbox...
      chatbox.on('click', function() {
      //Si l'index de l'atribut "active" és igual a -1 
      if ($(this).attr('class').indexOf('active') === -1)
      {
        //si no existeix afeigeix la Classe sino elimina la classe.
        $(this).addClass('active');
      }
      else
      {
        $(this).removeClass('active');
      }
      });
      
      
      //afegim el xat al div a connections
      $('#connections').append(chatbox);

      
      //L'event data s'envia quan es reben les dades de connexió
      c.on('data', function(data)
      {
        //append dels missatges que envien
        messages.append('<div><div class="bubble you">' + c.peer + ': '+ data +'</div></div>');
      });

      //si actualitza la pag o marxa la connexió és queda close.
      c.on('close', function(){
	    //alert que t'avisa que l'usuari ha marxat de la pàgina
	    alert("L'usuari amb id: "+c.peer + "s'ha desconnectat.");
	    $('#load_tweets').removeClass('hidden');
	     $('#contains').addClass('hidden');
	    //elimina el chat
	    chatbox.remove();
	    
	    //eliminar/finalitza "la connexió" (el client) de la variable connectedPeers
	    //console.log("c.peer left"+connectedPeers[c.peer]);
	    delete connectedPeers[c.peer];
      });
      
    }
    else if (c.label === 'Joc_connection'){ 

        //connexió OK--inciar el joc
        setUpGame(); //iniciem el joc
        timer=setInterval(joc,25); //fem set interval cada 25 milisegons el pk el joc pinti i esborri.

        c.on('data', function(data)
	{
               var json = JSON.parse(data);
	       
               if(aux>parseInt(json["token"]))
	       {
                    master=true;
               }
               else
	       {
                    master=false;
               }

              
                if(json["coord_enemies_x"]!=undefined)
		{
                  if(master==false)
                  {
                    x_enemics=json["coord_enemies_x"];
                    y_enemics=json["coord_enemies_y"];
                    num_enemies=json["num_enemies"];
                    x_avatar=json["avatarX"];
                    y_avatar=json["avatarY"];
                    
                    accions_joc(x_enemics,y_enemics,num_enemies,x_avatar,y_avatar,avatar2x,avatar2y);
                  
                  }
                }

                if(master==true)
		{
                  if(local_mov!=undefined)
                  {
                    json_local=JSON.parse(local_mov);
                    x_enemics=json_local["coord_enemies_x"];
                    y_enemics=json_local["coord_enemies_y"];
                    num_enemies=json_local["num_enemies"];
                    accions_joc(x_enemics,y_enemics,num_enemies,avatarX,avatarY,json["avatar2x"],json["avatar2y"]);
                  }
                }
            });

            c.on('close', function(){
                //alert que t'avisa que l'usuari ha marxat de la pàgina
                $('#load_tweets').removeClass('hidden');
		 $('#contains').addClass('hidden');
                console.log(c.peer + ' close.');
            });
    };

    connectedPeers[c.peer] = 1;
  }
  

   // Connect to a peer
   //funcio qe passa hash des de fitxer reload
   function envia_hash(hash)
   {
     //hidden_contingut
     $( "#contingut_joc" ).show();
     //videocall
     var call = peer.call(hash, window.localStream);
     requestedPeer = hash;
     
     if (!connectedPeers[requestedPeer])
     {
          // Create 2 connections, one labelled chat and another labelled file.
            var c = peer.connect(requestedPeer, {
              label: 'chat',
              serialization: 'none',
              metadata: {message: 'hi i want to chat with you!'}
            });
	    
	    //creació de les dos connexions//
	      
	    c.on('open', function() {
	      connect(c);
	    });
	    
	    c.on('error', function(err) { 
	      alert(err); 
	      
	    });
	      
	    //connexió per els enemics
	    var f = peer.connect(requestedPeer, {
              label: 'Joc_connection',
              serialization: 'none',
              metadata: {message: 'mov'}
            });
            
            f.on('open', function() {
              connect(f);
            });

            f.on('error', function(err) { alert(err); });
            }
            
            connectedPeers[requestedPeer] = 1;

	    //videocall
            step3(call);
        };

    // Send a chat message to all active connections.
   $( document ).ready(function() {
	  $('#send').on('submit', function(e){
	      e.preventDefault();
	      e.stopPropagation();
	      // For each active connection, send the message.
	      var msg = $('#text').val();
	      eachActiveConnection(function(c, $c)
	      {
		if (c.label === 'chat')
		{
		  c.send(msg);
		  $c.find('.messages').append('<div><div class="bubble me">You:' + msg + ' </div></div>');
		}
	      });
	  $('#text').val('');
	  $('#text').focus();
	});
      });
   
   	  velx=[];
	  vely=[];
      function joc() {

      eachActiveConnection(function(c, $c) {

       if (c.label === 'Joc_connection') {
	 
          //document.getElementById("gameCanvas").addEventListener("mousemove", mouse_avatar2);
	 
          c.send(JSON.stringify({"token":token,"avatar2x":avatar2x,"avatar2y":avatar2y}));
          
          num_enemies = enemyXPositions.length;
	  for (var i = 0; i < num_enemies; i++) {
	    velx.push(2);
	    vely.push(2);
	  };

          if (Math.random() < 1/20)
          {
            enemyYPositions.push(Math.random() * 336);
            enemyXPositions.push(Math.random() * 800);
          }
	  for(current_enemies=0;current_enemies<num_enemies;current_enemies++){
	      enemyYPositions[current_enemies]+=vely[current_enemies];
	      enemyXPositions[current_enemies]+=velx[current_enemies];
	      if(enemyYPositions[current_enemies]<=0 || enemyYPositions[current_enemies]+32>=336){vely[current_enemies]= vely[current_enemies]*-1;}
	      if(enemyXPositions[current_enemies]<=0 || enemyXPositions[current_enemies]+32>=800){velx[current_enemies]= velx[current_enemies] *-1;} 
	  }
        
          //el master s'encarrega d'enviar les coordenades
          if(master==true){
          //document.getElementById("gameCanvas").addEventListener("mousemove", handleMouseMovement);
          c.send(JSON.stringify({"coord_enemies_x" : enemyXPositions, "coord_enemies_y": enemyYPositions, "num_enemies":num_enemies,"avatarX":avatarX,"avatarY":avatarY}));
          //desas les dades amb els moviments que envies.
          local_mov=JSON.stringify({"coord_enemies_x" : enemyXPositions, "coord_enemies_y": enemyYPositions, "num_enemies":num_enemies});
        	    
	  }

        }
       });
    };
    
    // Goes through each active peer and calls FN on its connections.
    //passa per els interlocutors actius i agafa FN
    function eachActiveConnection(fn) {
      var actives = $('.active');
      //var per les ids...
      var checkedIds = {};
            
      //funció que agafa les connexions actives.
      actives.each(function() {
        

     //id de l'oponent
     peerId = $(this).attr('id')

     //si la connexions actives son diferent al peerID la meva id
     if(peerId!=undefined){
      if (!checkedIds[peerId]) {
	 
	    var conns = peer.connections[peerId];
	    for (var i = 0, ii = conns.length; i < ii; i += 1) {
	      var conn = conns[i];
	      fn(conn, $(this));
	    }
	
      }
      }

      checkedIds[peerId] = 1;
          });
    }

    // Make sure things clean up properly.//netejar
    window.onunload = window.onbeforeunload = function(e) {
      if (!!peer && !peer.destroyed) {
      peer.destroy();
	  }
	};

    

  //funcions del joc
	
	
	
	
  function setUpGame() {
    //document.getElementById("gameCanvas").addEventListener("mousemove", handleMouseMovement);
    var gameCanvas = document.getElementById("gameCanvas");
    
    //gameCanvas.style.backgroundImage = 'url(../img/bac.jpg)';
    img_avatar = new Image();
    img_avatar2 = new Image();
    img_enemy = new Image();
    img_explosion = new Image();
    img_enemy.src = "../img/enemy3.png";
    img_avatar.src = "../img/avatar.png";
    img_avatar2.src = "../img/avatar2.png";
    img_explosion.src = "../img/d.png";
    
    //gameCanvas.getContext("2d").drawImage(img_avatar, Math.random() * 100, Math.random() * 100);
    //gameCanvas.getContext("2d").drawImage(img_avatar2, Math.random() * 100, Math.random() * 100);
    img_enemy.enabled=true;
    
  }

$( document ).ready(function() {
  
$(document).keydown(function(evt) {
    switch(evt.which) {
      
      //teu tecles:fletxes
      case 37:
	if(avatarX>0){
	  avatarX=avatarX-15;
	}
	evt.preventDefault();
	return false;
        break;
      case 38:
	if(avatarY>0){
	  avatarY=avatarY-15;
	}
	evt.preventDefault();
	return false;
        break;
      case 39:
	if(avatarX+32<800){
	  avatarX=avatarX+15;
	}
	evt.preventDefault();
	return false;
        break;
      case 40:
	if(avatarY+32<336){
	  avatarY=avatarY+15;
	}
	evt.preventDefault();
	return false;
        break;
      //enemic tecles:asdw
	
      case 65:
	if(avatar2x>0){
	  avatar2x=avatar2x-15;
	}
        break;
      case 87:
	if(avatar2y>0){
	  avatar2y=avatar2y-15;
	}
        break;
      case 68:
	if(avatar2x+23<800){
	  avatar2x=avatar2x+15;
	}
        break;
      case 83:
	if(avatar2y+43<336){
	  avatar2y=avatar2y+15;
	}
        break;

    }

});

});
/*
function handleMouseMovement(mouseEvent) {
        avatarX = mouseEvent.offsetX;
        //avatarY = mouseEvent.offsetY;
	avatarY= 300;
 }

 function mouse_avatar2(mouseEvent) {
        avatar2x = mouseEvent.offsetX;
        //avatar2y= mouseEvent.offsetY;
	avatar2y = 300;
 }
 */

 function accions_joc(x_enemie,y_enemie,num_enemies,avatarX,avatarY,avatar2x,avatar2y)
   {
      vides_master=5;
      vides_esclau=5;
      guanyador="";

      enemies=["../img/peanut.png","../img/enemy.png","../img/enemy2.png","../img/enemy3.png","../img/peanut.png","../img/enemy4.png","../img/enemy5.png","../img/enemy6.png","../img/enemy7.png","../img/enemy8.png"]
      var gameCanvas = document.getElementById("gameCanvas");
      //gameCanvas.width = 800;   //this erases the contents of the canvas
      gameCanvas.getContext("2d").clearRect(0,0,800,336 );
      gameCanvas.getContext("2d").drawImage(img_avatar, avatarX, avatarY);
      gameCanvas.getContext("2d").drawImage(img_avatar2, avatar2x, avatar2y);
     
             
      current_enemies = 0;
      i=0;
      while (current_enemies < num_enemies) {
          img_enemy.src=enemies[i];
	  
	  if(master==true){
	    gameCanvas.getContext("2d").drawImage(img_enemy, enemyXPositions[current_enemies],enemyYPositions[current_enemies]);
	    
	  }
	  if(master!=true){
	    
	    gameCanvas.getContext("2d").drawImage(img_enemy, x_enemie[current_enemies],y_enemie[current_enemies]);
	    
	  }
          
          current_enemies = current_enemies + 1;
          i=i+1;
          if(i==10){
            i=0;

          }
      }
      //apañu 
      gameCanvas.getContext("2d").clearRect(0,0,43,45 );
      
      current_enemies = 0;
      
      while (current_enemies < num_enemies) {
        //es quant xoca
        if (((avatarX < x_enemie[current_enemies] && x_enemie[current_enemies] < avatarX + 32) || (x_enemie[current_enemies] < avatarX && avatarX < x_enemie[current_enemies] + 32) ) && ( (avatarY < y_enemie[current_enemies] && y_enemie[current_enemies] < avatarY + 32) || (y_enemie[current_enemies] < avatarY && avatarY < y_enemie[current_enemies] + 32) ) )
	{
		   // delete x_enemie[current_enemies];
		   // delete y_enemie[current_enemies];
		   //master
		    var x= img_enemy.src;
		    if(x.search("peanut")>-1){
		      //console.log("heeey");
		      
		    }else{
		      //menus una vida
		    }
		    delete enemyXPositions[current_enemies];
		    delete enemyYPositions[current_enemies];
		    

         }
         if (((avatar2x < x_enemie[current_enemies] && x_enemie[current_enemies] < avatar2x + 23) || (x_enemie[current_enemies] < avatar2x && avatar2x < x_enemie[current_enemies] + 23) ) && ( (avatar2y < y_enemie[current_enemies] && y_enemie[current_enemies] < avatar2y + 43) || (y_enemie[current_enemies] < avatar2y && avatar2y < y_enemie[current_enemies] + 32) ) )
	 {
		    var y= img_enemy.src;
		    if(y.search("peanut")>-1){
		      //console.log("heeey");
		      //esclau
		    }else{
		      //menus una vida
		    }
		    delete x_enemie[current_enemies];
		    delete y_enemie[current_enemies];
		    delete enemyXPositions[current_enemies];
		    delete enemyYPositions[current_enemies];

         }
       
       current_enemies = current_enemies + 1;
       //suma cacauets
      //per fer nivells
      }
      
      
      //gameCanvas.getContext("2d").clearRect(0,0,43,45 );

  }
