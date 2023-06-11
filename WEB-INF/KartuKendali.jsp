<%@ page import="com.bpsluwuOneApp.dto.*,java.util.*" session="false" pageEncoding="UTF-8" %>
<!DOCTYPE html>
	<head>
		<title>BPS Kab. Luwu</title>
		<link rel="icon" href="LogoBPSLuwu.png"/>
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.css">
		<script
		  src="https://code.jquery.com/jquery-3.1.1.min.js"
		  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
		  crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.js"></script>
		<link href="https://unpkg.com/tabulator-tables@4.9.3/dist/css/semantic-ui/tabulator_semantic-ui.min.css" rel="stylesheet">
	    <script type="text/javascript" src="https://unpkg.com/tabulator-tables@4.9.3/dist/js/tabulator.min.js"></script>
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
                            <a class="item"><i class="blue motorcycle icon"></i>KartuKendali</a>
                            <a href="http://bpsluwugoid.odoo.com" class="item"><i class="envelope icon"></i>Surat</a>
                        </div>
                        <div class="ui icon labeled mini compact menu">
                            <a href="/Matriks" class="item"><i class="tasks icon"></i>Matriks</a>
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
                    <i class="blue motorcycle icon"></i>
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
                        <div class="ui container">
							<div class="ui form">
								<div class="field">
									<label><b>Pilih Pegawai</b></label>
									<div class="ui three column stackable grid">
										<div class="row">
											<div class="column">
												<select name="pegawai" id="pegawai_daftar_select" class="ui dropdown selection">
													<option default value="-1">Semua</option>
													<%
														PegawaiModel.Collection daftar_pegawai = (PegawaiModel.Collection) (request.getAttribute("daftar_pegawai"));
														for(int i = 0;i < daftar_pegawai.getCollection().size();i++){
															int pegawai_item_id = daftar_pegawai.getCollection().get(i).getId();
															String pegawai_item_nama = daftar_pegawai.getCollection().get(i).getNama();
															String html_id = "'"+pegawai_item_id+"'";
															String html_out = "<option value="+html_id+">"+pegawai_item_nama+"</option>"; 
															out.println(html_out);
														}
													%>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>
                            <br>
                            <div>
								<div id="example-table"></div>
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
						<div class="ui form">                       
                            <center><h3><b>IDENTITAS</b></h3></center>
							<div class="inline fields">
								<div class="three wide field">
									<label><b>Nama</b></label>
								</div>
								<div class="field">
									<select name="pegawai_id" id="pegawai_input_select" class="ui dropdown selection input_select">
										<option value="" hidden="true" selected="selected"></option>
										<%
											PegawaiModel.Collection pegawai = (PegawaiModel.Collection) (request.getAttribute("pegawai"));
											int pegawai_size = pegawai.getCollection().size();
											for(int x = 0;x < pegawai_size;x++){
												int pegawai_item_id = pegawai.getCollection().get(x).getId();
												String pegawai_item_nama = pegawai.getCollection().get(x).getNama();
												String html_id = "'"+pegawai_item_id+"'";
												String html_out = "";
												if(pegawai_size == 1){
													html_out = "<option selected value="+html_id+">"+pegawai_item_nama+"</option>"; 
												} else{
													html_out = "<option value="+html_id+">"+pegawai_item_nama+"</option>"; 
												}
												out.println(html_out);
											}
										%>
									</select>
								</div>
							</div>
							<div class="inline fields">
								<div class="three wide field">
									<label><b>Kendaraan Dinas</b></label>
								</div>
								<div class="field">
									<select name="kd_id" id="kd_input_select" class="ui dropdown selection input_select">
										<option value="" hidden="true" selected="selected"></option>
										<%
											KendaraanDinasModel.Collection kd = (KendaraanDinasModel.Collection) (request.getAttribute("daftar_kd"));
											int kd_size = kd.getCollection().size();
											for(int y = 0;y < kd_size;y++){
												int kd_item_id = kd.getCollection().get(y).getId();
												String kd_item_no_polisi = kd.getCollection().get(y).getNo_polisi();
												String kd_item_ket = kd.getCollection().get(y).getKet();
												String html_id = "'"+kd_item_id+"'";
												String html_out = "";
												if(kd_size == 1){
													html_out = "<option selected value="+html_id+">"+kd_item_no_polisi+" - "+kd_item_ket+"</option>"; 
												} else{
													html_out = "<option value="+html_id+">"+kd_item_no_polisi+" - "+kd_item_ket+"</option>"; 
												}
												out.println(html_out);
											}
										%>
										<!--
										<option value="0">DD 1234 XY - Freego 125CC</option>
										-->
									</select>
								</div>
							</div>
							<div class="inline fields">
								<div class="three wide field">
									<label><b>Tanggal</b></label>
								</div>
								<div class="field">
									<input name="tanggal_id" type="date" id="tanggal_input">
								</div>
							</div>
							<div class="inline fields">
								<div class="three wide field">
									<label><b>Pemeriksa</b></label>
								</div>
								<div class="field">
									<select name="pemeriksa_id" id="pemeriksa_input_select" class="ui dropdown selection input_select">
										<option value="" hidden="true" selected="selected"></option>
										<option value="0">Ary Shanty S.E</option>
									</select>	
								</div>
							</div>
                            <div class="ui divider"></div>
                            <center><h3><b>PENILAIAN</b></h3></center>
							<div class="inline fields">
								<div class="three wide field">
									<label><b>SIM</b></label> 
								</div>
								<div class="field">
									<select name="sim_cat" id="sim_input_select" class="ui dropdown selection input_select">
										<option value="" hidden="true" selected="selected"></option>
										<option value="0">Good/Bagus</option>
										<option value="1">Bad/Buruk</option>
										<option value="2">Not Available/Tidak Dijumpai</option>
									</select>
								</div>
							</div>
							<div class="inline fields">
								<div class="three wide field">
									<label><b>STNK</b></label> 
								</div>
								<div class="field">
									<select name="stnk_cat" id="stnk_input_select" class="ui dropdown selection input_select">
										<option value="" hidden="true" selected="selected"></option>
										<option value="0">Good/Bagus</option>
										<option value="1">Bad/Buruk</option>
										<option value="2">Not Available/Tidak Dijumpai</option>
									</select>
								</div>
							</div>
							<div class="inline fields">
								<div class="three wide field">
									<label><b>Plat No Depan</b></label> 
								</div>
								<div class="field">
									<select name="plat_no_depan_cat" id="plat_no_depan_input_select" class="ui dropdown selection input_select">
										<option value="" hidden="true" selected="selected"></option>
										<option value="0">Good/Bagus</option>
										<option value="1">Bad/Buruk</option>
										<option value="2">Not Available/Tidak Dijumpai</option>
									</select>
								</div>
							</div>
							<div class="inline fields">
								<div class="three wide field">
									<label><b>Plat No Belakang</b></label> 
								</div>
								<div class="field">
									<select name="plat_no_belakang_cat" id="plat_no_belakang_input_select" class="ui dropdown selection input_select">
										<option value="" hidden="true" selected="selected"></option>
										<option value="0">Good/Bagus</option>
										<option value="1">Bad/Buruk</option>
										<option value="2">Not Available/Tidak Dijumpai</option>
									</select>
								</div>
							</div>
							<div class="inline fields">
								<div class="three wide field">
									<label><b>Lampu Jauh</b></label> 
								</div>
								<div class="field">
									<select name="lampu_jauh_cat" id="lampu_jauh_input_select" class="ui dropdown selection input_select">
										<option value="" hidden="true" selected="selected"></option>
										<option value="0">Good/Bagus</option>
										<option value="1">Bad/Buruk</option>
										<option value="2">Not Available/Tidak Dijumpai</option>
									</select>
								</div>
							</div>
							<div class="inline fields">
								<div class="three wide field">
									<label><b>Lampu Dekat</b></label> 
								</div>
								<div class="field">
									<select name="lampu_dekat_cat" id="lampu_dekat_input_select" class="ui dropdown selection input_select">
										<option value="" hidden="true" selected="selected"></option>
										<option value="0">Good/Bagus</option>
										<option value="1">Bad/Buruk</option>
										<option value="2">Not Available/Tidak Dijumpai</option>
									</select>
								</div>
							</div>
							<div class="inline fields">
								<div class="three wide field">
									<label><b>Lampu Sen Kanan</b></label> 
								</div>
								<div class="field">
									<select name="lampu_sen_kanan_cat" id="lampu_belok_kanan_input_select" class="ui dropdown selection input_select">
										<option value="" hidden="true" selected="selected"></option>
										<option value="0">Good/Bagus</option>
										<option value="1">Bad/Buruk</option>
										<option value="2">Not Available/Tidak Dijumpai</option>
									</select>
								</div>
							</div>
							<div class="inline fields">
								<div class="three wide field">
									<label><b>Lampu Sen Kiri</b></label> 
								</div>
								<div class="field">
									<select name="lampu_sen_kiri_cat" id="lampu_belok_kiri_input_select" class="ui dropdown selection input_select">
										<option value="" hidden="true" selected="selected"></option>
										<option value="0">Good/Bagus</option>
										<option value="1">Bad/Buruk</option>
										<option value="2">Not Available/Tidak Dijumpai</option>
									</select>
								</div>
							</div>
							<div class="inline fields">
								<div class="three wide field">
									<label><b>Klakson</b></label> 
								</div>
								<div class="field">
									<select name="klakson_cat" id="klakson_input_select" class="ui dropdown selection input_select">
										<option value="" hidden="true" selected="selected"></option>
										<option value="0">Good/Bagus</option>
										<option value="1">Bad/Buruk</option>
										<option value="2">Not Available/Tidak Dijumpai</option>
									</select>
								</div>
							</div>
							<div class="inline fields">
								<div class="three wide field">
									<label><b>Rem</b></label> 
								</div>
								<div class="field">
									<select name="rem_cat" id="rem_input_select" class="ui dropdown selection input_select">
										<option value="" hidden="true" selected="selected"></option>
										<option value="0">Good/Bagus</option>
										<option value="1">Bad/Buruk</option>
										<option value="2">Not Available/Tidak Dijumpai</option>
									</select>
								</div>
							</div>
							<div class="inline fields">
								<div class="three wide field">
									<label><b>Kaca Spion Kanan</b></label> 
								</div>
								<div class="field">
									<select name="kaca_spion_kanan_cat" id="kaca_spion_kanan_input_select" class="ui dropdown selection input_select">
										<option value="" hidden="true" selected="selected"></option>
										<option value="0">Good/Bagus</option>
										<option value="1">Bad/Buruk</option>
										<option value="2">Not Available/Tidak Dijumpai</option>
									</select>
								</div>
							</div>
							<div class="inline fields">
								<div class="three wide field">
									<label><b>Kaca Spion Kiri</b></label> 
								</div>
								<div class="field">
									<select name="kaca_spion_kiri_cat" id="kaca_spion_kiri_input_select" class="ui dropdown selection input_select">
										<option value="" hidden="true" selected="selected"></option>
										<option value="0">Good/Bagus</option>
										<option value="1">Bad/Buruk</option>
										<option value="2">Not Available/Tidak Dijumpai</option>
									</select>
								</div>
							</div>
							<div class="inline fields">
								<div class="three wide field">
									<label><b>Oli Mesin</b></label> 
								</div>
								<div class="field">
									<select name="oli_mesin_cat" id="oli_mesin_input_select" class="ui dropdown selection input_select">
										<option value="" hidden="true" selected="selected"></option>
										<option value="0">Good/Bagus</option>
										<option value="1">Bad/Buruk</option>
										<option value="2">Not Available/Tidak Dijumpai</option>
									</select>
								</div>
							</div>
							<div class="inline fields">
								<div class="three wide field">
									<label><b>Tekanan Ban Depan</b></label> 
								</div>
								<div class="field">
									<select name="tekanan_ban_depan_cat" id="tekanan_ban_depan_input_select" class="ui dropdown selection input_select">
										<option value="" hidden="true" selected="selected"></option>
										<option value="0">Good/Bagus</option>
										<option value="1">Bad/Buruk</option>
										<option value="2">Not Available/Tidak Dijumpai</option>
									</select>
								</div>
							</div>
							<div class="inline fields">
								<div class="three wide field">
									<label><b>Tekanan Ban Belakang</b></label> 
								</div>
								<div class="field">
									<select name="tekanan_ban_belakang_cat" id="tekanan_ban_belakang_input_select" class="ui dropdown selection input_select">
										<option value="" hidden="true" selected="selected"></option>
										<option value="0">Good/Bagus</option>
										<option value="1">Bad/Buruk</option>
										<option value="2">Not Available/Tidak Dijumpai</option>
									</select>
								</div>
							</div>
							<div class="inline fields">
								<div class="three wide field">
									<label><b>Lainnya</b></label> 
								</div>
								<div class="eight wide field">					
									<textarea name="lainnya_input" cols="500" id="lainnya_input_textarea" class="ui dropdown selection"></textarea>
								</div>
							</div>
						</div>
						<br>
						<div class="ui container center aligned">
							<div class="row">
								<div class="column">
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
		<!-- html for view_popup -->
		<div class="ui container">
			<div class="ui large modal" id="view_popup">
				<div class="header">Kartu Kendali</div>
				<div class="scrolling content">
					<div class="ui form">                
						<center><h3><b>IDENTITAS</b></h3></center>
						<div class="inline fields">
							<div class="three wide field">
								<label><b>Nama</b></label>
							</div>
							<div class="field">				
								<input type="text" id="pegawai_view_input" disabled>
							</div>
						</div>
						<div class="inline fields">
							<div class="three wide field">
								<label><b>Kendaraan Dinas</b></label>
							</div>
							<div class="field">
								<input type="text" id="kd_view_input" disabled>
							</div>
						</div>
						<div class="inline fields">
							<div class="three wide field">
								<label><b>Tanggal</b></label>
							</div>
							<div class="field">
								<input type="date" id="tanggal_view_input" disabled>
							</div>
						</div>
						<div class="inline fields">
							<div class="three wide field">
								<label><b>Pemeriksa</b></label>
							</div>
							<div class="field">
								<input type="text" id="pemeriksa_view_input" disabled>
							</div>
						</div>
						<div class="ui divider"></div>
						<center><h3><b>PENILAIAN</b></h3></center>
						<div class="inline fields">
							<div class="three wide field">
								<label><b>SIM</b></label> 
							</div>
							<div class="field">
								<select id="sim_view_select" class="ui dropdown selection input_select" disabled>
									<option value="" hidden="true" selected="selected"></option>
									<option value="0">Good/Bagus</option>
									<option value="1">Bad/Buruk</option>
									<option value="2">Not Available/Tidak Dijumpai</option>
								</select>
							</div>
						</div>
						<div class="inline fields">
							<div class="three wide field">
								<label><b>STNK</b></label> 
							</div>
							<div class="field">
								<select id="stnk_view_select" class="ui dropdown selection input_select" disabled>
									<option value="" hidden="true" selected="selected"></option>
									<option value="0">Good/Bagus</option>
									<option value="1">Bad/Buruk</option>
									<option value="2">Not Available/Tidak Dijumpai</option>
								</select>
							</div>
						</div>
						<div class="inline fields">
							<div class="three wide field">
								<label><b>Plat No Depan</b></label> 
							</div>
							<div class="field">
								<select id="plat_no_depan_view_select" class="ui dropdown selection input_select" disabled>
									<option value="" hidden="true" selected="selected"></option>
									<option value="0">Good/Bagus</option>
									<option value="1">Bad/Buruk</option>
									<option value="2">Not Available/Tidak Dijumpai</option>
								</select>
							</div>
						</div>
						<div class="inline fields">
							<div class="three wide field">
								<label><b>Plat No Belakang</b></label> 
							</div>
							<div class="field">
								<select id="plat_no_belakang_view_select" class="ui dropdown selection input_select" disabled>
									<option value="" hidden="true" selected="selected"></option>
									<option value="0">Good/Bagus</option>
									<option value="1">Bad/Buruk</option>
									<option value="2">Not Available/Tidak Dijumpai</option>
								</select>
							</div>
						</div>
						<div class="inline fields">
							<div class="three wide field">
								<label><b>Lampu Jauh</b></label> 
							</div>
							<div class="field">
								<select id="lampu_jauh_view_select" class="ui dropdown selection input_select" disabled>
									<option value="" hidden="true" selected="selected"></option>
									<option value="0">Good/Bagus</option>
									<option value="1">Bad/Buruk</option>
									<option value="2">Not Available/Tidak Dijumpai</option>
								</select>
							</div>
						</div>
						<div class="inline fields">
							<div class="three wide field">
								<label><b>Lampu Dekat</b></label> 
							</div>
							<div class="field">
								<select id="lampu_dekat_view_select" class="ui dropdown selection input_select" disabled>
									<option value="" hidden="true" selected="selected"></option>
									<option value="0">Good/Bagus</option>
									<option value="1">Bad/Buruk</option>
									<option value="2">Not Available/Tidak Dijumpai</option>
								</select>
							</div>
						</div>
						<div class="inline fields">
							<div class="three wide field">
								<label><b>Lampu Sen Kanan</b></label> 
							</div>
							<div class="field">
								<select id="lampu_belok_kanan_view_select" class="ui dropdown selection input_select" disabled>
									<option value="" hidden="true" selected="selected"></option>
									<option value="0">Good/Bagus</option>
									<option value="1">Bad/Buruk</option>
									<option value="2">Not Available/Tidak Dijumpai</option>
								</select>
							</div>
						</div>
						<div class="inline fields">
							<div class="three wide field">
								<label><b>Lampu Sen Kiri</b></label> 
							</div>
							<div class="field">
								<select id="lampu_belok_kiri_view_select" class="ui dropdown selection input_select" disabled>
									<option value="" hidden="true" selected="selected"></option>
									<option value="0">Good/Bagus</option>
									<option value="1">Bad/Buruk</option>
									<option value="2">Not Available/Tidak Dijumpai</option>
								</select>
							</div>
						</div>
						<div class="inline fields">
							<div class="three wide field">
								<label><b>Klakson</b></label> 
							</div>
							<div class="field">
								<select id="klakson_view_select" class="ui dropdown selection input_select" disabled>
									<option value="" hidden="true" selected="selected"></option>
									<option value="0">Good/Bagus</option>
									<option value="1">Bad/Buruk</option>
									<option value="2">Not Available/Tidak Dijumpai</option>
								</select>
							</div>
						</div>
						<div class="inline fields">
							<div class="three wide field">
								<label><b>Rem</b></label> 
							</div>
							<div class="field">
								<select id="rem_view_select" class="ui dropdown selection input_select" disabled>
									<option value="" hidden="true" selected="selected"></option>
									<option value="0">Good/Bagus</option>
									<option value="1">Bad/Buruk</option>
									<option value="2">Not Available/Tidak Dijumpai</option>
								</select>
							</div>
						</div>
						<div class="inline fields">
							<div class="three wide field">
								<label><b>Kaca Spion Kanan</b></label> 
							</div>
							<div class="field">
								<select id="kaca_spion_kanan_view_select" class="ui dropdown selection input_select" disabled>
									<option value="" hidden="true" selected="selected"></option>
									<option value="0">Good/Bagus</option>
									<option value="1">Bad/Buruk</option>
									<option value="2">Not Available/Tidak Dijumpai</option>
								</select>
							</div>
						</div>
						<div class="inline fields">
							<div class="three wide field">
								<label><b>Kaca Spion Kiri</b></label> 
							</div>
							<div class="field">
								<select id="kaca_spion_kiri_view_select" class="ui dropdown selection input_select" disabled>
									<option value="" hidden="true" selected="selected"></option>
									<option value="0">Good/Bagus</option>
									<option value="1">Bad/Buruk</option>
									<option value="2">Not Available/Tidak Dijumpai</option>
								</select>
							</div>
						</div>
						<div class="inline fields">
							<div class="three wide field">
								<label><b>Oli Mesin</b></label> 
							</div>
							<div class="field">
								<select id="oli_mesin_view_select" class="ui dropdown selection input_select" disabled>
									<option value="" hidden="true" selected="selected"></option>
									<option value="0">Good/Bagus</option>
									<option value="1">Bad/Buruk</option>
									<option value="2">Not Available/Tidak Dijumpai</option>
								</select>
							</div>
						</div>
						<div class="inline fields">
							<div class="three wide field">
								<label><b>Tekanan Ban Depan</b></label> 
							</div>
							<div class="field">
								<select id="tekanan_ban_depan_view_select" class="ui dropdown selection input_select" disabled>
									<option value="" hidden="true" selected="selected"></option>
									<option value="0">Good/Bagus</option>
									<option value="1">Bad/Buruk</option>
									<option value="2">Not Available/Tidak Dijumpai</option>
								</select>
							</div>
						</div>
						<div class="inline fields">
							<div class="three wide field">
								<label><b>Tekanan Ban Belakang</b></label> 
							</div>
							<div class="field">
								<select id="tekanan_ban_belakang_view_select" class="ui dropdown selection input_select" disabled>
									<option value="" hidden="true" selected="selected"></option>
									<option value="0">Good/Bagus</option>
									<option value="1">Bad/Buruk</option>
									<option value="2">Not Available/Tidak Dijumpai</option>
								</select>
							</div>
						</div>
						<div class="inline fields">
							<div class="three wide field">
								<label><b>Lainnya</b></label> 
							</div>
							<div class="eight wide field">					
								<textarea cols="500" id="lainnya_view_textarea" disabled></textarea>
							</div>
						</div>
					</div>			
				</div>
				<div class="actions">
					<a class="ui red labeled icon button" id="view_close_popup"><i class="close icon"></i>Close</a>
				</div>
			</div>
		</div>
		<!-- html for view_popup -->
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
		$("#pegawai_daftar_select").dropdown();
        $(".input_select").dropdown();
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
    	var columnData = [];
		var tableData = [];
		<%@ include file="jsp_include/ViewEditDeleteColumn/view_edit_delete.js" %>
		viewIconCall = function(row){
			loadViewItem(row.getData());
		};
		let kdFormatter = function(cell, formatterParams,onRendered){
			let returnValue = cell.getRow().getData().kendaraan_dinas.no_polisi+" - "+cell.getRow().getData().kendaraan_dinas.ket;
    		return returnValue;
		}

		columnData.push({formatter:showIcon,width:60,frozen:true,hozAlign:"center",resizable:false,cellClick:function(e,cell){
    viewIconCall(cell.getRow());
}});
    	columnData.push({title:"Nama Pegawai",field:"pj_pegawai.nama",width:200,frozen:true});
		columnData.push({title:"Kendaraan Dinas",formatter:kdFormatter,hozAlign:"center"});
		columnData.push({title:"Tanggal",field:"tanggal"});
		columnData.push({title:"Bulan",field:"bulan"});
		columnData.push({title:"Tahun",field:"tahun"});
        var table = new Tabulator("#example-table", {
             // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
            data:tableData, //assign data to table
            layout:"fitColumns", //fit columns to width of table (optional)
            columns:columnData,
			pagination:true, //enable.
    		paginationSize:10, // this option can take any positive integer value
        });
	</script>
	<script type="text/javascript">
		//----------------- insert segment -------------------
		//Button
		//save data
		function saveInput(){
			//get identitas values;
			let pj_pegawai_id= $("#pegawai_input_select").val();
			let kendaraan_dinas_id= $("#kd_input_select").val();
			let tanggal_input = $("#tanggal_input").val();
			let pemeriksa_id = $("#pemeriksa_input_select").val();
			//=================================================//
			//get penilaian_values;
			let sim = $("#sim_input_select").val();
			let stnk = $("#stnk_input_select").val();
			let plat_no_depan = $("#plat_no_depan_input_select").val();
			let plat_no_belakang = $("#plat_no_belakang_input_select").val();
			let lampu_jauh = $("#lampu_jauh_input_select").val();
			let lampu_dekat = $("#lampu_dekat_input_select").val();
			let lampu_belok_kanan = $("#lampu_belok_kanan_input_select").val();
			let lampu_belok_kiri = $("#lampu_belok_kiri_input_select").val();
			let klakson = $("#klakson_input_select").val();
			let rem = $("#rem_input_select").val();
			let kaca_spion_kanan = $("#kaca_spion_kanan_input_select").val();
			let kaca_spion_kiri = $("#kaca_spion_kiri_input_select").val();
			let oli_mesin = $("#oli_mesin_input_select").val();
			let tekanan_ban_depan = $("#tekanan_ban_depan_input_select").val();
			let tekanan_ban_belakang = $("#tekanan_ban_belakang_input_select").val();
			let lainnya = $("#lainnya_input_textarea").val();
			let is_date_number = false;
			let tanggal = -1;
			let bulan = -1;
			let tahun = -1;
			try{
				try{
					let date_parsed = tanggal_input.split("-");
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
				if(is_date_number){

				} else{			
					$("#save_button_id").removeClass("disabled");			
					$($("#save_button_id").find("i")[0]).removeClass("loading spinner");
					$($("#save_button_id").find("i")[0]).addClass("save");
					return;
				}
			}
			data_send = {"pj_pegawai_id":pj_pegawai_id,"kendaraan_dinas_id":kendaraan_dinas_id,"tanggal":tanggal,"bulan":bulan,"tahun":tahun,"pemeriksa_id":pemeriksa_id,"sim":sim,"stnk":stnk,"plat_no_depan":plat_no_depan,"plat_no_belakang":plat_no_belakang,"plat_no_depan":plat_no_depan,"plat_no_belakang":plat_no_belakang,"lampu_jauh":lampu_jauh,"lampu_dekat":lampu_dekat,"lampu_belok_kanan":lampu_belok_kanan,"lampu_belok_kiri":lampu_belok_kiri,"klakson":klakson,"rem":rem,"kaca_spion_kanan":kaca_spion_kanan,"kaca_spion_kiri":kaca_spion_kiri,"oli_mesin":oli_mesin,"tekanan_ban_depan":tekanan_ban_depan,"tekanan_ban_belakang":tekanan_ban_belakang,"lainnya":lainnya};
			$.ajax({url:"/api/kartu_kendali/insert",method:"post",data:JSON.stringify(data_send),contentType:"application/json",success:function(){
				alert("success");
				$("#daftar_menu").click();
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
        function loadData(table_data){
			table.replaceData(table_data)
			.then(function(){
			    //run code after table has been successfully updated
			})
			.catch(function(error){
			    //handle error loading data
			});
        }
		//refresh_data
		function refreshData(){
			let pegawai_id_list = $("#pegawai_daftar_select").val();	
			let link_refresh_data = "";
			if(pegawai_id_list == "-1"){
				link_refresh_data = "/api/kartu_kendali/all";
			} else{
				link_refresh_data = "/api/kartu_kendali/pegawai/id/"+pegawai_id_list;
			}
			$.get(link_refresh_data,function(data,status){
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
		$("#refresh_button_id").click();
		$("#view_close_popup").click(function(){
			$("#view_popup").modal({"closable":false}).modal("hide");
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
		//loadKarKenData
		function loadViewItem(view_data){
			try{
				$("#pegawai_view_input").val(view_data.pj_pegawai.nama);
				$("#kd_view_input").val(view_data.kendaraan_dinas.no_polisi+" - "+view_data.kendaraan_dinas.ket);
				let tanggal = view_data.tanggal+"";
				let bulan = view_data.bulan+"";
				let tahun = view_data.tahun+"";
				if(tanggal.length == 1){
					tanggal = "0"+tanggal;
				} else{}
				if(bulan.length == 1){
					bulan = "0"+bulan;
				} else{}
				console.log(tahun+"-"+bulan+"-"+tanggal);
				$("#tanggal_view_input").val(tahun+"-"+bulan+"-"+tanggal);
				$("#pemeriksa_view_input").val(view_data.pemeriksa.nama);
				$("#sim_view_select").val(""+view_data.sim).change();
				$("#stnk_view_select").val(""+view_data.stnk).change();
				$("#plat_no_depan_view_select").val(view_data.plat_no_depan).change();
				$("#plat_no_belakang_view_select").val(view_data.plat_no_belakang).change();
				$("#lampu_jauh_view_select").val(view_data.lampu_jauh).change();
				$("#lampu_dekat_view_select").val(view_data.lampu_dekat).change();
				$("#lampu_belok_kanan_view_select").val(view_data.lampu_belok_kanan).change();
				$("#lampu_belok_kiri_view_select").val(view_data.lampu_belok_kiri).change();
				$("#klakson_view_select").val(view_data.klakson).change();
				$("#rem_view_select").val(view_data.rem).change();
				$("#kaca_spion_kanan_view_select").val(view_data.kaca_spion_kanan).change();
				$("#kaca_spion_kiri_view_select").val(view_data.kaca_spion_kiri).change();
				$("#oli_mesin_view_select").val(view_data.oli_mesin).change();
				$("#tekanan_ban_depan_view_select").val(view_data.tekanan_ban_depan).change();
				$("#tekanan_ban_belakang_view_select").val(view_data.tekanan_ban_belakang).change();
				$("#lainnya_view_textarea").val(view_data.lainnya);
				$("#view_popup").modal("show");
			} catch(err){
				console.log(err.message);
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
