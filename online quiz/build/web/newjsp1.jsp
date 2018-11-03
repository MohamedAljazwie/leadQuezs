<html>
<head>
    <script type="text/javascript" src="jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="function.js"></script>
</head>
<script>
    function Add(){
    $("#tblData tbody").append(
        "<tr>"+
        "<td><input type='text'/></td>"+
        "<td><input type='text'/></td>"+
        "<td><input type='text'/></td>"+
        "<td><img src='images/disk.png' class='btnSave'><img src='images/delete.png' class='btnDelete'/></td>"+
        "</tr>");
     
        $(".btnSave").bind("click", Save);      
        $(".btnDelete").bind("click", Delete);
}; 
function Save(){
    var par = $(this).parent().parent(); //tr
    var tdName = par.children("td:nth-child(1)");
    var tdPhone = par.children("td:nth-child(2)");
    var tdEmail = par.children("td:nth-child(3)");
    var tdButtons = par.children("td:nth-child(4)");
 
    tdName.html(tdName.children("input[type=text]").val());
    tdPhone.html(tdPhone.children("input[type=text]").val());
    tdEmail.html(tdEmail.children("input[type=text]").val());
    tdButtons.html("<img src='images/delete.png' class='btnDelete'/><img src='images/pencil.png' class='btnEdit'/>");
 
    $(".btnEdit").bind("click", Edit);
    $(".btnDelete").bind("click", Delete);
}; 
function Edit(){
    var par = $(this).parent().parent(); //tr
    var tdName = par.children("td:nth-child(1)");
    var tdPhone = par.children("td:nth-child(2)");
    var tdEmail = par.children("td:nth-child(3)");
    var tdButtons = par.children("td:nth-child(4)");
 
    tdName.html("<input type='text' id='txtName' value='"+tdName.html()+"'/>");
    tdPhone.html("<input type='text' id='txtPhone' value='"+tdPhone.html()+"'/>");
    tdEmail.html("<input type='text' id='txtEmail' value='"+tdEmail.html()+"'/>");
    tdButtons.html("<img src='images/disk.png' class='btnSave'/>");
 
    $(".btnSave").bind("click", Save);
    $(".btnEdit").bind("click", Edit);
    $(".btnDelete").bind("click", Delete);
};
function Delete(){
    var par = $(this).parent().parent(); //tr
    par.remove();
}; 
    
</script>
<body>
    
    <button id="btnAddd">New</button>
    <table id="tblData">          
        <thead>
            <tr>
                <th>Name</th>
                <th>Phone</th>
                <th>Email</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</body>
</html>