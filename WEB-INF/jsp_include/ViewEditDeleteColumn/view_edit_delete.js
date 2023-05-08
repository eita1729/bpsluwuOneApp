var viewIconCall = function(row){};
var editIconCall = function(row){};
var deleteIconCall = function(row){};
let showIcon = function(cell, formatterParams,onRendered){
    return "<button class='ui blue small icon button'><i class='ui small eye icon'></i></button>";
}
let editIcon = function(cell, formatterParams,onRendered){
    return "<button class='ui grey small icon button'><i class='ui small edit icon'></i></button>";
}
let deleteIcon = function(cell, formatterParams,onRendered){
    return "<button class='ui red small icon button'><i class='ui small trash alternate icon'></i></button>";
}
//view,edit,delete column//
let viewColumn = {formatter:showIcon,width:40,hozAlign:"center",resizable:false,cellClick:function(e,cell){
    viewIconCall(cell.getRow());
}};
let editColumn = {formatter:editIcon,width:40,hozAlign:"center",resizable:false,cellClick:function(e,cell){
    editIconCall(cell.getRow());
}};
let deleteColumn = {formatter:deleteIcon,width:40,hozAlign:"center",resizable:false,cellClick:function(e,cell){
    $("#cancel_delete_button").click(function(){
        $("#delete_popup").modal("hide");
        return false;
    });
    $("#process_delete_button").click({row:(cell.getRow())},function(event){
        deleteIconCall(event.data.row);
        return false;
    });
    $("#delete_popup").modal({"closable":false}).modal("show");
}};
