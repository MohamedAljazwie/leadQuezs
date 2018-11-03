<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=windows-1256"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib  prefix="leadQuiezs" uri="https://java.sun.com/jsp/LeadQuiezs" %>
<script type="text/javascript" src="questionsjs.js"></script>
<link rel="stylesheet" href="questioncss.css"/>
<html xmlns="http://www.w3.org/1999/xhtml">
    <jsp:include page="header.jsp"></jsp:include>
        <!--<meta name="viewport" content="width=device-width, initial-scale=1"/>-->
        <link rel="stylesheet" type="text/css" href="style.css"/>
        <script type="text/javascript" href="scripts.js"></script>
        <link rel="stylesheet" href="w3.css"/>
        <script type="text/javascript" src="scripts.js"></script>
        <body>
        <c:if test="${sessionScope.firstloadquestuins eq 'first'}">
            <leadQuiezs:listAll listBy="question">
            </leadQuiezs:listAll>
            <c:set var="firstloadquestuins" value="notfirst" scope="session"/>
            <c:set var="iterate" value="0" scope="session"/>
        </c:if>
        <div class="container">

            <div class="wrapper">
                <c:choose>
                    <c:when test="${sessionScope.iterate eq sessionScope.List}">
                        <form class="form" method="post" action="#">
                            <p><button class="w3-button w3-block w3-teal submit" onclick="javascript: form.action = 'home.jsp'">
                                    Go Home 
                                </button></p>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <center><h3>${questionList[iterate].name}</h3></center>
                        <form class="form" method="post" action="#">
                            <c:forEach var="answer" items="${questionList[iterate].answers}">

                                <p><button class="w3-button w3-block w3-teal submit" onclick="javascript: form.action = 'publishquestions.jsp'">
                                        ${answer.answer}
                                    </button></p>
                                <br/>
                            </c:forEach>
                        </form>
                    </div>

                </c:otherwise>
            </c:choose>


            <c:set var="iterate" value="${sessionScope.iterate +1}" scope="session"/>
        </div>

        <div id="footer">

        </div>


        </div> <!--end of center box-->
        </div> <!--end of main content-->
        </div> <!--end of main container-->
</html>