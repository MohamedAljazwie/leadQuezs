<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=windows-1256"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
            <title>Registration Form</title>
            <link rel="stylesheet" type="text/css" href="style.css"/>
            <script>
                var request;
                function sendUserName()
                {
                    var v = document.myform.userName.value;
                    var url = "findUserName?userName=" + v;
                    if (window.XMLHttpRequest) {
                        request = new XMLHttpRequest();
                    } else if (window.ActiveXObject) {
                        request = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    try
                    {
                        request.onreadystatechange = getInfo;
                        request.open("POST", url, true);
                        request.send();
                    } catch (e) {
                        alert("Unable to connect to server");
                    }
                }
                function sendEmail()
                {
                    var v = document.myform.email.value;
                    var url = "findEmail?email=" + v;
                    if (window.XMLHttpRequest) {
                        request = new XMLHttpRequest();
                    } else if (window.ActiveXObject) {
                        request = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    try
                    {
                        request.onreadystatechange = getInfo;
                        request.open("POST", url, true);
                        request.send();
                    } catch (e) {
                        alert("Unable to connect to server");
                    }
                }

                function getInfo() {
                    if (request.readyState == 4) {
                        var val = request.responseText;
                        document.getElementById('location').innerHTML = val;
                    }
                }
            </script>
    </head><body>
            <div id="main_container">
                <div class="main_content">
                    <div id="header">

                    </div>
                    <div class="top_center_box"></div>
                    <div class="center_box">


                        <div id="menu_tab">                                     
                            <ul class="menu">      
                                <li><a href="registerUser.jsp?action=register" class="nav">Register</a></li> 
                                <li class="divider"></li>
                                <li><a href="contact.html" class="nav">Contact Us</a></li>
                               <li class="divider"></li>
                               <li><a href="index.jsp" class="nav">Login</a></li>
                           </ul>
                        </div> 


                        <div class="middle_box">
                            <div class="middle_box_text_content">
                                <div class="middle_box_title"></div>
                                <p class="middle_text">
                                </p>
                            </div>


                        </div>


                        <div class="left_content">

                            <div class="calendar_box">

                                <div class="calendar_box_content4">

                                    <h1>Welcome to LeadQuiezs </h1>
                                    <p><div id="location"></div>
                                        <form method="post" action="registerprocess.jsp?action=registerUser" name="myform" >
                                            <table >

                                                <tr><td style="color:navy;"><B>Registration</B></td></tr>
                                                <tr><td>User Name:</td><td><input type="text" name="userName" /></td></tr>

                                                <tr><td>Password:</td><td><input type="password" name="password"/></td></tr>

                                                <tr><td>Email:</td><td><input type="text" name="email" /></td></tr>	

                                                <tr><td> </td>
                                                    <c:set var="action" value="registerUser" scope="request" />
                                                    <td><input type="submit" value="Register"/></td></tr>
                                            </table>

                                        </form>


                                    </p>
                                </div>
                            </div>



                        </div>
                        <!--end of left content-->



                        <div id="footer">

                        </div>


                    </div> <!--end of center box-->
                </div> <!--end of main content-->
            </div> <!--end of main container-->
    </body></html>