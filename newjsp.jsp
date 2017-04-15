<%-- 
    Document   : newjsp
    Created on : 31 Jan, 2016, 1:47:57 PM
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.Scanner"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LogIn Page</title>
    </head>
    <body>
        <h1>Log In </h1>
        
        <form>
            Email id &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="email" name ="EMid"><br><br>
            Password &nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name ="Pass"><br><br><br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="LogIn" >
            </form>
        <a href="ForgotPaasword.jsp">Forgot Password</a><br><br><br>
    <center>
        Wanna play direct music please click<a href="play.jsp"><input type="button" value="play"></a>
        <br><br>Check out all we have<a href="music.jsp"><input type="button" value="All Music"></a>
    </center><br><br>
        <%
                    try {
            // TODO code application logic here
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url="jdbc:oracle:thin:@localhost:1521:xe";
            String user="system";
            String pass="oracle";
            Connection c=DriverManager.getConnection(url, user, pass);
            Statement st=c.createStatement();
           // System.out.print("enter the user name whose data you want to retrive: ");
            String a=request.getParameter("EMid");
           // System.out.println("enter the password: ");
            String ps=request.getParameter("Pass");
            String sql="Select * from DBlogin where Email='"+a+"'";
            ResultSet rs=st.executeQuery(sql);
            String passdb;
            if(a!=null){
            if (rs.next()){
                //System.out.println("User name: "+rs.getString(1)+"; Password: "+rs.getString(2)+"; E-Mail id: "+rs.getString(3));
                passdb=rs.getString(1);
                if(passdb.equals(ps)){
                    out.println("welcome user \n your user name is: "+rs.getString(1));
                    Cookie c1=new Cookie("EMid",a);
                    Cookie c2=new Cookie("Pass",ps);
                    c1.setMaxAge(600);
                    c2.setMaxAge(600);
                    response.addCookie(c1);
                    response.addCookie(c2);
                    HttpSession s=request.getSession();
                    s.setAttribute("eid",a);
                    response.sendRedirect("home.jsp");
                }
                else 
                    out.println("password you entered is wrong.");
                
            }
            else
                out.println("user name you entered is wrong");
            }
            //st.executeQuery(sql);
        } 
        catch (Throwable ex) {
            out.println(ex);
        }
        %>
           <a href="newAccount.jsp">New User SignUp here</a>
           
    </body>
</html>
