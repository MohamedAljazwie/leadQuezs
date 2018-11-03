<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=windows-1256"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib  prefix="leadQuiezs" uri="https://java.sun.com/jsp/LeadQuiezs" %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <jsp:include page="header.jsp"></jsp:include>
        <!--<meta name="viewport" content="width=device-width, initial-scale=1"/>-->

        <script type="text/javascript" src="scripts.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <script>
            function addRow() {
                var arrHead = new Array();
                arrHead = ['', '', '', ''];
                var empTab = document.getElementById('empTable');

                var rowCnt = empTab.rows.length;        // GET TABLE ROW COUNT.
                var tr = empTab.insertRow(rowCnt);

                for (var c = 0; c < arrHead.length; c++) {

                    var td = document.createElement('td');          // TABLE DEFINITION.
                    td = tr.insertCell(c);

                    if (c == 0)
                    {

                        var ele = document.createElement('td');
                        ele.innerHTML = 'Answer';
                        td.appendChild(ele);
                    }
                    if (c == 1)
                    {
                        // CREATE AND ADD TEXTBOX IN EACH CELL.
                        var ele = document.createElement('input');
                        ele.setAttribute('type', 'text');
                        ele.setAttribute('name', 'answer' + rowCnt);
                        ele.setAttribute('class', 'contact_input');
//            ele.setAttribute('onkeyup', 'addAnswer(this.value)');
                        td.appendChild(ele);
                    }
                    if (c == 2) {           // FIRST COLUMN.
                        // ADD A BUTTON.
                        var button = document.createElement('select');
                        button.setAttribute('name', 'answer' + rowCnt + '_outComeTitle');
        <leadQuiezs:listAll listBy="outCome">
            <c:forEach var="outCome" items="${outComes}" >
                        var option = document.createElement('option');
                        option.text = '${outCome.value.title}';
                        option.setAttribute('value', '${outCome.value.title}');
                        button.appendChild(option);
            </c:forEach>
        </leadQuiezs:listAll>
                        td.appendChild(button);
                    }

                    if (c == 3) {           // FIRST COLUMN.
                        // ADD A BUTTON.
                        var button = document.createElement('input');

                        // SET INPUT ATTRIBUTE.
                        button.setAttribute('type', 'button');
                        button.setAttribute('value', '-');
                        button.setAttribute('class', 'w3-button w3-circle w3-teal')
                        // ADD THE BUTTON's 'onclick' EVENT.
                        button.setAttribute('onclick', 'removeRow(this)');

                        td.appendChild(button);
                    }

                }
            }


    </script>
    <center><h2>
            <c:if test="${!empty requestScope.message}">
                <B  style="color: navy;">
                    <B><c:out value="${message}"/></B></B>
                    </c:if>

        </h2></center>
    <div class="left_content">
        <div class="left_content">
            <div class="calendar_box">
                <leadQuiezs:listAll listBy="question">
                    <c:choose>
                        <c:when test="${empty questions}">
                            <div style="width:310px;float:left;padding:10px;margin:10px;">
                                <a href="#"><img src="images/leadquizzes.jpg"   border="0"/></a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <table style="width:350px;">
                                <c:forEach var="question" items="${questions}" >
                                    <tr>
                                        <td style="width: 300px;">
                                            <form class="tr" method="post" action="questions.jsp">
                                                <span class="td">
                                                    <input class="w3-button w3-block w3-light-grey"
                                                           type="submit" class="read_more" value="${question.value.name}" name="questionName"/>
                                                </span>
                                                <br/>
                                        </td>
                                        <td style="width:50px;">

                                            <button class="btn" onclick="javascript: form.action = 'registerprocess.jsp?action=removequestion&questionid=${question.value.questionID}'"><i class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                    </form>

                                </c:forEach>
                            </table>
                        </c:otherwise>
                    </c:choose>

                </leadQuiezs:listAll>

            </div>
            <br/>
            <div class="table">
                <form class="tr" method="post" action="questions.jsp">
                    <span class="td"><input  class="MyButton"
                                             type="submit" class="read_more" value="Create New Question"/></span>
                </form>
                <div class="tr">
                    <span class="td"></span>
                    <span class="td"></span>
                </div>

            </div>
        </div>

        <div class="calendar_box">

            <div class="calendar_box_content" id="location">
                <c:if test="${!empty  sessionScope.quiez}">
                    <B  style="color: navy;">
                        <B><c:out value=" Quez : ${ sessionScope.quiez.name}"/></B></B>
                            <c:choose>

                        <c:when test="${empty param.questionName}">
                            <jsp:useBean id="question" class="org.com.leadquiezs.Model.Question" scope="session">
                                <jsp:setProperty name="question" property="quiez" value="${sessionScope.quiez}"/>
                            </jsp:useBean>

                        </c:when>
                        <c:otherwise>

                            <c:set var="question" value="${questions[param.questionName]}" scope="session"/>
                            <c:set property="quiez" target="${sessionScope.question}" value="${sessionScope.quiez}" />
                        </c:otherwise>
                    </c:choose>
                </c:if>
                <form id="addQuestion" method="post" onsubmit="return sendInfo()">
                    <input type="hidden" name="rows" value=""/>

                    <table id="empTable" >
                        <tr><td>Quition Name:</td><td>
                                <input type="text" 
                                       style="width:225px;height:18px;float:left;border:1px #d1e0ee solid;background-color:#eef4d7;color: #000;" name="name" value="${question.name}"/></td>
                            <td></td>
                        </tr>

                        <tr><td>Answer Type</td>
                            <td colspan="3"><select name="typeAnswer" style=" width: 100%;display: block;border: 1px solid #ccc;border-radius: 4px;">
                                    <option>Text Answer</option>
                                    <option>Image Answer</option>
                                </select>
                            </td>
                        </tr>
                        <c:choose>
                            <c:when test="${empty question.name}">
                                <tr><td>Answer</td>
                                    <td><input  type="text" class="contact_input"name="answer2" value="${sessionScope.question.answer.answer}" /></td>	
                                    <td>
                                        <div class="dropdown">
                                            <select name="answer2_outComeTitle" >
                                                <!--<input type="button" class="w3-button w3-circle w3-teal dropbtn" onclick='dropDownList()'/>-->
                                                <div id="myDropdown" class="dropdown-content">

                                                    <leadQuiezs:listAll listBy="outCome">
                                                        <c:forEach var="outCome" items="${outComes}" >
                                                            <option value="${outCome.value.title}">${outCome.value.title}</option>
                                                        </c:forEach>

                                                    </leadQuiezs:listAll>
                                                </div>
                                            </select>

                                        </div>
                                    </td>

                                    <!--                                    <td>
                                                                            <div class="dropdown">
                                                                                <input type="button" class="w3-button w3-circle w3-teal dropbtn" onclick='dropDownList1()'/>
                                                                                <div id="myDropdown1" class="dropdown-content">
                                                                                    <a href="#home">Home</a>
                                                                                    <a href="#about">About</a>
                                                                                    <a href="#contact">Contact</a>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                        </td>-->
                                </tr>
                            </c:when>

                            <c:otherwise>
                                <c:set var="iterate" value="2"/>
                                <c:forEach var="answer" items="${question.answers}">
                                    <tr><td>Answer</td>
                                        <td><input type="text" class="contact_input"name="answer${iterate}" value="${answer.answer}"/></td>	
                                        <td>
                                            <div class="dropdown">
                                                <select name="answer${iterate}_outComeTitle" >
                                                    <!--<input type="button" class="w3-button w3-circle w3-teal dropbtn" onclick='dropDownList()'/>-->
                                                    <div id="myDropdown" class="dropdown-content">

                                                        <leadQuiezs:listAll listBy="outCome">
                                                            <c:forEach var="outCome" items="${outComes}" >
                                                                <option value="${outCome.value.title}">${outCome.value.title}</option>
                                                            </c:forEach>

                                                        </leadQuiezs:listAll>
                                                    </div>
                                                </select>

                                            </div>
                                        </td>

                                    </tr>
                                </c:forEach>

                            </c:otherwise>
                        </c:choose>

                    </table>
                    <br/>
                    <table ><tr><td><input class="w3-circle MyButton3" type="button" onclick='addRow(), increasindex()' value="Add Answer"/></td></td>
                            <td colspan="2"><input id="addQuesionButton" type="submit" 
                                                   class="MyButton1" value="Save&Create Question" onclick=" return  sendInfo()"/></td></tr>
                    </table>
                </form>
            </div>

        </div><!--end of right content-->

    </div>
    <!--end of left content-->



    <div id="footer">

    </div>


</div> <!--end of center box-->
</div> <!--end of main content-->
</div> <!--end of main container-->
</body></html>
