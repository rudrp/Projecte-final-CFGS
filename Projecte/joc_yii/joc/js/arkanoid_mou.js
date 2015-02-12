	var FRAMES_PER_SEGON = 33;
	var MAX_PILOTES=1;
	var CANVAS_WIDTH=513;
	var CANVAS_HEIGHT=300;
	var X_MINIMA_INICIAL=20;
	var Y_MINIMA_INICIAL=100;
	var RADI=5;
	var VELOCITAT_MAXIMA_X=10;
	var VELOCITAT_MAXIMA_Y=10;
	var VELOCITAT_MINIMA_X=1;
	var VELOCITAT_MINIMA_Y=1;
	var VERMELL=0;
	var TARONJA=1;
	var GROC=2;
	var VERD=3;
	var BLAU=4;
	var LILA=5;
	var GRIS=6;
	var BLANC=7;
	var yi=280;
	var xi=180;
				var array_colors= 	{"vermell":0,"taronja":1,"groc":2,"verd":3,"blau":4,
									 "lila":5,"gris":6,"blanc":7
									};
									
				var posicio_atlas = []; // posició imatges en l'atlas x:inici x, y:inici y, w:amplada, h:alçada
				posicio_atlas[array_colors.vermell] = {x:0, y:32,w:32,h:16};
				posicio_atlas[array_colors.taronja] = {x:32,y:32,w:32,h:16};					
				posicio_atlas[array_colors.groc] =    {x:64,y:32,w:32,h:16};
				posicio_atlas[array_colors.verd] =    {x:96,y:32,w:32,h:16};
				posicio_atlas[array_colors.blau] =    {x:0, y:48,w:32,h:16};
				posicio_atlas[array_colors.lila] =    {x:32,y:48,w:32,h:16};
				posicio_atlas[array_colors.gris] =    {x:64,y:48,w:32,h:16};
				posicio_atlas[array_colors.blanc] =   {x:96,y:48,w:32,h:16};
	var rajoles = [];

$(document).ready(function() {	

var Canvas_class=function(id) {

  this._canvas = $("#"+id); //Privat
  this.canvasWidth = this._canvas.width();
  this.canvasHeight = this._canvas.height();
  this.context = this._canvas.get(0).getContext("2d");//public
  this.atlas = $("#atlas")[0];
  /*
   var canvas = $('#myCanvas') gets you a jQuery extended object and not a native DOM element object that has member functions like getContext etc. For this, you need to get the canvas element using var canvas = $('#myCanvas')[0] 
   NOTE: var canvas = document.getElementById('myCanvas'); is equivalent to var canvas = $('#myCanvas')[0]
  */

  this.resizeCanvas=function() {
		canvas.attr("width", CANVAS_WIDTH);//$(window).get(0).innerWidth);
		canvas.attr("height", CANVAS_HEIGHT);//$(window).get(0).innerHeight);
		
		this.canvasHeight = canvas.width();
		this.canvasHeight = canvas.height();
	};
	

  this.dibuixa_raqueta=function(xi,yi) {
	this.context.drawImage(this.atlas,0,0,65,18,xi,yi,55,26);
    };
	
	
	
  this.dibuixaPilota=function(x,y,radi,color){
   			/*this.context.fillStyle = color;
			this.context.beginPath();
			this.context.arc(x, y, radi, 0, Math.PI*2);
			this.context.closePath();
			this.context.fill(); */
			this.context.drawImage(this.atlas,64,0,16,16,x,y,radi*2,radi*2);
  }

  this.esborra=function(){
    this.context.clearRect(0, 0, this.canvasWidth,this.canvasHeight);  
  }

	this._dibuixa_rajola=function(x,y,w,h,color,mostra) {
						if(mostra) {							
								this.context.drawImage(this.atlas,						
								posicio_atlas[color].x,posicio_atlas[color].y,
								posicio_atlas[color].w,posicio_atlas[color].h,
								x,y,w,h);
							}
					}
					
	this.dibuixa_rajoles=function() {
						for(var i=0;i<rajoles.length;i++) {
							this._dibuixa_rajola(rajoles[i].x,rajoles[i].y,
												rajoles[i].w,rajoles[i].h,
												rajoles[i].color,rajoles[i].mostra);
						};
					}
		

}

var Pilota_class=function(x, y, radius,  vX, vY, aX, aY,color) {

		this.x = x;
		this.y = y;
		this.radius = radius;		
		this.vX = vX;
		this.vY = vY;
		this.aX = aX;
		this.aY = aY;
		this.color = color;

  this.retorna_dades=function(){

		return " x="+this.x.toFixed(2)+" y="+this.y.toFixed(2)+
			" radi="+this.radius.toFixed(2)+
			" vX="+this.vX.toFixed(2)+" vY="+this.vY.toFixed(2)+
			" aX="+this.aX.toFixed(2)+" aY="+this.aY.toFixed(2)+
			" color="+this.color;
		
   }
      

   
     this.mou=function(){
			x_vell=this.x ;
			y_vell=this.y;
			this.x += this.vX;
			this.y += this.vY;
			
			// Add acceleration to velocity
			if (Math.abs(this.vX) <VELOCITAT_MAXIMA_X) {
				this.vX += this.aX;
			};
			
			if (Math.abs(this.vY) < VELOCITAT_MAXIMA_Y) {
				this.vY += this.aY;
			};
			
			
			// Boundary collision checks
			if (this.x-this.radius < 0) {
				this.x = this.radius; // Move away from the edge
				this.vX *= -1;
				this.aX *= -1*((Math.random()*1)+1);
			} else if (this.x+this.radius > myCanvas.canvasWidth) {
				this.x = myCanvas.canvasWidth-this.radius; // Move away from the edge
				this.vX *= -1;
				this.aX *= -1*((Math.random()*1)+1);
			};
			
			if (this.y-this.radius < 0) {
				this.y = this.radius; // Move away from the edge
				this.vY *= -1;
				this.aY *= -1*((Math.random()*1)+1);;
			} /*else if (this.y+this.radius > myCanvas.canvasHeight) {
				this.y = myCanvas.canvasHeight-this.radius; // Move away from the edge
				this.vY *= -1;
				this.aY *= -1*((Math.random()*1)+1);;
			};  */
			else if (this.y+this.radius+2>yi && this.x>xi && this.x<xi+55) {
			      this.y = yi-this.radius*2;
				  this.vY = this.vY*(-1);
				  this.aY = this.aY*(-5);
				  
			  }
			  else if (this.y+this.radius>300){
			  /*this.y=10;
			  this.vY = this.vY*(-1);
			  this.aY = this.aY*(-5); */
			  this.y=200;
			  };    

			//alert(1);
			//this.dibuixaRentangleGuia(x_vell,y_vell,this.x,this.y);
    this.comprovaXoc=function(x_rajola,y_rajola,w_rajola,h_rajola,x_pilota,y_pilota,radius){
	    if (x_rajola<=x_pilota && x_pilota<=(x_rajola+w_rajola) &&
	        y_rajola<=y_pilota && y_pilota<=(y_rajola +h_rajola)
			)
	      return true;
    }
    
  }
  
  				var Rajola_class=function(x,y,w,h,color,mostra) {
				  this.x=x;
				  this.y=y;
				  this.w=w;
				  this.h=h;
				  this.color=color
				  this.mostra=mostra
				}

  
		
}

var Rajola_class=function(x,y,w,h,color,mostra) {
				  this.x=x;
				  this.y=y;
				  this.w=w;
				  this.h=h;
				  this.color=color
				  this.mostra=mostra
				}
	var myCanvas=new Canvas_class("myCanvas");  
  
	var startButton = $("#startAnimation");
	var stopButton = $("#stopAnimation");
	var canvas = $("#myCanvas");

	startButton.hide();
	myCanvas.resizeCanvas();
	
	var array_asteroids = new Array();
	omple_dades_asteroids(array_asteroids);
	
	var playAnimation = true;
	animate();		
	
	startButton.click(function() {
		$(this).hide();
		stopButton.show();
		
		playAnimation = true;
		animate();
	});
	
	stopButton.click(function() {5+Math.random()*10;
		$(this).hide();
		startButton.show();
		
		playAnimation = false;
	});
	
	function randomInterval(from,to){//Torna un enter entre from i to
	    return Math.floor(Math.random()*(to-from+1)+from);
	}
	

			
	// Array that holds all the asteroids to draw

	function omple_dades_asteroids(array_asteroids){

	// Setting up some asteroids
	  for (var i = 0; i < MAX_PILOTES; i++) {
		  var x = randomInterval(X_MINIMA_INICIAL,myCanvas.canvasWidth-40);
		  var y = randomInterval(Y_MINIMA_INICIAL,myCanvas.canvasHeight-40);
		  var radius = RADI;	  
		  var vX = randomInterval(VELOCITAT_MINIMA_X,VELOCITAT_MAXIMA_X/3);
		  var vY = randomInterval(VELOCITAT_MINIMA_Y,VELOCITAT_MAXIMA_Y/3);
		  var aX = 0.01;
		  var aY = 0.01;
		  r=randomInterval(3,255);
		  g=randomInterval(3,255);
		  b=randomInterval(3,255);
		  color= "rgb("+r+","+g+","+b+")";
		  var meu_asteroid=new Pilota_class(x, y, radius,  vX, vY, aX, aY,color);
		  array_asteroids.push(meu_asteroid);
	  };
	} 
	

	var meucolor;
	var rajola;
	//omple el array rajoles
	for(var i=0;i<16;i++) {
		meu_color=array_colors.vermell;
		for(var j=0;j<=7;j++){
		rajola=new Rajola_class(i*32,16*j,32,16,meu_color,true);
		rajoles.push(rajola);
		meu_color++;
		}
	}
	
	// Animation loop that does all the fun stuff
	function animate() {					
		var missatge="";
		var asteroidsLength = array_asteroids.length;
		for (var i = 0; i < asteroidsLength; i++) {
			missatge+="Element "+i+":"+array_asteroids[i].retorna_dades()+"</br>";
		}
		$("#dades").html(missatge);
		//Esborra el canvas
		myCanvas.esborra();
		pilota = array_asteroids[0];
		x0=pilota.x;
		y0=pilota.y;

			pilota.mou();
			var color=pilota.color;
			myCanvas.dibuixa_raqueta(xi,yi);
			myCanvas.dibuixaPilota(pilota.x, pilota.y, pilota.radius,color);
	
		
		x1=pilota.x;
		y1=pilota.y;	

		//comprovaXoc
		m=(y1-y0)/(x1-x0);
		b=y0-m*x0;
		
		if (x0>x1) //Si x0>x1, intercanviem x1<->x0 i x0<->x1
			{tmp_x0=x0;
			 tmp_y0=y0;
			 x0=x1;
			 y0=y1;
			 x1=tmp_x0;
			 y1=tmp_y0;
			//alert("major");
			}
		xoc=false;
		for (x=x0;x<=x1 && !xoc  ;x++){//Calcula la x de la recta entre x0 i x1
			y=m*x+b; //Calcula la y
				for(var i=0;i<rajoles.length && !xoc ;i++) {//Mira si xoca la pilota i alguna rajola
					if (rajoles[i].mostra && pilota.comprovaXoc(
							rajoles[i].x,rajoles[i].y,
							rajoles[i].w,rajoles[i].h,
							x, y, pilota.radius			
							)
						)
						{xoc=true; //Ha xocat!
						rajoles[i].mostra=false;//Ha xocat
						pilota.x=x; //Movem la pilota
						pilota.y=y;
						pilota.vY*=-1; //Invertim velocitat
						pilota.aY*=-1; //Invertim acceleracio						
						};
				}
		}	
		myCanvas.dibuixa_rajoles();
			
		if (playAnimation) {		// Clear
			// Run the animation loop again in 33 milliseconds
			setTimeout(animate, 1 / FRAMES_PER_SEGON * 1000);
		};
		var Raqueta_class=function(id) {

  this._x = xi; //Privat

  this._y= yi; //Privat

  this.mou_dreta=function() {
				  if (this._x<=740 && this._x>=0) {
				  this._x=this._x+5;
				  }
				  if (this._x<0){
				  this._x=0;
				  }
				  if (this._x>740){
				  this._x=740;
				  }
				   xi = this._x;
				   yi = this._y;
	
    };

  this.mou_esquerra=function() {
				  if (this._x<=740 && this._x>=0) {
				  this._x=this._x-5;
				  }
				  if (this._x<0){
				  this._x=0;
				  }
				  if (this._x>740){
				  this._x=740;
				  }
				  
				  xi = this._x;
				  yi = this._y;
	
    };
      
}

canvas.mousemove(function(e){
      //:first selecciona el primer span, :last selecciona l'򬴩m span  
      $('span:last').text('e.pageX= '+e.pageX+' e.pageY= '+ e.pageY); 
				  if (xi<=460 && xi>=0) {
				  xi=e.pageX+80-110;
				  }
				  if (xi<0){
				  xi=0;
				  }
				  if (xi>460){
				  xi=460;
				  }
				  
				   });
var meva_raqueta = new Raqueta_class("myCanvas");
$(document).keydown(function(e) {
if (e.which==37) {
meva_raqueta.mou_esquerra();

}
if (e.which==39) {
meva_raqueta.mou_dreta();

}
if (e.which==32) {
pilota.mou()
}

 });
	};
	
	 // posició imatges en el canvas x:inici x, y:inici y, w:amplada, h:alçada

				



	
});
 
