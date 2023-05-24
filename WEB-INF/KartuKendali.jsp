<%@ page import="com.bpsluwuOneApp.dto.*,java.util.*" session="false" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<title>BPS Kab. Luwu</title>
		<link rel="icon" href="LogoBPSLuwu.png"/>
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.css">
		<script
		  src="https://code.jquery.com/jquery-3.1.1.min.js"
		  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
		  crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.js"></script>
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
							<a class="item"><i class="motorcycle icon"></i>KartuKendali</a>
							<a href="http://bpsluwugoid.odoo.com" class="item"><i class="envelope icon"></i>Surat</a>
						</div>
						<div class="ui icon labeled mini compact menu">
							<a href="/Matriks" class="item"><i class="tasks icon"></i>Matriks</a>
							<a href="/Presensi" class="item"><i class="clipboard outline icon"></i>Presensi</a>
							<a href="/Notulen" class="item"><i class="blue file alternate k icon"></i>Notulen</a>
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
				  <i class="blue motorcycle icon icon"></i>
				  <b>KartuKendali</b>
				</h1>
				<div class="ui divider"></div>
				<div class="ui top attached tabular menu">
					<a class="item" id="daftar_menu">
					  Daftar
					</a>
					<a class="item" id="input_menu">
					  Input
					</a>
				  </div>
				  <div class="ui bottom attached segment">
					<div id="daftar_segment">
					<div id="daftar_segment">
                        <div class="ui container">
							<div class="ui form">
								<div class="field">
									<label><b>Pilih Pegawai</b></label>
									<div class="ui three column stackable grid">
										<div class="row">
											<div class="column">
												<select name="pegawai" id="pegawai_daftar_select" class="ui dropdown selection">
													<option default value="-1">Semua</option>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>
                            <br>
                            <div>
                                Ini Adalah Kolom Data
                            </div>
                        </div>
						<br>
						<div class="ui container right aligned">
							<div class="row">
								<div class="right column">
									<a class="ui green small left labeled icon button" id="refresh_button_id">
									  <i class="sync icon"></i>
									  Refresh
									</a>
								</div>	
							</div>
						</div>
					</div>
					<div id="input_segment">
						<form class="ui form">
							<div class="field">
								<label><b>Jenis Rapat</b></label>
								<select id="jenis_rapat_select" class="ui dropdown selection">
									<option value="" hidden="true" selected="selected"></option>
									<option value="0">Rapat Bulanan</option>
									<option value="1">Rapat Lainnya</option>
								</select>
							</div>	
							<div class="field">
								<label><b>Keterangan</b></label>
								<input type="text" id="ket_rapat" placeholder="cth: Rapat Bulan Januari 2023/Rapat Regsosek">
							</div>
							<div class="field">
								<label><b>Tanggal</b></label>
								<input type="date" id="tanggal_rapat">
							</div>
							<div class="field">								
								<label><b>Peserta</b></label>
								<div class="ui left icon input">
									<input type="text" id="peserta_rapat" placeholder="cth: semua pegawai/ketua tim.">
									<i class="users icon"></i>
								</div>
							</div>
							<div class="field">
								<label><b>Notulis</b></label>
								<select id="notulis_select" class="ui dropdown selection">
									<option value="" hidden="true" selected="selected"></option>
                                    <%
                                        PegawaiModel.Collection daftar_pegawai = (PegawaiModel.Collection) request.getAttribute("daftar_pegawai");
                                        if(daftar_pegawai != null){
                                            for(int i = 0;i < daftar_pegawai.getCollection().size();i++){
                                                try{
                                                    int id = daftar_pegawai.getCollection().get(i).getId();
                                                    String nama = daftar_pegawai.getCollection().get(i).getNama();
                                                    out.println("<option value='"+id+"'>"+nama+"</option>");
                                                } catch(Exception ee){
                                                    System.out.println(ee.getMessage());
                                                }
                                            }
                                        } else{
                                        }
                                    %>
                                    <!-- <option value="0">Muh. Taufiq Mukhtar</option> -->
								</select>
							</div>
							<div class="field">
								<label><b>Notula</b></label>
								<div id="id_editor">
								</div>
							</div>	
						</form>
						<br>
						<div class="ui container right aligned">
							<div class="row">
								<div class="right column">
									<a class="ui blue small left labeled icon button" id="save_button_id">
									  <i class="save icon"></i>
									  Save
									</a>
								</div>	
							</div>
						</div>
					</div>
				  </div>
				</div>
			</div>
		</div>
		<!-- html for rapat_popup -->
		<div class="ui container">
			<div class="ui large modal" id="rapat_popup">
				<div class="header">Notulen Rapat</div>
				<div class="scrolling content">
					<form class="ui form">
						<div class="field">
							<label><b>Jenis Rapat</b></label>
							<input type="text" id="jenis_rapat_popup" disabled>
						</div>	
						<div class="field">
							<label><b>Keterangan</b></label>
							<input type="text" id="ket_rapat_popup" disabled>
						</div>
						<div class="field">
							<label><b>Tanggal</b></label>
							<input type="date" id="tanggal_rapat_popup" disabled>
						</div>
						<div class="field">								
							<label><b>Peserta</b></label>
							<div class="ui left icon input">
								<input type="text" id="peserta_rapat_popup" placeholder="cth: semua pegawai/ketua tim." disabled>
								<i class="users icon"></i>
							</div>
						</div>
						<div class="field">
							<label><b>Notulis</b></label>
							<input type="text" id="notulis_rapat_popup" disabled>
						</div>
						<div class="field">
							<label><b>Notula</b></label>
							<div id="id_editor_popup">
							</div>
						</div>	
					</form>			
				</div>
				<div class="actions">
					<a class="ui red labeled icon button" id="rapat_close_popup"><i class="close icon"></i>Close</a>
				</div>
			</div>
		</div>
		<!-- html for rapat_popup -->
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
		$("#jenis_rapat_select").dropdown();
		$("#notulis_select").dropdown();
		//submenu
		$("#daftar_menu").addClass("active");
		$("#input_segment").hide();
		$("#input_menu").click(function(){		
			$("#daftar_menu").removeClass("active");
			$("#input_menu").addClass("active");
			$("#daftar_segment").hide();
			$("#input_segment").show();
		});
		$("#daftar_menu").click(function(){						
			$("#input_menu").removeClass("active");
			$("#daftar_menu").addClass("active");	
			$("#input_segment").hide();
			$("#daftar_segment").show();
		});
	</script>
	<script type="text/javascript">
		//----------------- insert segment -------------------
		//Button
		//save data
		function saveInput(){
			let data_send = null;
			let id_jenis_rapat = $("#jenis_rapat_select").val();
			let ket_rapat = $("#ket_rapat").val();
			let tanggal_rapat = $("#tanggal_rapat").val();
			let tanggal = -1;
			let bulan = -1;
			let tahun = -1;
			let peserta_rapat = $("#peserta_rapat").val();
			let id_notulis = $("#notulis_select").val();
			let notulen = $("#id_editor").summernote("code");
			//validation
			let is_jenis_number = false;
			let is_notulis_number = false;
			let is_date_number = false;
			try{
				if(!isNaN(parseInt(id_jenis_rapat))){
					is_jenis_number = true;
					console.log("id_jenis adalah numeric.");
				} else{
					alert("Anda belum memilih Jenis Rapat.");
					return;
				}
				if(!isNaN(parseInt(id_notulis))){
					is_notulis_number = true;
					console.log("id notulis adalah numeric.");
				} else{
					alert("Anda belum memilih Notulis.");
					return;
				}
				try{
					let date_parsed = tanggal_rapat.split("-");
					tanggal = date_parsed[2];
					bulan	= date_parsed[1];
					tahun = date_parsed[0];
					if(!isNaN(parseInt(tanggal))){
					} else{
						return;
					}
					if(!isNaN(parseInt(bulan))){
					} else{
						return;
					}
					if(!isNaN(parseInt(tahun))){
					} else{
						return;
					}
					is_date_number = true;
				} catch(ee2){
					console.log(ee2.message);
					return;
				} finally{
					if(is_date_number){
					} else{
						alert("Pastikan anda sudah memilih tanggal, bulan, dan tahun.");
					}

				}
			} catch(ee){
				alert("Terjadi Kesalahan di sisi Browser.");
				return;
			} finally{
				if(is_jenis_number && is_notulis_number && is_date_number){
				} else{			
					$("#save_button_id").removeClass("disabled");			
					$($("#save_button_id").find("i")[0]).removeClass("loading spinner");
					$($("#save_button_id").find("i")[0]).addClass("save");
				}
			}
			data_send = {"ket":ket_rapat,"tanggal":tanggal,"bulan":bulan,"tahun":tahun,"peserta":peserta_rapat,"jenis_rapat_id":id_jenis_rapat,"notulis_id":id_notulis,"notulen":notulen};
			$.ajax({url:"/api/notulen/insert",method:"post",data:JSON.stringify(data_send),contentType:"application/json",success:function(){
				alert("success");
				$("#refresh_button_id").click();
			},error:function(){
				alert("Terjadi Kesalahan. Pastikan Internet Anda Stabil.");
			}}).always(function(){
			setTimeout(function(){			
				$("#save_button_id").removeClass("disabled");			
				$($("#save_button_id").find("i")[0]).removeClass("loading spinner");
				$($("#save_button_id").find("i")[0]).addClass("save");
			},500);
			});
		}
		//save Button
		$("#save_button_id").click(function(){
			$("#save_button_id").addClass("disabled");			
			$($("#save_button_id").find("i")[0]).removeClass("save");
			$($("#save_button_id").find("i")[0]).addClass("loading spinner");		
			console.log("clicked");
			try{
				saveInput();
			} catch(ee){
				console.log(ee.message);
			}
		});
	</script>
	<script type="text/javascript">
		//------------------- DAFTAR SEGMENT -------------------------
		//================= BUTTON =========================
		let rapat_data = null;

		//load_data
		function loadData(data){		
			let daftar_rapat_container = $("#daftar_rapat_container");		
			daftar_rapat_container.slideUp();
			let wrapper = "";
			try{
				rapat_data = JSON.parse(data);
				daftar_rapat_container.html("");
				for(let i = 0; rapat_data.length;i++){
					let rapat_item = rapat_data[i];
					let string_div = "<div class='column'>";
					string_div = string_div+"<div class='ui segment'>";
					string_div = string_div+"<a class='ui red ribbon label'>";
					string_div = string_div+rapat_item.jenis_rapat.ket;					
					string_div = string_div+"</a>";					
					string_div = string_div+"<p><a href='javascript:void(null);' class='rapat_item' id='rapat_"+rapat_item.id+"'>";
					string_div = string_div+"<b>"+rapat_item.ket;	
					string_div = string_div+"</b></a></p></div></div>";						
					wrapper = wrapper + string_div;
				}
			} catch(ee){
			}
			daftar_rapat_container.html(wrapper);
			daftar_rapat_container.slideDown();
			addClickListener();
		}
		//refresh_data
		function refreshData(){
			$.get("/api/notulen/all",function(data,status){
				loadData(data);
			}).done(function(){
				$("#refresh_button_id").removeClass("disabled");			
				$($("#refresh_button_id").find("i")[0]).removeClass("loading spinner");
				$($("#refresh_button_id").find("i")[0]).addClass("sync");
			}).fail(function(){
				$("#refresh_button_id").removeClass("disabled");			
				$($("#refresh_button_id").find("i")[0]).removeClass("loading spinner");
				$($("#refresh_button_id").find("i")[0]).addClass("sync");				
				alert("Terjadi Kesalahan. Pastikan Internet Anda Stabil.");
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
		//rapat_item_popup
		$("#id_editor_popup").summernote({
			minHeight:150,
			maxHeight:300,
			toolbar: [
        ]
		});
		$("#rapat_close_popup").click(function(){
			$("#rapat_popup").modal({"closable":false}).modal("hide");
		});
		//click_data
		function addClickListener(){
			$(".rapat_item").click(function(){
			console.log("rapat_item clicked");
			let class_id = $(this).attr("id");
			let rapat_id = (class_id.split("_"))[1];
			console.log("rapat_id : "+rapat_id);
			$("#rapat_close_popup").addClass("disabled");			
			$($("#rapat_close_popup").find("i")[0]).removeClass("close");
			$($("#rapat_close_popup").find("i")[0]).addClass("loading spinner");
			$("#rapat_popup").modal({"closable":false}).modal("show");	
			getRapatItem(rapat_id);
		});
		}
		//loadRapatData
		function loadRapatItem(rapat_data){
			let rapat_item_json = JSON.parse(rapat_data);
			try{
				$("#jenis_rapat_popup").val(rapat_item_json.jenis_rapat.ket);
				$("#ket_rapat_popup").val(rapat_item_json.ket);
				let tanggal = rapat_item_json.tanggal+"";
				let bulan = rapat_item_json.bulan+"";
				let tahun = rapat_item_json.tahun+"";
				if(tanggal.length == 1){
					tanggal = "0"+tanggal;
				} else{}
				if(bulan.length == 1){
					bulan = "0"+bulan;
				} else{}
				console.log(tahun+"-"+bulan+"-"+tanggal);
				$("#tanggal_rapat_popup").val(tahun+"-"+bulan+"-"+tanggal);
				$("#peserta_rapat_popup").val(rapat_item_json.peserta);
				$("#notulis_rapat_popup").val(rapat_item_json.nama_notulis);	
				$("#id_editor_popup").summernote("code",rapat_item_json.notulen);
				$('#id_editor_popup').summernote('disable');
			} catch(ee){

			}

		}
		//get_rapat_item
		function getRapatItem(rapat_id){
			$.get("/api/notulen/id/"+rapat_id,function(data,status){
				loadRapatItem(data);
			}).done(function(){
				$("#rapat_close_popup").removeClass("disabled");			
				$($("#rapat_close_popup").find("i")[0]).removeClass("loading spinner");
				$($("#rapat_close_popup").find("i")[0]).addClass("close");
			}).fail(function(){
				$("#rapat_close_popup").removeClass("disabled");			
				$($("#rapat_close_popup").find("i")[0]).removeClass("loading spinner");
				$($("#rapat_close_popup").find("i")[0]).addClass("close");				
				alert("Terjadi Kesalahan. Pastikan Internet Anda Stabil.");
			});
		}
		$("#refresh_button_id").click();
	</script>
	<script type="text/javascript">
		$("#id_editor").summernote({
			minHeight:150,
			maxHeight:300,
			toolbar: [
			['font', ['bold', 'underline', 'clear']],
			['para', ['ul', 'ol', 'paragraph']],
			['view', ['codeview', 'help']]
        ]
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
