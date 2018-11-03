<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=windows-1256"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib  prefix="leadQuiezs" uri="https://java.sun.com/jsp/LeadQuiezs" %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <jsp:include page="header.jsp"></jsp:include>
        <!--<meta name="viewport" content="width=device-width, initial-scale=1"/>-->
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
            <div class="calendar_box">
            <c:if test="${! empty message}">
                <center><h3><c:out value="${messsage}"/></h3></center>
                    </c:if>
        </div>

        <div class="left_content">
            <div class="left_content">
                <div class="calendar_box">
                    <leadQuiezs:listAll listBy="quiez">
                        <c:choose>
                            <c:when test="${empty quiezs}">
                                <div style="width:310px;float:left;padding:10px;margin:10px;">
                                    <a href="#"><img src="images/leadquizzes.jpg"   border="0"/></a>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <table style="width:350px;">
                                    <c:forEach var="quiez" items="${quiezs}" >
                                        <tr>
                                            <td style="width: 300px;">
                                                <form class="tr" method="post" action="home.jsp">
                                                    <span class="td">
                                                        <input class="w3-button w3-block w3-light-grey"
                                                               type="submit" class="read_more" value="${quiez.value.name}"  name="quiezName"/>

                                                    </span>
                                                    <br/>
                                            </td>
                                            <td style="width:50px;">

                                                <button class="btn" onclick="javascript: form.action = 'registerprocess.jsp?action=removequiez&quiezid=${quiez.value.quiezID}'"><i class="fa fa-trash"></i></button>
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
                    <form class="tr" method="post" action="home.jsp">
                        <span class="td"><input  class="MyButton"
                                                 type="submit" class="read_more" value="Create New Quiez"/></span>
                    </form>
                    <div class="tr">
                        <span class="td"></span>
                        <span class="td"></span>
                    </div>

                </div>
            </div>
            <div class="calendar_box">
                <div class="calendar_box_content">
                    <c:choose>
                        <c:when test="${empty param.quiezName}">
                            <jsp:useBean id="quiez" class="org.com.leadquiezs.Model.Quiez" scope="session">
                            </jsp:useBean>

                        </c:when>
                        <c:otherwise>
                            <h2>Quiez :- ${param.quiezName}</h2>   
                            <c:set var="quiez" value="${quiezs[param.quiezName]}" scope="session"/>

                        </c:otherwise>
                    </c:choose>

                    <form method="post" action="registerprocess.jsp?action=registerQuiez" >
                        <table>
                            <tr><td>Quiz Name:</td><td><input type="text" class="contact_input" name="name" value="${quiez.name}"/></td></tr>
                            <tr><td> Quiz Image:</td><td>
                                    <input type = "file" value="${quiez.image}"  src="images/${quiez.image}"  name = "image" size = "50" onchange="previewFile()"  height="200" alt="Image preview..."/>
                                </td></tr>
                            <tr><td>Quiz Titel</td><td><input type="text" class="contact_input"name="title" value="${quiez.title}"/></td></tr>	
                            <tr><td>Quiz Description</td>
                                <td>
                                    <textarea rows="10" cols="25" class="contact_input" name="descrpion">
                                        <c:out value="${quiez.descrpion}"/>
                                    </textarea>
                                </td></tr>

                            <tr><td>Get To Action Label</td><td><input type="text" class="contact_input"name="label" value="${quiez.label}"/></td></tr>	
                            <tr><td></td><td><input  type="submit" class="MyButton1" value="Save&Create Quiz"/></td></tr>
                        </table>
                    </form>
                </div>
            </div>


        </div>
        <!--end of left content-->


        <div class="right_content w3-container">

            <div class="w3-display-container w3-text-white project_box">
                <c:choose>
                    <c:when test="${! empty param.quiezName}">
                        <div class="container">
                            <img src="images/${quiezs[param.quiezName].image}" alt="Snow" border="0" style="width:100%">
                                <button class="btn w3-display-middle">${quiezs[param.quiezName].label}</button>
                                <div class="w3-padding w3-display-middle w3-display-topmiddle w3-xxlarge">${quiezs[param.quiezName].title}</div>
                                <div class="w3-padding w3-display-middle w3-display-topmiddle">${quiezs[param.quiezName].descrpion}</div>
                        </div>


                    </c:when>
                    <c:otherwise>

                        <a href="#"><img src="images/leadquizzes.jpg" alt="" title=""  border="0"/></a>


                    </c:otherwise>
                </c:choose>


            </div>

        </div><!--end of right content-->


        <div id="footer">

        </div>


        </div> <!--end of center box-->
        </div> <!--end of main content-->
        </div> <!--end of main container-->
</html>
