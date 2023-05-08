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
			<div class="ui brown inverted segment">
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
							<a class="item"><i class="blue calendar times icon"></i>Cuti & SPD</a>
							<a class="item"><i class="motorcycle icon"></i>KartuKendali</a>
							<a class="item" href="https://bpsluwugoid.odoo.com"><i class="envelope icon"></i>Surat</a>
						</div>
						<div class="ui icon labeled mini compact menu">
							<a href="/Matriks" class="item"><i class="tasks icon"></i>Matriks</a>
							<a class="item"><i class="clipboard outline icon"></i>Presensi</a>
							<a href="/Notulen" class="item"><i class="file alternate k icon"></i>Notulen</a>
						</div>	
						<div class="ui icon labeled mini compact menu">
							<a href="/BukuTamu" class="item"><i class="address book outline icon"></i>BukuTamu</a>
							<a class="item" href="https://webapps.bps.go.id/kipapp"><i class="kickstarter k icon"></i>KipApp</a>
							<a class="item" href="https://sipecut.bps.go.id"><i class="stripe s icon"></i>Sipecut</a>
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
				  <i class="blue calendar times icon"></i>
				  <b>SPD & Cuti</b>
				</h1>
				<div class="ui divider"></div>
				<div class="ui form">
					<div class="field">
						<label><b>Nama Pegawai</b></label>
						<select name="nama_pegawai" id="nama_pegawai_select" class="ui dropdown selection">
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
						<label><b>Status Kehadiran</b></label>
						<select name="status_kehadiran" id="status_kehadiran_select" class="ui dropdown selection">
							<option value="" hidden="true" selected="selected"></option>
							<option value="0">Tanpa Kabar</option>
							<option value="1">Izin</option>
							<option value="2">Sakit</option>
							<option value="3">Cuti</option>
							<option value="4">SPD</option>
						</select>
					</div>					
					<div class="field">
						<label><b>Tanggal</b></label>
						<div id="dates_input">
						</div>
						<div class="ui three column stackable grid">
							<div class="row">
								<div class="column">
									<input type="date" id="input_tanggal">
								</div>
								<div class="left aligned column">
									<a class="ui blue labeled icon button" id="send_button_id"><i class="paper plane icon"></i>Save</a>
								</div>
							</div>
						</div>
						<br>
					</div>
					<div id="example-table"></div>
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
		<%@ include file="jsp_include/ViewEditDeleteColumn/delete_popup.html" %>
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
		$("#nama_pegawai_select").dropdown();
		$("#status_kehadiran_select").dropdown();

		//=========================================================//
		var tanggal_array = [];
		$("#input_tanggal").change(function(){
			let tanggal_value = $(this).val();
			console.log(tanggal_value);
			let obj1 = $("<a></a>");
			obj1.addClass("ui label");
			let obj2 = $("<i></i>");
			obj2.addClass("delete icon");
			obj1.append("<b>"+tanggal_value+"</b>");
			obj1.append(obj2);
			$("#dates_input").append(obj1);
			$("#dates_input").show();
			$("#dates_input").find("b").each(function(ix,obj){
				console.log($(obj).html());
			});
			obj2.click(
				function(){
					$(this).parent().slideUp();
					$(this).parent().remove();
				}
			);
		});

	</script>
	<script type="text/javascript">
        var tabledata = [];
		<%@ include file="jsp_include/ViewEditDeleteColumn/view_edit_delete.js" %>
   	</script>
    <script type="text/javascript">
          var table = new Tabulator("#example-table", {
             // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
            data:[], //assign data to table
            layout:"fitColumns", //fit columns to width of table (optional)
            columns:[ //Define Table Columns
                {title:"Nama", field:"pegawai_nama", width:150,frozen:true},
                {title:"Tanggal", field:"tanggal", hozAlign:"left"},
                {title:"Bulan", field:"bulan", hozAlign:"left"},
                {title:"Tahun", field:"tahun", hozAlign:"left"},
                {title:"Status", field:"spd_cuti_status_ket", hozAlign:"left"},deleteColumn
            ],
            initialSort:[{column:"tahun",dir:"asc"},{column:"bulan",dir:"asc"},{column:"tanggal",dir:"asc"}]

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
			let tanggalArray = [];
			let id_pegawai = $("#nama_pegawai_select").val();
			let is_number = false;
			try{
				if(!isNaN(parseInt(id_pegawai))){
					let is_number = true;
					console.log("id_pegawai adalah numeric.");
				} else{
					alert("Anda belum memilih Nama Pegawai.");
					return;
				}
			} catch(ee){
				alert("Terjadi Kesalahan di sisi Browser.");
				return;
			} finally{
				if(is_number){
				} else{
					$("#refresh_button_id").removeClass("disabled");			
					$($("#refresh_button_id").find("i")[0]).removeClass("loading spinner");
					$($("#refresh_button_id").find("i")[0]).addClass("sync");
				}
			}
			$.get("/api/list_spd_cuti/pegawai/"+id_pegawai,tanggalArray,function(data,status){
				loadData(data);
			}).done(function(){
				table.setSort([{column:"tahun",dir:"asc"},{column:"bulan",dir:"asc"},{column:"tanggal",dir:"asc"}]);
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
		//deleteIconCall Setting
		deleteIconCall = function(row){		
			console.log("called");
			$("#process_delete_button").addClass("disabled");			
			$($("#process_delete_button").find("i")[0]).removeClass("trash alternate");
			$($("#process_delete_button").find("i")[0]).addClass("loading spinner");
			try{
				let selectedDataArray = [];
				selectedDataArray.push(row.getData().id);
				console.log(JSON.stringify(selectedDataArray));
				deleteData(selectedDataArray);
			} catch(ee){
				console.log(ee.message);
			}			
		};
		//delete_button
 /* 		$("#delete_button_id").click(function(){
			$(this).addClass("disabled");			
			$($(this).find("i")[0]).removeClass("trash");
			$($(this).find("i")[0]).addClass("loading spinner");		
			console.log("clicked");
			try{
				let selectedData = table.getSelectedData();
				let selectedDataArray = [];
				$.map(selectedData,function(value,index){
					console.log("id : "+value.id+" +++ value:"+value.tanggal+"-"+value.bulan+"-"+value.tahun);
					selectedDataArray.push(value.id);
				});
				console.log(JSON.stringify(selectedDataArray))
				deleteData(selectedDataArray);
			} catch(ee){
				console.log(ee.message);
			}
		});
*/
		//delete_data
		function deleteData(input){
			$.ajax({url:"/api/list_spd_cuti/delete",method:"post",data:JSON.stringify(input),contentType:"application/json",success:function(){
				$("#delete_popup").modal("hide");
				$("#refresh_button_id").click();
			},error:function(){
				alert("Terjadi Kesalahan. Pastikan Internet Anda Stabil.");
			}}).always(function(){
			setTimeout(function(){			
				$("#process_delete_button").removeClass("disabled");			
				$($("#process_delete_button").find("i")[0]).removeClass("loading spinner");
				$($("#process_delete_button").find("i")[0]).addClass("trash alternate");
			},500);
			});
		}

		//send data
		function sendInput(){
			let tanggalArray = [];
			let id_pegawai = $("#nama_pegawai_select").val();
			let status_kehadiran = $("#status_kehadiran_select").val();
			let is_idpegawai_number = false;
			let is_statuskehadiran_number = false;
			try{
				if(!isNaN(parseInt(id_pegawai))){
					let is_idpegawai_number = true;
					console.log("id_pegawai adalah numeric.");
				} else{
					alert("Anda belum memilih Nama Pegawai.");
					return;
				}
				if(!isNaN(parseInt(status_kehadiran))){
					let is_statuskehadiran_number = true;
					console.log("status_kehadiran adalah numeric.");
				} else{
					alert("Anda belum memilih Status Kehadiran.");
					return;
				}
			} catch(ee){
				alert("Terjadi Kesalahan di sisi Browser.");
				return;
			} finally{
				if(is_idpegawai_number && is_statuskehadiran_number){
				} else{			
					$("#send_button_id").removeClass("disabled");			
					$($("#send_button_id").find("i")[0]).removeClass("loading spinner");
					$($("#send_button_id").find("i")[0]).addClass("paper plane");
				}
			}
			console.log(status_kehadiran);
			$("#dates_input").find("b").each(function(ix,obj){
				try{
					console.log($(obj).html());
					let date_parsed = $(obj).html().split("-");
					let tanggal = date_parsed[2];
					let bulan	= date_parsed[1];
					let tahun = date_parsed[0];
					let objItem = {"pegawai_id":id_pegawai,"tanggal":tanggal,"bulan":bulan,"tahun":tahun,"spd_cuti_status":status_kehadiran};
					tanggalArray.push(objItem);
				} catch(ee){
					console.log(ee.message);
				}
			});
			$.ajax({url:"/api/list_spd_cuti/insert_update",method:"post",data:JSON.stringify(tanggalArray),contentType:"application/json",success:function(){
				alert("success");
				$("#refresh_button_id").click();
			},error:function(){
				alert("Terjadi Kesalahan. Pastikan Internet Anda Stabil.");
			}}).always(function(){
			setTimeout(function(){			
				$("#send_button_id").removeClass("disabled");			
				$($("#send_button_id").find("i")[0]).removeClass("loading spinner");
				$($("#send_button_id").find("i")[0]).addClass("paper plane");
			},500);
			});
		}
		//send Button
		$("#send_button_id").click(function(){
			$("#send_button_id").addClass("disabled");			
			$($("#send_button_id").find("i")[0]).removeClass("paper plane");
			$($("#send_button_id").find("i")[0]).addClass("loading spinner");		
			console.log("clicked");
			try{
					sendInput();
				} catch(ee){
					console.log(ee.message);
			}
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
