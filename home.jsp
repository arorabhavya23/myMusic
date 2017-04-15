<%-- 
    Document   : home
    Created on : 1 Feb, 2016, 11:02:08 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>home Page</title>
    </head>
    <body>
        <%
            HttpSession s=request.getSession();
            String eid=(String)s.getAttribute("eid");
            if(eid==null)
            response.sendRedirect("newjsp.jsp");
            else
            out.print("welcome "+eid+"<br><br>");
        %>
        <h1>Hello World! this is the home page</h1><br>
        <a href="UpdateProfile.jsp">Update profile</a>
        <a href="upload.jsp"><input type="button" value="upload"></a>
	<a href="play.jsp"><input type="button" value="play"></a>
	<a href="logout.jsp"><input type="button" value="logout"></a>
        <a href="chngPass.jsp">Change Password</a>
        <br><br>Check out all we have<a href="music.jsp"><input type="button" value="All Music"></a><br><br>
        
    </body>
</html>
