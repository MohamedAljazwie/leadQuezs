<!--<html>
--><title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>

<div class="w3-container">
  <h1>The <strong>w3-display-container</strong> Class</h1>
  <p>Position of text inside an image</p>
  
  <div class="w3-display-container w3-text-white">
      <img src="images/leadquizzes.jpg" alt="Lights" style="width:100%"> Left</div>
    <div class="w3-padding w3-display-middle w3-xxlarge">Middle1</div>
     <div class="w3-padding w3-display-middle w3-display-bottommiddle">Middle2</div>
  </div>
</div>

</body>
</html>
<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<div class="w3-container">
  <h2>Avatar List</h2>
  <p>You can combine w3-ul and the w3-bar classes to create an avatar list:</p>
  <ul class="w3-ul w3-card-4">
    <li class="w3-bar">
      <span onclick="this.parentElement.style.display='none'" class="w3-bar-item w3-button w3-white w3-xlarge w3-right">×</span>
      <img src="img_avatar2.png" class="w3-bar-item w3-circle w3-hide-small" style="width:85px">
      <div class="w3-bar-item">
        <span class="w3-large">Mike</span><br>
        <span>Web Designer</span>
      </div>
    </li>

    <li class="w3-bar">
      <span onclick="this.parentElement.style.display='none'" class="w3-bar-item w3-button w3-white w3-xlarge w3-right">×</span>
      <img src="img_avatar5.png" class="w3-bar-item w3-circle w3-hide-small" style="width:85px">
      <div class="w3-bar-item">
        <span class="w3-large">Jill</span><br>
        <span>Support</span>
      </div>
    </li>

    <li class="w3-bar">
      <span onclick="this.parentElement.style.display='none'" class="w3-bar-item w3-button w3-white w3-xlarge w3-right">×</span>
      <img src="img_avatar6.png" class="w3-bar-item w3-circle w3-hide-small" style="width:85px">
      <div class="w3-bar-item">
        <span class="w3-large">Jane</span><br>
        <span>Accountant</span>
      </div>
    </li>
  </ul>
</div>
<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>

<div class="w3-container">

<h2>Full-width Buttons (w3-button)</h2>
<p>The <strong>w3-block</strong> class creates a full-width button.</p>
<p><button class="w3-button w3-block w3-black">Button</button></p>
<p><button class="w3-button w3-block w3-teal">Button</button></p>
<p><button class="w3-button w3-block w3-red w3-left-align">Button</button></p>

<h2>Full-width Buttons (w3-btn)</h2>
<p><button class="w3-btn w3-block w3-black">Button</button></p>
<p><button class="w3-btn w3-block w3-teal">Button</button></p>
<p><button class="w3-btn w3-block w3-red w3-left-align">Button</button></p>

</div>

</body>
</html> 

<html>
    <script>


        function addRow() {
            var table = document.getElementById('myTable');
    //var row = document.getElementById("myTable");
            var x = table.insertRow(0);
            var e = table.rows.length - 1;
            var l = table.rows[e].cells.length;
    //x.innerHTML = "&nbsp;";
            for (var c = 0, m = l; c < m; c++) {
                table.rows[0].insertCell(c);
                table.rows[0].cells[c].innerHTML = "&nbsp;&nbsp;";
            }

        }




        function addColumn() {
            var table = document.getElementById('myTable');
            for (var r = 0, n = table.rows.length; r < n; r++) {
                table.rows[r].insertCell(0);
                table.rows[r].cells[0].innerHTML = "&nbsp;&nbsp;";

            }

        }

        function deleteRow() {
            document.getElementById("myTable").deleteRow(0);

        }

        function deleteColumn() {
            // var row = document.getElementById("myRow");
            var table = document.getElementById('myTable');
            for (var r = 0, n = table.rows.length; r < n; r++) {
                table.rows[r].deleteCell(0);//var table handle 
            }
        }

    </script>
    <body>
        <input type="button" value="row +" onClick="addRow()" border=0       style='cursor:hand'>
        <input type="button" value="row -" onClick='deleteRow()' border=0 style='cursor:hand'>
        <input type="button" value="column +" onClick="addColumn()" border=0 style='cursor:hand'>
        <input type="button" value="column -" onClick='deleteColumn()' border=0 style='cursor:hand'>

        <table  id='myTable' border=1 cellpadding=0 cellspacing=0>
            <tr id='myRow'>          
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>          
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>

        </table>



        <form id="form1" runat="server"> 
            <div class="row modalpop-body"> 
                <table>
                    <thead>
                        <tr>
                            <td class="col-md-4">Start Position</td>
                            <td class="col-md-4">Type of Scramble</td>
                            <td class="col-md-4">Scrambling Required</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="col-md-4"><textarea class="form-control" rows="3" id="comment"></textarea></td>
                            <td class="col-md-4"><div class="dropdown">
                                    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Dropdown Example
                                        <span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">HTML</a></li>
                                        <li><a href="#">CSS</a></li>
                                        <li><a href="#">JavaScript</a></li>
                                    </ul>
                                </div></td>
                            <td class="col-md-4"><div class="dropdown">
                                    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Dropdown Example
                                        <span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">HTML</a></li>
                                        <li><a href="#">CSS</a></li>
                                        <li><a href="#">JavaScript</a></li>
                                    </ul>
                                </div></td>
                        </tr>
                    </tbody>
                </table>
            </div>
       
    <body>
    <form method="post" name="form">
    <input type="text" name="name" />
    <input type="submit" name="submit1" value="submit1" onclick="javascript: form.action='test1.php';" />
    <input type="submit" name="submit2" value="submit2" onclick="javascript: form.action='test2.php';"/>
    <input type="submit" name="submit3" value="submit3" onclick="javascript: form.action='test3.php';" />
    </form>
    
        
        <script>
            function validateForm() {
                //alert('Validating form...');
                var text = document.getElementById('txtValue').value;
                text = escape(text);
                location.href = 'questionprocess.jsp?action=registerQuestion&rows=' + text;
                return false;
            }
        </script>
        <form id="frmTest" method="get" action="" onsubmit="return validateForm();">
            <input id="txtValue" type="text" value="5">
            <input id="btnSubmit" type="submit" value="Submit">
        </form>
        
        <br/>
        <br/>
        <!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.dropbtn {
    background-color: #3498DB;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
}

.dropbtn:hover, .dropbtn:focus {
    background-color: #2980B9;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f1f1f1;
    min-width: 160px;
    overflow: auto;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown a:hover {background-color: #ddd;}

.show {display: block;}
</style>


<h2>Clickable Dropdown</h2>
<p>Click on the button to open the dropdown menu.</p>

<div class="dropdown">
<button onclick="myFunction()" class="dropbtn">Dropdown</button>
  <div id="myDropdown" class="dropdown-content">
    <a href="#home">Home</a>
    <a href="#about">About</a>
    <a href="#contact">Contact</a>
  </div>
</div>

<script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
</script>


<br/>
<br/>
<br/>
<script>
    function dateGenerate() {
   var date = new Date(), dateArray = new Array(), i;
   curYear = date.getFullYear();
    for(i = 0; i<5; i++) {
        dateArray[i] = curYear+i;
    }
    return dateArray;
}

function addSelect(divname) {
   var newDiv=document.createElement('div');
   var html = '<select>', dates = dateGenerate(), i;
   for(i = 0; i < dates.length; i++) {
       html += "<option value='"+dates[i]+"'>"+dates[i]+"</option>";
   }
   html += '</select>';
   newDiv.innerHTML= html;
   document.getElementById(divname).appendChild(newDiv);
}
    </script>

<div id="select-container">
</div>
<button id="add" onclick="addSelect('select-container');">Add Dropdown</button>
  
<br/>
<br/>
<div class="ui floating labeled icon dropdown button">
  <i class="add user icon"></i>
  <span class="text">Add User</span>
  <div class="menu">
    <div class="header">
      People You Might Know
    </div>
    <div class="item">
      <img class="ui avatar image" src="/images/avatar/small/jenny.jpg">
      Jenny Hess
    </div>
    <div class="item">
      <img class="ui avatar image" src="/images/avatar/small/elliot.jpg">
      Elliot Fu
    </div>
    <div class="item">
      <img class="ui avatar image" src="/images/avatar/small/stevie.jpg">
      Stevie Feliciano
    </div>
    <div class="header">
      Your Friends' Friends
    </div>
    <div class="item">
      <img class="ui avatar image" src="/images/avatar/small/christian.jpg">
      Christian
    </div>
    <div class="item">
      <img class="ui avatar image" src="/images/avatar/small/matt.jpg">
      Matt
    </div>
    <div class="item">
      <img class="ui avatar image" src="/images/avatar/small/justen.jpg">
      Justen Kitsune
    </div>
  </div>
</div>

<br/>
<style>
    body {
  color: #000000;
  font-family: Sans-Serif;
  padding: 30px;
  background-color: #f6f6f6;
}

a {
  text-decoration: none;
  color: #000000;
}

a:hover {
  color: #222222
}

/* Dropdown */

.dropdown {
  display: inline-block;
  position: relative;
}

.dd-button {
  display: inline-block;
  border: 1px solid gray;
  border-radius: 4px;
  padding: 10px 30px 10px 20px;
  background-color: #ffffff;
  cursor: pointer;
  white-space: nowrap;
}

.dd-button:after {
  content: '';
  position: absolute;
  top: 50%;
  right: 15px;
  transform: translateY(-50%);
  width: 0; 
  height: 0; 
  border-left: 5px solid transparent;
  border-right: 5px solid transparent;
  border-top: 5px solid black;
}

.dd-button:hover {
  background-color: #eeeeee;
}


.dd-input {
  display: none;
}

.dd-menu {
  position: absolute;
  top: 100%;
  border: 1px solid #ccc;
  border-radius: 4px;
  padding: 0;
  margin: 2px 0 0 0;
  box-shadow: 0 0 6px 0 rgba(0,0,0,0.1);
  background-color: #ffffff;
  list-style-type: none;
}

.dd-input + .dd-menu {
  display: none;
} 

.dd-input:checked + .dd-menu {
  display: block;
} 

.dd-menu li {
  padding: 10px 20px;
  cursor: pointer;
  white-space: nowrap;
}

.dd-menu li:hover {
  background-color: #f6f6f6;
}

.dd-menu li a {
  display: block;
  margin: -10px -20px;
  padding: 10px 20px;
}

.dd-menu li.divider{
  padding: 0;
  border-bottom: 1px solid #cccccc;
}
</style>
<label class="dropdown">

  <div class="dd-button">
    Dropdown
  </div>

  <input type="checkbox" class="dd-input" id="test">

  <ul class="dd-menu">
    <li>Action</li>
    <li>Another action</li>
    <li>Something else here</li>
  </ul>
  
</label>
</body>
</html>
