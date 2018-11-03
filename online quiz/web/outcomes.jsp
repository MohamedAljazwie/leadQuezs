<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=windows-1256"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib  prefix="leadQuiezs" uri="https://java.sun.com/jsp/LeadQuiezs" %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <jsp:include page="header.jsp"></jsp:include>
        <!--<meta name="viewport" content="width=device-width, initial-scale=1"/>-->
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <script>
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

            previewFile();  //calls the function named previewFile()
        </script>
        <center><h2>
            <c:if test="${!empty requestScope.message}">
                <B  style="color: navy;">
                    <B><c:out value="${message}"/></B></B>
                    </c:if>

        </h2></center>
    <div class="left_content">

        <div class="left_content">
            <div class="left_content">
                <div class="calendar_box">
                    <leadQuiezs:listAll listBy="outCome">
                        <c:choose>
                            <c:when test="${empty outComes}">
                                <div style="width:310px;float:left;padding:10px;margin:10px;">
                                    <a href="#"><img src="images/leadquizzes.jpg"   border="0"/></a>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <table style="width:350px;">
                                    <c:forEach var="outCome" items="${outComes}" >
                                        <tr>
                                            <td style="width: 300px;">
                                                <form class="tr" method="post" action="outcomes.jsp">
                                                    <span class="td">
                                                        <input class="w3-button w3-block w3-light-grey"
                                                               type="submit" class="read_more" value="${outCome.value.title}" name="outComeTitle" />
                                                    </span> 
                                                    <br/>
                                            </td>
                                            <td style="width:50px;">

                                                <button class="btn" onclick="javascript: form.action = 'registerprocess.jsp?action=removeoutCome&outcomeid=${outCome.value.outComeID}'"><i class="fa fa-trash"></i></button>
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
                    <form class="tr" method="post" action="outcomes.jsp">
                        <span class="td"><input  class="MyButton"
                                                 type="submit" class="read_more" value="Create New OutCome" /></span>
                    </form>
                    <div class="tr">
                        <span class="td"></span>
                        <span class="td"></span>
                    </div>

                </div>
            </div>
        </div>
        <div class="calendar_box">

            <div class="calendar_box_content">

                <form method="post" action="registerprocess.jsp?action=registerOutCome" >
                    <table>
                        <tr><td>
                                <c:if test="${!empty  sessionScope.quiez}">
                                    <B  style="color: navy;">
                                        <B><c:out value=" Quez : ${ sessionScope.quiez.name}"/></B></B>
                                            <c:choose>
                                                <c:when test="${empty param.outComeTitle}">
                                                    <jsp:useBean id="outCome" class="org.com.leadquiezs.Model.OutCome" scope="session">
                                                        <jsp:setProperty name="outCome" property="quiez" value="${sessionScope.quiez}"/>
                                                    </jsp:useBean>

                                        </c:when>
                                        <c:otherwise>

                                            <c:set var="outCome" value="${outComes[param.outComeTitle]}" scope="session"/>
                                            <jsp:setProperty name="outCome" property="quiez" value="${sessionScope.quiez}"/>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                            </td></tr>
                        <tr><td>OutCome Title </td><td><input type="text" class="contact_input" name="title" value="${outCome.title}" /></td></tr>
                        <tr><td>OutCome Type</td><td colspan="2"><select name="utComeType" 
                                                                         style=" width: 100%;display: block;border: 1px solid #ccc;border-radius: 4px;">
                                    <option>OutCome Builder</option>
                                    <option>Redirect URL</option>
                                </select>
                            </td></tr>
                        <tr><td>OutCome Description</td>
                            <td>

                                <textarea rows="10" cols="25" class="contact_input" name="description">
                                    <c:out value="${outCome.description}"/>
                                </textarea>
                            </td></tr>	

                        <tr><td colspan="2"><input type="submit" class="MyButton1" value="Save&Create OutCome "/></td></tr>
                    </table>
                </form>
            </div>
        </div>



    </div>
    <!--end of left content-->


    <div class="right_content">

    </div><!--end of right content-->


    <div id="footer">

    </div>


</div> <!--end of center box-->
</div> <!--end of main content-->
</div> <!--end of main container-->
</body></html>
