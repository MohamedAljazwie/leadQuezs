<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=windows-1256"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib  prefix="leadQuiezs" uri="https://java.sun.com/jsp/LeadQuiezs" %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <leadQuiezs:validate username="${param.username}" password="${param.userpass}">
        <c:choose>
            <c:when test="${empty user}">
                <jsp:forward page="index.jsp"></jsp:forward>
            </c:when>
            
       
        <c:otherwise>
        <jsp:forward page="home.jsp"></jsp:forward>
        </c:otherwise>
       </c:choose>  

    </leadQuiezs:validate>
</html>

