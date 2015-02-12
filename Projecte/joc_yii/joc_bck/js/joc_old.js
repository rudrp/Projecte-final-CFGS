//$(document).ready(function() {
  var conn;
  json_ids=[];
  // Connect to PeerJS, have server assign an ID instead of providing one
  var peer = new Peer({key: 'lwjd5qra8257b9', debug: true});
  peer.on('open', function(id){
    $('#pid').text(id);
    //modificar nick per valor d'usuari loguejat
    json_ids.push({"username":user,"hash": id});
    json_ids=JSON.stringify(json_ids);
    console.log(json_ids+"json_ids");
    $.post("actualitza",{json: json_ids}, function(data){
      console.log("data="+data);
    });
    //window.location.replace("sala.php");
  });  
  // Await connections from others
  peer.on('connection', connect);
  function connect(c) {
    $('#chat_area').show();
    conn = c;
    $('#messages').empty().append('Now chatting with ' + conn.peer);
    conn.on('data', function(data){
      $('#messages').append('<br>' + conn.peer + ':<br>' + data);
    });
    conn.on('close', function(err){ alert(conn.peer + ' has left the chat.') });
  }
    //funcioqe passi hash
   function envia_hash(hash){
       var c = peer.connect(hash);
        c.on('open', function(){
          connect(c);
        });
        c.on('error', function(err){ alert(err) });  

    }
    // Conect to a peer
    /*$('#connect').click(function(){
      var c = peer.connect($('#rid').val());
      c.on('open', function(){
        connect(c);
      });
      c.on('error', function(err){ alert(err) });  
    });*/

    // Send a chat message
    $('#send').click(function(){
      var msg = $('#text').val();
      conn.send(msg);
      $('#messages').append('<br>You:<br>' + msg);
      $('#text').val('');
    });
    // Show browser version
    $('#browsers').text(navigator.userAgent);
 
 // });
