<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=windows-1256"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib  prefix="leadQuiezs" uri="https://java.sun.com/jsp/LeadQuiezs" %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <jsp:include page="header.jsp"></jsp:include>
        <!--<meta name="viewport" content="width=device-width, initial-scale=1"/>-->
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
        <link rel="stylesheet" href="style.css"/>
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

            previewFile(); //calls the function named previewFile()

            function  checkaction(check)
            {
            actioncheck = document.getElementById('leadcaptureCheck');
            if (check.checked = true)
            {
            check.checked = true
                    window.location.href = 'leads.jsp?checked=true'

            } else {

            window.location.href = 'leads.jsp?checked=false';
            }

            }
        </script>
        <div class="left_content">

            <div class="left_content">
            <c:choose>
                <c:when test="${checked eq false}">
                    <form id='addQuestion' class="tr" method="post" action="#">
                        <table>
                            <tr>
                                <span class="td">  <td> <h3> Lead Capture</h3> </span></td>
                                <td> <label class="switch" style="float:left;padding:10px;margin:10px;">
                                        <input  id="leadcaptureCheck"  type="checkbox"  onclick="checkaction(this"/>
                                        <span class="slider round"></span>
                                    </label></td>
                                <td><span class="td"> <h3>${checked}</h3></td></tr>
                            <tr><td colspan="2">
                                    <div style="width:310px;float:left;padding:10px;margin:10px;">
                                        <a href="#"><img src="images/leadquizzes.jpg"   border="0"/></a>
                                    </div></td></tr>

                        </table>>
                    </form>
                </c:when>
                <c:otherwise>
                    <form id='addQuestion' class="tr" method="post" action="#">
                        <table>
                            <tr>
                                <span class="td">  <td> <h3> Lead Capture</h3> </span></td>
                                <td> <label class="switch" style="float:left;padding:10px;margin:10px;">
                                        <input  id="leadcaptureCheck"  type="checkbox"  onclick="checkaction(this"/>
                                        <span class="slider round"></span>
                                    </label></td>
                                <td><span class="td"> <h3>${checked}</h3></td></tr>


                        </table>>
                    </form>
                    <br/>
                    <form action="#">
                        <label for="Lead Capture Type ">Country</label>
                        <select id="leadcapture" name="leadcapture">
                            <option value="FaceBook ptin">FaceBook ptin</option>
                            <option value="Google Optin">Google Optin</option>
                            <option value="Lead Capture Frame">Lead Capture Frame</option>
                        </select>
                        <label for="email"><b>HeadLine: *</b></label>
                        <input type="text" placeholder="HeadLine: " name="headline" required>

                            <label for="psw"><b>HeadLineDescription:</b></label>
                            <input type="text" placeholder="description" name="HeadLineDescription:"   >

                                <button type="submit" class="registerbtn">Register</button>


                                </form>

                            </c:otherwise>
                        </c:choose>

                        </div>

                        </div>


                        <div class="center_box" >
                            <div class="">
                                <form action="contact.html" style="padding-right: 200px;">
                                    <div class="row">
                                        <div class="vl">
                                            <span class="vl-innertext">or</span>
                                        </div>

                                        <div class="col">
                                            <a href="#" class="fb btn">
                                                <i class="fa fa-facebook fa-fw"></i> Login with Facebook
                                            </a>
                                            <a href="#" class="twitter btn">
                                                <i class="fa fa-twitter fa-fw"></i> Login with Twitter
                                            </a>
                                            <a href="#" class="google btn"><i class="fa fa-google fa-fw">
                                                </i> Login with Google+
                                            </a>
                                        </div>

                                        <div class="col">
                                            <div class="hide-md-lg">
                                                <p>Or sign in manually:</p>
                                            </div>
                                            <label for="email"><b>Name:*</b></label>
                                            <input type="text" name="firstName" placeholder="Enter Your First Name" required>
                                                <label for="email"><b>Email:*</b></label>
                                                <input type="text" name="email" placeholder="Enter Your Email" required>
                                                    <input type="submit" value="Get My Result ">
                                                        </div>

                                                        </div>
                                                        </form>


                                                        </div><!--end of right content-->
                                                        </div>

                                                        <div id="footer">

                                                            </body></html>
