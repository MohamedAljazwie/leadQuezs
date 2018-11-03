<%@ page contentType="text/html;charset=windows-1256"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:choose>

    <c:when test="${param.action eq 'registerUser'}">
        <c:set var="action" value="addUser" scope="request"/>
        <jsp:useBean id="user"   class="org.com.leadquiezs.Model.User" scope="request">
            <jsp:setProperty   name="user"  property="*"/>
        </jsp:useBean>
        <jsp:forward page="/addUser"/>

    </c:when>
    <c:when test="${param.action eq 'registerQuiez'}">
        <c:set var="action" value="addQuiez" scope="request"/>
        <c:set property="name" target="${sessionScope.quiez}" value="${param.name}"/>
        <c:set property="image" target="${sessionScope.quiez}" value="${param.name}"/>
        <c:set property="title" target="${sessionScope.quiez}" value="${param.name}"/>
         <c:set property="descrpion" target="${sessionScope.quiez}" value="${param.name}"/>
          <c:set property="label" target="${sessionScope.quiez}" value="${param.name}"/>
        <jsp:forward page="/addQuiez"/>
    </c:when>
    <c:when test="${param.action eq 'removequiez'}">
        <c:set var="action" value="removeQuiez" scope="request"/>
        <c:set property="quiezID" target="${sessionScope.quiez}" value="${param.quiezid}"/>
        <jsp:forward page="/addQuiez"/>
    </c:when>
    <c:when test="${param.action eq 'registerQuestion'}">
        <c:set var="action" value="addQuestion" scope="request"/>
        <c:set target="${sessionScope.question}" property="name" value="${param.name}"/>
        <c:choose>
            <c:when test="${empty  sessionScope.quiez}">
                <c:set var="message" value="You do not Select Quiez PleaseSelect Quiez" scope="request"/>
                <jsp:forward page="questions.jsp"/>
            </c:when>
            <c:otherwise>
                <c:set var="val" value="2"/>
                <c:forEach var="paramName" items="${param}" >
                    <c:if test="${fn:startsWith(paramName.key, 'answer')}">
                        <c:set var="answerparam" value="answer${val}"/>
                       <c:if test="${! empty param[answerparam]}">
                        <jsp:useBean id="answer" class="org.com.leadquiezs.Model.TextAnswer" scope="page">
                            <jsp:setProperty name="answer" property="answer" value='${param[answerparam]}'/>
                            <jsp:setProperty name="answer" property="question" value="${sessionScope.question}"/>
                            <c:set var="outComeparam" value="${answerparam}_outComeTitle"/> 
                            <c:set var="outComeparam1" value="${param[outComeparam]}" scope="request"/>
                            <c:set var="outComeparam1" value="${answerparam}_outComeTitle" scope="request"/>
                            <jsp:setProperty name="answer" property="outCome" value="${sessionScope.outComes[param[outComeparam]]}"/>

                        </jsp:useBean>
                            
                        <c:set target="${sessionScope.question}"  property="answer" value="${pageScope.answer}"/>
                        <c:remove var="answer" scope="page"/>
                        <c:set var="val" value="${val+1}"/>
                        </c:if>
                    </c:if>
                </c:forEach>
                <jsp:forward page="/addQuestion"/>
            </c:otherwise>
        </c:choose>
    </c:when>
    <c:when test="${param.action eq 'removequestion'}">
          <c:choose>
            <c:when test="${empty  sessionScope.quiez}">
                <c:set var="message" value="You do not Select Quiez PleaseSelect Quiez" scope="request"/>
                <jsp:forward page="questions.jsp"/>
            </c:when>
              <c:otherwise>
                    <c:set var="action" value="removeQuestion" scope="request"/>
                    <c:set property="questionID" target="${sessionScope.question}" value="${param.questionid}"/>
                    <jsp:forward page="/addQuestion"/>
              </c:otherwise>
          </c:choose>
      
    </c:when>
    <c:when test="${param.action eq 'registerOutCome'}">
        <c:set var="action" value="addOutCome" scope="request"/>
          <c:choose>
        <c:when test="${empty  sessionScope.quiez}">
                <c:set var="message" value="You do not Select Quiez PleaseSelect Quiez" scope="request"/>
                <jsp:forward page="outcomes.jsp"/>
            </c:when>
              <c:otherwise>
                  
                  <c:set property="title"  target="${sessionScope.outCome}" value="${param.title}"/>
                  <c:set property="description"  target="${sessionScope.outCome}" value="${param.description}"/>
                  
              </c:otherwise>
          </c:choose>
        
        <jsp:forward page="/addOutCome"/>
    </c:when>
     <c:when test="${param.action eq 'removeoutCome'}">
          <c:choose>
            <c:when test="${empty  sessionScope.quiez}">
                <c:set var="message" value="You do not Select Quiez PleaseSelect Quiez" scope="request"/>
                <jsp:forward page="questions.jsp"/>
            </c:when>
              <c:otherwise>
                    <c:set var="action" value="removeOutCome" scope="request"/>
                    <c:set property="outComeID" target="${sessionScope.outCome}" value="${param.outcomeid}"/>
                    <jsp:forward page="/addOutCome"/>
              </c:otherwise>
          </c:choose>
      
    </c:when>
</c:choose>