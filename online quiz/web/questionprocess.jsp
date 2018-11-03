<%@ page contentType="text/html;charset=windows-1256"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
 <c:choose>
          <c:when test="${empty  sessionScope.quiez}">
          <c:set var="message" value="You do not Select Quiez PleaseSelect Quiez" scope="request"/>
          <jsp:forward page="questions.jsp"/>
          </c:when>
          <c:otherwise>
              <c:set target="${sessionScope.question}" property="name" value="${param.name}"/>
            <jsp:useBean id="answer" class="org.com.leadquiezs.Model.TextAnswer" scope="page">
            <jsp:setProperty name="answer" property="answer" value='${param.answer}'/>
            <jsp:setProperty name="answer" property="question" value="${sessionScope.question}"/>
            <jsp:setProperty name="answer" property="outCome" value="${sessionScope.outComes[param.answer_outComeTitle]}"/>
            </jsp:useBean>
        <c:set target="${sessionScope.question}"  property="answer" value="${pageScope.answer}"/>
        <c:set var="answer" value="${param.answer}" scope="request"/>
        <c:set var="questionName" value="${param.questionName}" scope="request"/>
        <jsp:forward page="questions.jsp"/>
          </c:otherwise>
 </c:choose>
