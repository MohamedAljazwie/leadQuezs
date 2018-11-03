<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=windows-1256"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml"><head>


<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Login Form</title>
<link rel="stylesheet" type="text/css" href="style.css">
    </head><body >

  
<div id="main_container">
	<div class="main_content">
    	<div id="header">
      
        </div>
        <div class="top_center_box"></div>
        <div class="center_box">

    
            <div id="menu_tab">                                     
                    <ul class="menu">      
                         <li><a href="registerUser.jsp" class="nav">Register</a></li> 
                        <li class="divider"></li>
                          <li><a href="contact.html" class="nav">Contact Us</a></li>
                         
                       
                        	
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
                		<form method="post" action="loginprocess.jsp" >
                                    <table width="100%">
					<tr><td style="color:navy;"><B>Login Form</B></td></tr>
					
                                        <tr><td>User Name:</td><td  size="50"><input type="text" name="username" /></td></tr>
								
					<tr><td>Password:</td><td size="50"><input type="password" name="userpass"/></td></tr>	
						
					<tr><td></td><td><input type="submit" value="Sign in"/> <a href="registerUser.jsp">Register</a></td></tr>
					</table>
                     </form>

                </div>
            
            
            </div>
            <!--end of left content-->


	<div id="footer">
    
    </div>


		</div> <!--end of center box-->
	</div> <!--end of main content-->
</div> <!--end of main container-->
</body></html>