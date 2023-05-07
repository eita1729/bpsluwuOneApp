//download-button//		
$("#download_dropdown_id").dropdown();
$("#download_excel_id").click(function(){
    table.download("xlsx","Matriks.xlsx");
});
$("#download_csv_id").click(function(){
    table.download("csv","Matriks.csv");
});