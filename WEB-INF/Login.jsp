<%@ page import="com.bpsluwuOneApp.dto.*,java.util.*" session="false" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<title>BPS Kab. Luwu</title>
		<link rel="icon" href="/LogoBPSLuwu.png"/>
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.css">
		<script
		  src="https://code.jquery.com/jquery-3.1.1.min.js"
		  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
		  crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.js"></script> 
  		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<style>
			.main.container{
				margin-top:6em;
			}
		</style>
		<style>
			@keyframes bounceIn {
			  0% {
			    opacity: 0;
			    transform: scale(0);
			  }
			  20% {
			    opacity: 1;
			  }
			  40% {
			    transform: scale(1.15)
			  }
			  70% {
			    transform: scale(.9)
			  }
			  100% {
			    transform: scale(1);
			  }
			}

			@keyframes slideDown {
			  0% {
			    transform: translateY(-50px);
			    opacity: 0;
			  }
			  20% {
			    opacity: 1;
			  }
			  40% {
			    transform: translateY(5px);
			  }
			  70% {
			    transform: translateY(-3px);
			  }
			  100% {
			    transform: translateY(0);
			  }
			}

			@keyframes slideUp {
			  0% {
			    transform: translateY(50px);
			    opacity: 0;
			  }
			  20% {
			    opacity: 1;
			  }
			  40% {
			    transform: translateY(-3px);
			  }
			  70% {
			    transform: translateY(5px);
			  }
			  100% {
			    transform: translateY(0);
			  }
			}

			@keyframes spinIn {
			  0% {
			    opacity: 0;
			    transform: rotate(180deg) scale(0);
			  }
			  20% {
			    opacity: 1;
			  }
			  40% {
			    transform: rotate(360deg) scale(1.15)
			  }
			  70% {
			    transform: rotate(360deg) scale(.9)
			  }
			  100% {
			    transform: rotate(360deg) scale(1);
			  }
			}

			// unimportant, for display purposes only

			@import url('https://fonts.googleapis.com/css?family=Lato:900');
			#showcase_table {
			  display: table;
			  width: 100%;
			  height: 100%;
			}
			.bounce_in_animation {
			  text-align: left;
			  display: inline-block;
			  width: 100%;

			}
		</style>
	</head>
	<body>
		<div class="ui brown inverted icon labeled top fixed tiny menu">
			<div class="ui container">
				<div class="header item"><img src="LogoBPSLuwu.png"><i>BPS Luwu</i></div>
				<a class="item" id="toggle_menu"><i class="sidebar icon"></i>Menu</a>
				<a class="active item"><i class="home icon"></i>Home</a>
				<a class="item"><i class="at icon"></i>About</a>
<!--				
				<a class="right item" id="signin_button"><i class="sign in icon"></i>Sign in</a>
-->
			</div>
		</div>
		<div class="ui sidebar vertical left inverted menu" id="sidebar_menu">
			<div class="item">
				<a class="ui icon mini image" href="luwukab.bps.go.id">
					<img src="LogoBPSLuwu.png">
				</a>
				<a href="luwukab.bps.go.id"><b>BPS Luwu</b></a>
			</div>
			<div class="item">
				<div class="header">
					<b>Si Orens</b>
				</div>
				<div class="menu">
					<a class="item" href="/CutiSPD">Cuti & SPD</a>
					<a class="item" href="/KartuKendali">KartuKendali</a>
					<a class="item" href="http://bpsluwugoid.odoo.com">Surat</a>
					<a class="item" href="/Matriks">Matriks</a>
					<a class="item" href="/Presensi"><b>Presensi</b></a>
					<a class="item" href="/Notulen"><b>Notulen</b></a>
					<a class="item" href="/BukuTamu"><b>BukuTamu</b></a>
					<a class="item" href="http://webapps.bps.go.id/kipapp"><b>KipApp</b></a>
					<a class="item" href="http://sipecut.bps.go.id"><b>Sipecut</b></a>
				</div>
			</div>
			<a class="item" href="#"><b>About</b></a>
		</div>
		<div class="ui main container">
			<div class="ui inverted brown segment">
			<div class="ui vertically divided centered grid">
				<div class="row">
					<!-- <div class="ui three buttons">
						<div class="ui right labeled icon button"><i class="home icon"></i>Home</div>
						<div class="ui right labeled icon button"><i class="left arrow icon"></i>Home</div>
						<div class="ui right labeled icon button"><i class="right arrow icon"></i>Home</div>
					</div>
				-->
					<div class="content">
						<h2>Si Orens</h2>
						<div class="ui icon labeled mini compact menu">
							<a href="/CutiSPD" class="item"><i class="calendar times icon"></i>Cuti & SPD</a>
							<a href="/KartuKendali" class="item"><i class="motorcycle icon"></i>KartuKendali</a>
							<a href="http://bpsluwugoid.odoo.com" class="item"><i class="envelope icon"></i>Surat</a>
						</div>
						<div class="ui icon labeled mini compact menu">
							<a href="/Matriks" class="item"><i class="tasks icon"></i>Matriks</a>
							<a href="/Presensi" class="item"><i class="clipboard outline icon"></i>Presensi</a>
							<a href="/Notulen" class="item"><i class="file alternate k icon"></i>Notulen</a>
						</div>	
						<div class="ui icon labeled mini compact menu">
							<a class="item"><i class="blue address book outline icon"></i>BukuTamu</a>
							<a href="http://webapps.bps.go.id/kipapp" class="item"><i class="kickstarter k icon"></i>KipApp</a>
							<a href="http://sipecut.bps.go.id" class="item"><i class="stripe s icon"></i>Sipecut</a>
						</div>	

					</div>
				</div>
			</div>
			</div>
		</div>
		<br>
		<!-- html for login -->
		<div class="ui container">
			<div class="ui tiny modal" id="login_popup">
				<div class="header">
					<center>
						<div class="bounce_in_animation">BPS Luwu</div>
					</center>
					Login</div>
				<div class="content">
					<div class="ui form">
						<div class="field">
							<label>Username</label>
							<div class="ui left icon input">
								<input type="text" id="username_input">
								<i class="user icon"></i>
							</div>
						</div>
						<div class="field">
							<label>Password</label>
							<div class="ui left icon input">
								<input type="password" id="password_input">
								<i class="lock icon"></i>
							</div>
						</div>
					</div>
				<div class="ui hidden warning message" id="warning_process_login">
				  <div class="header">
				   	Error!
				  </div>
				  <span id="message_process_login"></span>
				</div>					
				</div>
				<div class="actions">
					<a class="ui blue labeled icon button" id="proceess_login_button"><i class="sign in icon"></i>Login</a>
				</div>
			</div>
		</div>
		<!-- html for login -->
	</body>
	<script type="text/javascript">
		/** 
		$(".ui.dimmer").dimmer("show");
		$("#stop_loading").click(function(){
			$("#dimmer_page").dimmer("hide");
		});
		**/
		$("#toggle_menu").click(function(){
			$("#sidebar_menu").sidebar("toggle");
		});
	</script>
	<script type="text/javascript">
        var tabledata = [];
   	</script>
    <script>
    	//login script
    			//========================== sign in button ========================
		//if not yet loggin
		$("#signin_button").click(function(){
			$("#login_popup").modal({"closable":false}).modal("show");
		});
		//if have log in
		$("#akun_dropdown").dropdown();
		//--------------------------------------------------------------//
		$("#proceess_login_button").click(function(){
			$("#proceess_login_button").addClass("disabled");
			$($("#proceess_login_button").find("i")[0]).removeClass("sign in");
			$($("#proceess_login_button").find("i")[0]).addClass("loading spinner");
			let username_input = $("#username_input").val();
			let password_input = $("#password_input").val();
			console.log(username_input+" - "+password_input);
			let jsonInput = {"username":username_input,"password":password_input};		
			console.log(JSON.stringify(jsonInput));
			$.ajax({url:"/api/login",method:"post",data:JSON.stringify(jsonInput),contentType:"application/json",success:function(response_data){
				try{
					let jsonResponse = JSON.parse(response_data);
					let response_status = jsonResponse.code;
					if(response_status == 0){
						$("#login_popup").modal("hide");
						location.assign("/");					
					} else {
						showWarningMessage(jsonResponse.status);
					}
					console.log(jsonResponse);
				} catch(ee){
					showWarningMessage("Terjadi Kesalahan.");
				} 
			},error:function(){
					showWarningMessage("Gagal, Periksa Koneksi Anda.");
			}}).always(function(){
				setTimeout(function(){			
					$("#proceess_login_button").removeClass("disabled");			
					$($("#proceess_login_button").find("i")[0]).removeClass("loading spinner");
					$($("#proceess_login_button").find("i")[0]).addClass("sign in");
				},500);
			});
		});
		function showWarningMessage(mssg){
			$("#message_process_login").html(mssg);
			$("#warning_process_login").removeClass("hidden");			
			$("#warning_process_login").addClass("visible");
		}
		$("#login_popup").modal({"closable":false}).modal("show");
    </script>
 	<script type="text/javascript">
		(function( $ ){
		  
		  $.fn.textAnimation = function( animation_speed, text_speed, animation ){
		    var text, i = 0;
		    var $this = $(this);
		    
		    // store text and clear
		    text = $this.text();
		    $this.css('white-space', 'pre');
		    $this.css({"height":"100%","font-family":"sans-serif","font-size":"17pt","text-transform":"uppercase","letter-spacing":"0.05em"});
		    $this.css({"width":"calc(9ch + 0.40em)"});
		    $this.html('');
		    
		    var addLetter = setInterval(function(){
		      let style_add = '';
		      if(i == 0){
		      	style_add = 'color:#00afef;';
		      } else if(i == 1){
		      	style_add = 'color:#8fc74a;';
		      } else if(i == 2){
		      	style_add = 'color:#f79633;';
		      } else{
		      	style_add = 'color:grey;';
		      }
		      $this.append('<div class="text_animation" style="display: inline-block;'+style_add+' animation: ' + animation + ' ' + animation_speed + 'ms forwards">' + text[i] + '</div>');
		      i++;
		      if (i == text.length) clearInterval(addLetter);
		    }, text_speed);
		  }
		})( jQuery )


		var temp = $('.bounce_in_animation').text();
		var i = 1;

		$('.bounce_in_animation').textAnimation(250, 50, 'bounceIn');

		setInterval(function(){
		  i %= 4;
		  $('.bounce_in_animation').html(temp);
		  switch(i) {
		    case 0:
		      $('.bounce_in_animation').textAnimation(250, 50, 'bounceIn');
		      break;
		    case 1:
		      $('.bounce_in_animation').textAnimation(250, 50, 'slideDown');
		      break;
		    case 2:
		      $('.bounce_in_animation').textAnimation(250, 50, 'slideUp');
		      break;
		    default:
		      $('.bounce_in_animation').textAnimation(250, 50, 'spinIn');
		          }
		  i++;
		}, 1000 + 50 * temp.length + 250)
	</script>
</html>

