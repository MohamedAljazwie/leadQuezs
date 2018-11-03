<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=windows-1256"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib  prefix="leadQuiezs" uri="https://java.sun.com/jsp/LeadQuiezs" %>
<!DOCTYPE html>
<div id="myDropdown2" class="dropdown-content">
    <leadQuiezs:listAll listBy="outCome">
        <c:set var="answerIndex" value="2"/>
        <c:set var="indexOutCome" value="1"/>
        <c:forEach var="outCome" items="${outComes}" >
            <input  class="w3-button w3-block w3-light-grey"
                    type="button" class="read_more" value="${outCome.value.title}"
                    name="answer${answerIndex}_outComeTitle" />



            <c:set var="indexOutCome" value="${indexOutCome+1}"/>

        </c:forEach>

    </leadQuiezs:listAll>
</div>

<div id="myDropdown3" class="dropdown-content">
    <leadQuiezs:listAll listBy="outCome">
        <c:set var="answerIndex" value="3"/>
        <c:set var="indexOutCome" value="1"/>
        <c:forEach var="outCome" items="${outComes}" >
            <input  class="w3-button w3-block w3-light-grey"
                    type="button" class="read_more" value="${outCome.value.title}"
                    name="answer${answerIndex}_outComeTitle" />



            <c:set var="indexOutCome" value="${indexOutCome+1}"/>

        </c:forEach>

    </leadQuiezs:listAll>
</div>

<div id="myDropdown4" class="dropdown-content">
    <leadQuiezs:listAll listBy="outCome">
        <c:set var="answerIndex" value="4"/>
        <c:set var="indexOutCome" value="1"/>
        <c:forEach var="outCome" items="${outComes}" >
            <input  class="w3-button w3-block w3-light-grey"
                    type="button" class="read_more" value="${outCome.value.title}"
                    name="answer${answerIndex}_outComeTitle" />



            <c:set var="indexOutCome" value="${indexOutCome+1}"/>

        </c:forEach>

    </leadQuiezs:listAll>
</div>
