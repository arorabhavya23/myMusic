<%-- 
    Document   : ForgotPaasword
    Created on : 3 Feb, 2016, 12:42:16 PM
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot password</title>
    </head>
    <body>
        <h1>change password</h1>
        <%
            HttpSession s=request.getSession();
            String eid=(String)s.getAttribute("eid");
            if(eid!=null)
                response.sendRedirect("newjsp.jsp");
        %>
        <form method="post">
            Email id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="email" name ="EMid" value=""><br><br>
            User Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name ="UsrName" value=""><br><br>
            Mobile Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="tel" name ="mob" value=""><br><br>
            New Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name ="Pass" value=""><br><br>
            Confirm Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name ="CPass" value=""><br><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Change Password" >
        </form>
        <%
            try{
                String Email=request.getParameter("EMid");
                String un=request.getParameter("UsrName");
                String mob=request.getParameter("mob");
                String ps=request.getParameter("Pass");
                String cps=request.getParameter("CPass");
                if(cps.equals(ps)){
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    String url="jdbc:oracle:thin:@localhost:1521:xe";
                    String user="system";
                    String pass="oracle";
                    Connection c=DriverManager.getConnection(url, user, pass);
                    Statement st=c.createStatement();
                    String sql="Select * from DBUSER where EMAIL='"+Email+"'";
                    ResultSet rs=st.executeQuery(sql);
                    if(rs.next()){
                        if(un.equals(rs.getString(1))  &&  mob.equals(rs.getString(3))){
                        /*String sqle="update DBLogIn set pass="+ps+"where email="+Email;
                        ResultSet rse= st.executeQuery(sqle);
                        out.print("password changed got to<a><href=newjsp.jsp> login</a> page");*/
                            String sqle="update DBLOGIN set PASS='"+ps+"' where EMAIL='"+Email+"'";
                            st.executeQuery(sqle);
                            out.print("password changed got to <a href=newjsp.jsp>log in</a> page");
                    }
                        else
                            out.print("user Name or mobile number incorrect <br> please re do");
                       // out.print(rs.getString(1)+" and "+rs.getString(3));
                    }
                    else
                        out.print("wrong email  "+Email);
                }
                else
                    out.print("password mismatch re do");
            
            }
            catch(Throwable t){
            out.print("Error occured "+t);
            }
        %>
    </body>
</html>
