<%@ page import="com.bpsluwuOneApp.dto.*,java.util.*" session="false" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<title>BPS Kab. Luwu</title>
		<link rel="icon" href="LogoBPSLuwu.png"/>
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.5.0/semantic.min.css">
		<script
		  src="https://code.jquery.com/jquery-3.1.1.min.js"
		  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
		  crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.5.0/semantic.min.js"></script> 
	    <link href="https://unpkg.com/tabulator-tables@5.4.4/dist/css/tabulator.min.css" rel="stylesheet">
	    <script type="text/javascript" src="https://unpkg.com/tabulator-tables@5.4.4/dist/js/tabulator.min.js"></script>   
		<script type="text/javascript" src="https://oss.sheetjs.com/sheetjs/xlsx.full.min.js"></script> 
  		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<style>
			.main.container{
				margin-top:6em;
			}
		</style>
	</head>
	<body>
		<div class="ui brown inverted icon labeled top fixed tiny menu">
			<div class="ui container">
				<div class="header item"><img src="LogoBPSLuwu.png"><i>BPS Luwu</i></div>
				<a class="active item" id="toggle_menu"><i class="sidebar icon"></i>Menu</a>
				<a href="/" class="item"><i class="home icon"></i>Home</a>
				<a class="item"><i class="at icon"></i>About</a>
				<%
					String status_login = ((String) (request.getAttribute("status_login")));
					if((status_login != null) && (status_login.toLowerCase().equals("iya"))){
						//out.println("<a href='/api/logout' class='right item'><i class='sign out icon'></i>Sign Out</a>");
						SessionModel sesi = (SessionModel)(request.getAttribute("session"));
						String username = sesi.getUser_model().getUsername();
						out.println("<div class='ui basic dropdown right item' id='akun_dropdown'>");
						out.println("<i class='user circle icon'></i>Akun");
						out.println("<div class='menu'>");
						out.println("<div class='header'>");
						out.println(username);
						out.println("</div>");
						out.println("<div class='divider'></div>");
						out.println("<a href='/api/logout' class='item'><i class='sign out icon'></i>Logout</a>");
						out.println("</div>");
						out.println("</div>");
					} else{
						out.println("<a class='right item' id='signin_button'><i class='sign in icon'></i>Sign In</a>");
					}
				%>
			<!-- <a class="right item"><i class="sign in icon"></i>Sign in</a> -->
			<!--
				<div class="ui basic dropdown right item">
					<i class="user circle icon"></i>Akun
					<div class="menu">
						<div class="header">
							Muh. Taufiq Mukhtar
						</div>
						<div class="divider"></div>
					 	<a href="/api/logout" class="item"><i class='sign out icon'>Logout</a>
					</div>
				  </div>
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
					<b>Administrasi</b>
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
			<div class="item">
				<div class="header">
					<b>Tools</b>
				</div>
				<div class="menu">
					<a class="item" href="/MasterWilayah"><i class="map outline blue icon"></i>Master Wilayah</a>
				</div>
			</div>	
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
							<a class="item"><i class="blue tasks icon"></i>Matriks</a>
							<a href="/Presensi" class="item"><i class="clipboard outline icon"></i>Presensi</a>
							<a href="/Notulen" class="item"><i class="file alternate k icon"></i>Notulen</a>
						</div>	
						<div class="ui icon labeled mini compact menu">
							<a href="/BukuTamu" class="item"><i class="address book outline icon"></i>BukuTamu</a>
							<a href="http://webapps.bps.go.id/kipapp" class="item"><i class="kickstarter k icon"></i>KipApp</a>
							<a href="http://sipecut.bps.go.id" class="item"><i class="stripe s icon"></i>Sipecut</a>
						</div>	

					</div>
				</div>
			</div>
			</div>
		</div>
		<br>
		<div class="ui divider"></div>
		<div class="ui container">
			<div class="ui brown segment">
				<h1 class="ui center aligned icon header">
				  <i class="blue tasks icon"></i>
				  <b>Matriks Kegiatan</b>
				</h1>
				<div class="ui divider"></div>
					<div class="ui form">
						<div class="field">
							<label><b>Pilih Bulan</b></label>
							<div class="ui three column stackable grid">
								<div class="row">
									<div class="column">
										<input type="month" id="input_bulan" value="2023-03">
									</div>
								</div>
							</div>
						</div>
					</div>
					<br>
					<div id="example-table"></div>
					<br>
					<div class="ui container right aligned">
						<div class="row">
							<div class="right column">
								<%@ include file="jsp_include/DownloadTable/html_download.jsp" %>
								<a class="ui green small left labeled icon button" id="refresh_button_id">
								  <i class="sync icon"></i>
								  Refresh
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- html for login -->
		<div class="ui container">
			<div class="ui tiny modal" id="login_popup">
				<i class="close icon"></i>
				<div class="header">Login</div>
				<div class="content">
					<div class="ui form">
						<div class="field">
							<label>Username</label>
							<input type="text" id="username_input">
						</div>
						<div class="field">
							<label>Password</label>
							<input type="password" id="password_input">
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
		<%@ include file="jsp_include/Footer/footer.jsp" %>
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
		//=========================================================//
	</script>
	<script type="text/javascript">
        var tabledata = [];
   	</script>
    <script type="text/javascript">
    	var jumlah_hari = 30;
    	var columnData = [];
    	columnData.push({title:"Nama",width:150});
   		for(let i = 0;i < jumlah_hari;i++){
    		columnData.push({title:(""+(i+1)),width:60});
   		}
        var table = new Tabulator("#example-table", {
             // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
            data:[], //assign data to table
            layout:"fitColumns", //fit columns to width of table (optional)
            selectable:true,
            columns:columnData,
            maxHeight:500
        });

        function loadData(table_data){
			table.replaceData(table_data)
			.then(function(){
			    //run code after table has been successfully updated
			})
			.catch(function(error){
			    //handle error loading data
			});
        }
//================= BUTTON =========================
		//refresh_data
		function refreshData(){
			let bulan_tahun = $("#input_bulan").val();
			let bulan = -1;
			let tahun = -1;
			try{
				let arrayBT = bulan_tahun.split("-");
				tahun = parseInt(arrayBT[0]);
				bulan = parseInt(arrayBT[1]);
				console.log("Bulan : "+bulan+" --- Tahun : "+tahun);
			} catch(ee){
				console.log(ee.message);
				alert("Pastikan Bulan dan Tahun sudah pilih.");
				return;
			}
			let bulanDate = new Date(tahun,bulan,0);
			console.log(bulanDate.getDate());
			jumlah_hari = bulanDate.getDate();
			$.get("/api/list_spd_cuti/all/year/"+tahun+"/month/"+bulan,function(data,status){
				columnData = [];
				let response_data = JSON.parse(data);
				let data2 = response_data.data;
				columnData.push({title:"Nama",field:"nama",width:150,frozen:true});
		   		for(let i = 0;i < jumlah_hari;i++){
		    		columnData.push({title:(""+(i+1)),field:("tanggal.tanggal_"+(i+1)),width:60});
		   		}
		   		table.setColumns(columnData);
				loadData(data2);
			}).done(function(){
				$("#refresh_button_id").removeClass("disabled");			
				$($("#refresh_button_id").find("i")[0]).removeClass("loading spinner");
				$($("#refresh_button_id").find("i")[0]).addClass("sync");
			}).fail(function(){
				$("#refresh_button_id").removeClass("disabled");			
				$($("#refresh_button_id").find("i")[0]).removeClass("loading spinner");
				$($("#refresh_button_id").find("i")[0]).addClass("sync");				
				alert("gagal");
			});
		}

        //refresh_button
  		$("#refresh_button_id").click(function(){
			$(this).addClass("disabled");			
			$($(this).find("i")[0]).removeClass("sync");
			$($(this).find("i")[0]).addClass("loading spinner");		
			console.log("clicked");
			setTimeout(function(){			
				try{
					refreshData();
				} catch(ee){
					console.log(ee.message);
				}
			},500);
		});
		$("#refresh_button_id").click();
		$("#input_bulan").on("change",function(){			
			$("#refresh_button_id").click();
		});
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
						location.reload();					
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
    </script>
	<script type="text/javascript">
		<%@ include file="jsp_include/DownloadTable/js_download.js" %>
	</script>
</html>
