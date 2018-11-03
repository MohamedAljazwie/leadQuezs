<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp"></jsp:include>

<div class="left_content">

    <div class="left_content">
    <div class="calendar_box">


                <form method="post" action="loginprocess.jsp" >
                    <table>
                        <tr><td>Quiz Name:</td><td><input type="text" class="contact_input" name="quizname" /></td></tr>
                        <tr><td> Quiz Image:</td><td>
                                <input type = "file" name = "file" size = "50" onchange="previewFile()
                                       "  height="200" alt="Image preview..."/>
                            </td></tr>
                        <tr><td>Quiz Titel</td><td><input type="text" class="contact_input"name="quiztitel"/></td></tr>	
                        <tr><td>Quiz Description</td>
                            <td>
                                <textarea rows="10" cols="25" class="contact_input" cname="description">
                                </textarea>
                            </td></tr>
                        
                        <tr><td>Get To Action Label</td><td><input type="text" class="contact_input"name="actionLable"/></td></tr>	
                        <tr><td></td><td><input type="submit" class="read_more" value="Save Quiz"/></td></tr>
                    </table>
                </form>
    </div>
    </div>
    <div class="calendar_box">

            <div class="calendar_box_content">

                <form method="post" action="loginprocess.jsp" >
                    <table>
                        <tr><td>Quiz Name:</td><td><input type="text" class="contact_input" name="quizname" /></td></tr>
                        <tr><td> Quiz Image:</td><td>
                                <input type = "file" name = "file" size = "50" onchange="previewFile()
                                       "  height="200" alt="Image preview..."/>
                            </td></tr>
                        <tr><td>Quiz Titel</td><td><input type="text" class="contact_input"name="quiztitel"/></td></tr>	
                        <tr><td>Quiz Description</td>
                            <td>
                                <textarea rows="10" cols="25" class="contact_input" cname="description">
                                </textarea>
                            </td></tr>
                        
                        <tr><td>Get To Action Label</td><td><input type="text" class="contact_input"name="actionLable"/></td></tr>	
                        <tr><td></td><td><input type="submit" class="read_more" value="Save Quiz"/></td></tr>
                    </table>
                </form>
        </div>
    </div>



</div>
<!--end of left content-->


<div class="right_content">

    <div class="project_box">
        <a href="#"><img src="images/leadquizzes.jpg" alt="" title="" class="left_img" border="0"></a>
    </div>

</div><!--end of right content-->


<div id="footer">

</div>


</div> <!--end of center box-->
</div> <!--end of main content-->
</div> <!--end of main container-->
</body></html>
