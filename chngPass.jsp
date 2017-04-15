<%-- 
    Document   : ChangePassword
    Created on : 6 Feb, 2016, 12:26:16 PM
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change password</title>
    </head>
    <body>
        <h1>Change password</h1>
        <%
            HttpSession s=request.getSession();
            String eid=(String)s.getAttribute("eid");
            if(eid==null)
                response.sendRedirect("Login.jsp");
            
            Cookie cookie = null;
            Cookie[] cookies = null;
   
            cookies = request.getCookies();
            cookie = cookies[2];
        %>
        <form method="post">
            Email id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="email" name ="EMid" value=""><br><br>
            Old Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name ="OPass" value=""><br><br>
            New Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name ="Pass" value=""><br><br>
            Confirm Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name ="CPass" value=""><br><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Change Password" >
        </form>
        <%
            try{
                String Email=request.getParameter("EMid");
                String Ops=request.getParameter("OPass");
                String ps=request.getParameter("Pass");
                String cps=request.getParameter("CPass");
                if(Ops.equals(cookie.getValue( ))){
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    String url="jdbc:oracle:thin:@localhost:1521:xe";
                    String user="system";
                    String pass="oracle";
                    Connection c=DriverManager.getConnection(url, user, pass);
                    Statement st=c.createStatement();
                    String sql="Select * from DBUSER where EMAIL='"+Email+"'";
                    ResultSet rs=st.executeQuery(sql);
                    if(rs.next()){
                        if(ps.equals(cps)){
                            String sqle="update DBLOGIN set PASS='"+ps+"' where EMAIL='"+Email+"'";
                            st.executeQuery(sqle);
                            out.print("password changed got to <a href=Login.jsp>log in</a> page");
                        }
                        else
                            out.print("NEW password and cnfrm password do not match");
                    }
                    else
                        out.print("Email id you given is wrong");
                }
                else
                    out.print("Old password is wrong");
            }
            
            catch(Throwable t){}
        %>
    </body>
</html>
