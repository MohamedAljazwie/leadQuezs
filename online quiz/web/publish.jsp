<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=windows-1256"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib  prefix="leadQuiezs" uri="https://java.sun.com/jsp/LeadQuiezs" %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <jsp:include page="header.jsp"></jsp:include>
        <!--<meta name="viewport" content="width=device-width, initial-scale=1"/>-->
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
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

        <div class="container">

                <div class="w3-display-container w3-text-white ">
                <c:choose>
                    <c:when test="${! empty sessionScope.quiez.name}">
                        <div class="container">
                            <form method="post" action="publishquestions.jsp" >
                            <img src="images/${sessionScope.quiez.image}"  class="w3-image" alt="Snow" border="0" style="width:100%">
                                <button class="w3-display-middle" onclick="javascript: form.action='publishquestions.jsp'">Start Quiez</button>
                                 <c:set var="firstloadquestuins" value="first" scope="session"/>
                                <div class="w3-padding w3-display-middle w3-display-topmiddle w3-xxlarge">${sessionScope.quiez.title}</div>
                                <div class="w3-padding w3-display-middle w3-display-topmiddle">${sessionScope.quiez.descrpion}</div>
                            </form>
                                </div>


                    </c:when>
                    <c:otherwise>
                        <div class="container">
                            <img src="images/leadquizzes.jpg" alt="Snow" border="0" style="width:100%">
                                <button class="btn w3-display-middle" >${quiezs[param.quiezName].label}</button>
                                <div class="w3-padding w3-display-middle w3-display-topmiddle w3-xxlarge">${quiezs[param.quiezName].title}</div>
                                <div class="w3-padding w3-display-middle w3-display-topmiddle">${quiezs[param.quiezName].descrpion}</div>
                        </div>

                    </c:otherwise>
                </c:choose>


            </div>



        <div id="footer">

        </div>


    </div> <!--end of center box-->
</div> <!--end of main content-->
</div> <!--end of main container-->
</html>
