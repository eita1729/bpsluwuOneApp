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
					<a class="item"><b>BukuTamu</b></a>
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
						<h2>Administrasi Kepegawaian</h2>
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
		<div class="ui divider"></div>
		<div class="ui container">
			<div class="ui brown segment">
				<h1 class="ui center aligned icon header">
				  <i class="blue address book outline icon"></i>
				  <b>Buku Tamu</b>
				</h1>
				<div class="ui divider"></div>
					<div class="ui form">
						<div class="field">
							<label><b>Pilih Tahun</b></label>
							<div class="ui three column stackable grid">
								<div class="row">
									<div class="column">
										<select name="tahun" id="tahun_select" class="ui dropdown selection">
                                            <option value="0">Semua</option>
                                        </select>
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
		<!-- html for bukutamu_popup -->
		<div class="ui container">
			<div class="ui large modal" id="bukutamu_popup">
				<div class="header">Detail Kunjungan</div>
				<div class="scrolling content">
					<form class="ui form">
						<div class="field">
							<label><b>Nama Pengunjung</b></label>
							<input type="text" id="nama_pengunjung_popup" disabled>
						</div>	
						<div class="field">
							<label><b>Umur</b></label>
							<input type="text" id="umur_popup" disabled>
						</div>
						<div class="field">
							<label><b>Email</b></label>
							<input type="text" id="email_popup" disabled>
						</div>
						<div class="field">
							<label><b>No. HP</b></label>
							<input type="text" id="noHP_popup" disabled>
						</div>
						<div class="field">
							<label><b>Jenis Kelamin</b></label>
							<input type="text" id="jk_popup" disabled>
						</div>
						<div class="field">
							<label><b>Pendidikan</b></label>
							<input type="text" id="edu_popup" disabled>
						</div>
						<div class="field">
							<label><b>Pekerjaan</b></label>
							<input type="text" id="job_popup" disabled>
						</div>
						<div class="field">
							<label><b>Jenis Pekerjaan</b></label>
							<input type="text" id="jobcat_popup" disabled>
						</div>
						<div class="field">
							<label><b>Instansi</b></label>
							<input type="text" id="instansi_popup" disabled>
						</div>                     
						<div class="field">
							<label><b>Tanggal Kunjungan</b></label>
							<input type="date" id="date_popup" disabled>
						</div>                   
						<div class="field">
							<label><b>Tujuan</b></label>
							<input type="text" id="tujuan_popup" disabled>
						</div>                   
						<div class="field">
							<label><b>Data</b></label>
							<input type="text" id="data_popup" disabled>
						</div>                         
					</form>
					<div class="ui hidden warning message" id="warning_process_rapat">
						<div class="header">
							Error!
						</div>
						<span id="message_process_rapat"></span>
					</div>					
				</div>
				<div class="actions">
					<a class="ui red labeled icon button" id="bukutamu_close_popup"><i class="close icon"></i>Close</a>
				</div>
			</div>
		</div>
		<!-- html for bukutamu_popup -->
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
        function loadYearsSelection(){
            let tanggal = new Date();
            let tahun = tanggal.getFullYear();
            for(let i = 0;i < 5;i++){
                let tahun_item = "<option value='"+(tahun-i)+"'>"+(tahun-i)+"</option>";
                //let tahun_item = $("option");
                //tahun_item.val(""+(tahun-i)+"");
                //tahun_item.html(""+(tahun-i)+"");           
                $("#tahun_select").append(tahun_item);
            }
            $("#tahun_select").dropdown();
        }
        loadYearsSelection();
	</script>
	<script type="text/javascript">
        var tabledata = [];
        <%@ include file="jsp_include/ViewEditDeleteColumn/view_edit_delete.js" %>
   	</script>
	
    <script type="text/javascript">
    	var jumlah_hari = 30;
    	var columnData = [{title:"Nama Pengunjung",field:"nama",frozen:true},{title:"Tanggal",field:"date"},{title:"Tujuan",field:"tujuan_ket"},viewColumn];
        var table = new Tabulator("#example-table", {
             // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
            data:[], //assign data to table
            layout:"fitColumns", //fit columns to width of table (optional)
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
			let tahun = -1;
			try{
                tahun = parseInt($("#tahun_select").val());
			} catch(ee){
				console.log(ee.message);
				alert("Pastikan Tahun sudah dipilih.");
				return;
			}
            if(tahun <= 0){
                table.replaceData("/api/buku_tamu/all").then(function(){
                })
                .catch(function(error){ 
                    alert("Terjadi Kesalahan.");            
                });
            } else{
                table.replaceData("/api/buku_tamu/year/"+tahun).then(function(){}).catch(function(error){
                    alert("Terjadi Kesalahan.");            
                });
            }	
            $("#refresh_button_id").removeClass("disabled");			
                        $($("#refresh_button_id").find("i")[0]).removeClass("loading spinner");
                        $($("#refresh_button_id").find("i")[0]).addClass("sync");	
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
        //====== for buku_tamu popup =============//
        //load data to buku_tamu popup
        function loadBukuTamuItem(rowComp){
            let rowData = rowComp.getData();
            let nama_item = rowData.nama;
            let umur_item = rowData.umur;
            let email_item = rowData.email;
            let noHP_item = rowData.noHP;
            let jk_item = rowData.jk_ket;
            let edu_item = rowData.edu_ket;
            let job_item = rowData.job;
            let jobcat_item = rowData.jobcat_ket;
            let instansi_item = rowData.instansi;
            let date_item = rowData.date;
            let tujuan_item = rowData.tujuan_ket;
            $("#nama_pengunjung_popup").val(nama_item);
            $("#umur_popup").val(umur_item);
            $("#email_popup").val(email_item);
            $("#noHP_popup").val(noHP_item);
            $("#jk_popup").val(jk_item);
            $("#edu_popup").val(edu_item);
            $("#job_popup").val(job_item);
            $("#jobcat_popup").val(jobcat_item);
            $("#instansi_popup").val(instansi_item);
            $("#date_popup").val(date_item);
            $("#tujuan_popup").val(tujuan_item);
            if(rowData.tujuan_id == 0){
                let data_requested = rowData.data;
                $("#data_popup").val(data_requested);
                $("#data_popup").show();
            } else{                
                $("#data_popup").hide();
            }
        }
		viewIconCall = function(row){
			loadBukuTamuItem(row);
			$("#bukutamu_popup").modal({"closable":false}).modal("show");
		};
		$("#bukutamu_close_popup").click(function(){
			$("#bukutamu_popup").modal({"closable":false}).modal("hide");
		});
		//===== initial execute =====//
		$("#refresh_button_id").click();
		$("#tahun_select").on("change",function(){			
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
