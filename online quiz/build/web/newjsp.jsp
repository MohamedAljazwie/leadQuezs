<!DOCTYPE html>
<html>
<head>
    <title>Dynamically Add Remove Table Rows in JavaScript</title>

    <style>
        table 
        {
            width: 70%;
            font: 17px Calibri;
        }
        table, th, td 
        {
            border: solid 1px #DDD;
            border-collapse: collapse;
            padding: 2px 3px;
            text-align: center;
        }
    </style>
</head>
<body onload="createTable()">
    <ps>Click the "Add New Row" button to add row to the table. Enter values in each row and press the "Submit Data" button. You can check the result in your browsers console window.</p>
    <p>
        <input type="button" id="addRow" value="Add New Row" onclick="addRow()" />
    </p>

    <!--THE CONTAINER WHERE WE'll ADD THE DYNAMIC TABLE-->
    <div id="cont"></div>

    <p><input type="button" id="bt" value="Sumbit Data" onclick="sumbit()" /></p>
</body>

<script>
    // ARRAY FOR HEADER.
    var arrHead = new Array();
    arrHead = ['', 'Emp. Name', 'Designation'];      // SIMPLY ADD OR REMOVE VALUES IN THE ARRAY FOR TABLE HEADERS.

    // FIRST CREATE A TABLE STRUCTURE BY ADDING A FEW HEADERS AND
    // ADD THE TABLE TO YOUR WEB PAGE.
    function createTable() {
        var empTable = document.createElement('table');
        empTable.setAttribute('id', 'empTable');            // SET THE TABLE ID.

        var tr = empTable.insertRow(-1);

        for (var h = 0; h < arrHead.length; h++) {
            var th = document.createElement('th');          // TABLE HEADER.
            th.innerHTML = arrHead[h];
            tr.appendChild(th);
        }

        var div = document.getElementById('cont');
        div.appendChild(empTable);    // ADD THE TABLE TO YOUR WEB PAGE.
    }

    // ADD A NEW ROW TO THE TABLE.s
    function addRow() {
        var empTab = document.getElementById('empTable');

        var rowCnt = empTab.rows.length;        // GET TABLE ROW COUNT.
        var tr = empTab.insertRow(rowCnt);      // TABLE ROW.
        tr = empTab.insertRow(rowCnt);

        for (var c = 0; c < arrHead.length; c++) {
            var td = document.createElement('td');          // TABLE DEFINITION.
            td = tr.insertCell(c);

            if (c == 0) {           // FIRST COLUMN.
                // ADD A BUTTON.
                var button = document.createElement('input');

                // SET INPUT ATTRIBUTE.
                button.setAttribute('type', 'button');
                button.setAttribute('value', 'Remove');

                // ADD THE BUTTON's 'onclick' EVENT.
                button.setAttribute('onclick', 'removeRow(this)');

                td.appendChild(button);
            }
            else {
                // CREATE AND ADD TEXTBOX IN EACH CELL.
                var ele = document.createElement('input');
                ele.setAttribute('type', 'text');
                ele.setAttribute('value', '');

                td.appendChild(ele);
            }
        }
    }

    // DELETE TABLE ROW.
    function removeRow(oButton) {
        var empTab = document.getElementById('empTable');
        empTab.deleteRow(oButton.parentNode.parentNode.rowIndex);       // BUTTON -> TD -> TR.
    }

    // EXTRACT AND SUBMIT TABLE DATA.
    function sumbit() {
        var myTab = document.getElementById('empTable');
        var values = new Array();

        // LOOP THROUGH EACH ROW OF THE TABLE.
        for (row = 1; row < myTab.rows.length - 1; row++) {
            for (c = 0; c < myTab.rows[row].cells.length; c++) {   // EACH CELL IN A ROW.

                var element = myTab.rows.item(row).cells[c];
                if (element.childNodes[0].getAttribute('type') == 'text') {
                    values.push("'" + element.childNodes[0].value + "'");
                }
            }
        }
        console.log(values);
    }
</script>
<script language="javascript1.1" src="http://leadoutcome.com/sites/leadoutcome.com/files/basicForm.js" type="text/javascript" ></script>
<form id="formWrapper" action="https://leadoutcome.com/track/form/submit" method="post" onSubmit="return checkRegistrationRequiredFields(this)">
    <input type="hidden"  name="leadType" value="cold" />
    <input type="hidden" name="leadCapture.leadSource" value="DESCRIPTION" />
    <input type="hidden" name="ad" value="tbd" />
    <input type="hidden" name="leadCapture.salesRepId" value="ACCOUNT ID" />
    <input type="hidden" name="redirectUrl" value="REDIRECTURL"/>
    <input type="hidden" name="leadCapture.phone" value="" />
    <input type="hidden" name="leadCapture.state" value="NA" />
    <table>
      <tr>
         <th><label class="field" for="firstName">
            <div align="right">First Name:</div>
            </label></th>
         <td><input name="leadCapture.firstName" type="text" value="" class="field" maxlength="50" id="firstName"/></td>
      </tr>
      <tr>
         <th><label class="field" for="lastName">
            <div align="right">Last Name:</div>
            </label></th>
         <td><input name="leadCapture.lastName" type="text" value="" class="field" maxlength="50" id="lastName"/></td>
      </tr>
      <tr>
         <th><label class="field" for="email">
            <div align="right">Email:</div>
            </label></th>
         <td><input name="leadCapture.email" type="text" value="" class="field" maxlength="50" id="email"/></td>
      </tr>
      <tr>
         <th><label class="field" for="phone">
            <div align="right">Phone:</div>
            </label></th>
         <td><input type="text" name="phoneAreaCode" id="phoneAreaCode" value="" size="3" maxlength="3" onKeyDown="nextTab(this,'down',3)" onKeyUp="nextTab(this,'up',3,this.form.phone1)" /><strong>-</strong><input type="text" size="3"  name="phone1" id="phone1" value="" maxlength="3" onKeyDown="nextTab(this,'down',3)" onKeyUp="nextTab(this,'up',3,this.form.phone2)" /><strong>-</strong><input type="text" name="phone2" id="phone2" value="" size="4" maxlength="4"  onkeydown="nextTab(this,'down',4)" onKeyUp="nextTab(this,'up',4,this.phoneExt)" /><strong>&nbsp;x</strong><input type="text"   name="phoneExt" id="phoneExt" value="" size="5" onFocus="this.value = '';" maxlength="4"  /></td>
      </tr>
      <tr> </tr>
      <tr>
         <td colspan="2" class="bt"><div align="center">
               <input type="submit" value="Submit" >
            </div></td>
      </tr>
    </table>
</form>
</html>