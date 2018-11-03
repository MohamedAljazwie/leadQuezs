
/* When the user clicks on the button, 
 toggle between hiding and showing the dropdown content */
function dropDownList() {
    document.getElementById("myDropdown").classList.toggle("show");
}
function dropDownList1() {
    document.getElementById("myDropdown").classList.toggle("show");
}
// Close the dropdown if the user clicks outside of it
window.onclick = function (event) {
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


// DELETE TABLE ROW.
function removeRow(oButton) {
    var empTab = document.getElementById('empTable');
    empTab.deleteRow(oButton.parentNode.parentNode.rowIndex);       // BUTTON -> TD -> TR.
}
function previewFile() {
    var preview = document.querySelector('img'); //selects the query named img
    var file = document.querySelector('input[type=file]').files[0]; //sames as here
    var reader = new FileReader();

    reader.onloadend = function () {
        preview.src = reader.result;
    }

    if (file) {
        reader.readAsDataURL(file); //reads the data as a URL
    } else {
        preview.src = "";
    }
}
function GetCellValues() {
    var table = document.getElementById('empTable');
    for (var r = 0, n = table.rows.length; r < n; r++) {
        for (var c = 0, m = table.rows[r].cells.length; c < m; c++) {
            if (c == 1)
            {
                table.rows[r].cells[c].innerHTML;
            }
        }
    }
}
var request;
function sendInfo()
{
    empTab = document.getElementById('empTable');

    var rowCnt = empTab.rows.length;
    var url = "registerprocess.jsp?action=registerQuestion";
    document.getElementById('addQuestion').rows.value = rowCnt;
    document.getElementById('addQuestion').action = url;


}
function sendInfo1()
{
    var text = document.getElementById('empTable').rows.length;
    text = escape(text);
    location.href = 'questionprocess.jsp?action=registerQuestion&rows=' + text;
    return false;
}
function getInfo() {
    if (request.readyState == 4) {
        var val = request.responseText;
        document.getElementById('location').innerHTML = val;
    }
}


/*
 *    function increasindex()
            {
        <c:set var="answerIndex" value="${answerIndex+1}"/>
                var dropdown = document.getElementById('dropdown');
                var mydropdown = document.createElement('div');

                mydropdown.setAttribute('id', 'myDropdown${answerIndex}');
                mydropdown.setAttribute('class', 'dropdown-conten');
        
            <c:set var="indexOutCome" value="1"/>
            <c:forEach var="outCome" items="${outComes}" >
                var myinput = document.createElement('input');
                myinput.setAttribute('class', 'w3-button w3-block w3-light-grey read_more');
                myinput.setAttribute('type', 'button');
                myinput.setAttribute('value', '${outCome.value.title}');
                myinput.setAttribute('name', 'answer${answerIndex}_${indexOutCome}_outComeTitle');
                mydropdown.appendChild(myinput);

                <c:set var="indexOutCome" value="${indexOutCome+1}"/>

            </c:forEach>
                document.getElementsByTagName('body').appendChild(mydropdown);

            }
 */