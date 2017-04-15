<%-- 
    Document   : logout
    Created on : 1 Feb, 2016, 12:07:13 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>log out Page</title>
    </head>
    <body>
        <%
        HttpSession s=request.getSession();
        if(s==null){
	response.sendRedirect("newjsp.jsp");}
        else if(s!=null){
	s.invalidate();
	response.sendRedirect("newjsp.jsp");
}
        %>
    </body>
</html>
