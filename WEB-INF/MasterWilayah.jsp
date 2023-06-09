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
		<div class="ui divider"></div>
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
						<h2>Tools</h2>
						<div class="ui icon labeled mini compact menu">
							<a class="item"><i class="map outline blue icon"></i>Wilayah</a>
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
				  <i class="map outline blue icon"></i>
				  <b>Master Wilayah</b>
				</h1>
				<div class="ui divider"></div>
					<div class="ui form">
						<div class="three fields">
							<div class="field">
								<div class="ui labeled input">
									<div class="ui label blue">
									  Kabupaten
									</div>
									<select name="kode_kab" id="master_kab_select" class="ui dropdown selection">
									</select>
								  </div>
							</div>
							<div class="field">
								<div class="ui labeled input">
									<div class="ui label blue">
									  Kecamatan
									</div>
									<select name="kode_kec" id="master_kec_select" class="ui dropdown selection">
									</select>
								  </div>
							</div>
							<div class="field">
								<div class="ui labeled input">
									<div class="ui label blue">
									  Kelurahan/Desa
									</div>
									<select name="kode_dk" id="master_dk_select" class="ui dropdown selection">
									</select>
								  </div>
							</div>
						</div>
					</div>
					<br>
					<div class="ui container center aligned">
						<div class="row">
							<div class="column">
								<a class="ui green left labeled icon button" id="refresh_button_id">
								  <i class="sync icon"></i>
								  Load
								</a>
							</div>	
						</div>
					</div>
					<br>
					<div id="example-table"></div>
				</div>
			</div>
		</div>
		<!-- html for select master wilayah popup  -->
		<div class="ui container">
			<div class="ui tiny modal" id="select_master_popup">
				<i class="close icon"></i>
				<div class="header">Error</div>
				<div class="content">
					<div class="ui warning message" id="warning_select_master">
						<div class="header">
							Warning
						</div>
						<span id="message_warning_select"></span>
						</div>	
					</div>				
				</div>
			</div>
		</div>
		<!-- html for select master wilayah popup -->
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
        $("#akun_dropdown").dropdown();
		$("#master_kab_select").dropdown();
		$("#master_kec_select").dropdown();
		$("#master_dk_select").dropdown();
		//=========================================================//
	</script>
	<script type="text/javascript">
		//load selectable master (dropdown master)
		let kab_val = "";
		let kec_val = "";
		let dk_val = "";
		$("#master_kab_select").append($("<option>",{value:"17",text:"LUWU"}));
		$("#master_kab_select").val("17");
		function getKecMaster(){		
			kab_val = $("#master_kab_select").val();
			$.get("/api/wilayah/kec/kab/"+kab_val,function(data,status){
				let master_kec = JSON.parse(data);
				$("#master_kec_select").html("");
				$("#master_kec_select").append($("<option>",{value:"-1",text:"Semua"}));
				$.each(master_kec,function(i,item){
					let text_select = "["+item.kode+"]"+" - "+item.nama;
					$("#master_kec_select").append($("<option>",{value:item.kode,text:text_select}));
				});
			}).done(function(){
			}).fail(function(){
			});
		}
		function getDKMaster(){		
			kab_val = $("#master_kab_select").val();
			kec_val = $("#master_kec_select").val();
			$.get("/api/wilayah/dk/kab/"+kab_val+"/kec/"+kec_val,function(data,status){
				let master_dk = JSON.parse(data);
				$("#master_dk_select").html("");
				$("#master_dk_select").append($("<option>",{value:"-1",text:"Semua"}));
				$.each(master_dk,function(i,item){
					let text_select = "["+item.kode+"]"+" - "+item.nama;
					$("#master_dk_select").append($("<option>",{value:item.kode,text:text_select}));
				});
			}).done(function(){
			}).fail(function(){
			});
		}
		getKecMaster();
		$("#master_kec_select").on("change",function(){
			getDKMaster();
		});
		function getSLSMasterByKabKecDK(kode_kab,kode_kec,kode_dk){	
			if((kode_kec != null) && (kode_kec === "-1")){
				$.get("/api/wilayah/sls/kab/"+kab_val,function(data,status){
				let master_sls = JSON.parse(data);
				loadData(master_sls);
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
			} else if((kode_dk != null) && (kode_dk === "-1")){
				$.get("/api/wilayah/sls/kab/"+kab_val+"/kec/"+kode_kec,function(data,status){
				let master_sls = JSON.parse(data);
				loadData(master_sls);
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
			} else{
				$.get("/api/wilayah/sls/kab/"+kab_val+"/kec/"+kode_kec+"/dk/"+kode_dk,function(data,status){
				let master_sls = JSON.parse(data);
				loadData(master_sls);
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
		}
	</script>
	<script type="text/javascript">
        var tabledata = [];
   	</script>
    <script type="text/javascript">
    	var jumlah_hari = 30;
    	var columnData = [];
    	columnData.push({title:"Nama SLS",field:"nama",width:230,frozen:true});
		columnData.push({title:"ID SLS",field:"idsls"});
		columnData.push({title:"Kode Kab",field:"kode_kab"});
		columnData.push({title:"Kode Kec",field:"kode_kec"});
		columnData.push({title:"Kode Desa/Kelurahan",field:"kode_dk"});
        var table = new Tabulator("#example-table", {
             // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
            data:[], //assign data to table
            layout:"fitColumns", //fit columns to width of table (optional)
            selectable:true,
            columns:columnData,
			pagination:true, //enable.
    		paginationSize:10, // this option can take any positive integer value
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
			let kab_s_val = $("#master_kab_select").val();
			let kec_s_val = $("#master_kec_select").val();
			let dk_s_val = $("#master_dk_select").val();
			getSLSMasterByKabKecDK(kab_s_val,kec_s_val,dk_s_val);
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
</html>
