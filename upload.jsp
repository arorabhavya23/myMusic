<%-- 
    Document   : upload
    Created on : 1 Feb, 2016, 12:15:27 PM
    Author     : user
--%>

<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>upload Page</title>
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
        <h1>Upload here!</h1>
        <form>
        <p>
        &nbsp;</p>
    <p>
        Song Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input name="fn" type="text" /></p>
    <p>
        upload file&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input name="mf" type="file" /></p>
    <input type="Submit" value="upload">
    </form>
        <%
            try{
            
                String fn=request.getParameter("fn");
                String mf=request.getParameter("mf");
                Class.forName("oracle.jdbc.driver.OracleDriver");
                String url="jdbc:oracle:thin:@localhost:1521:xe";
                String user="System";
                String pass="oracle";
                Connection c=DriverManager.getConnection(url, user, pass);
     /* String sql="insert into music values ('"+fn+"','"+mf+"')"; //we don't have to use this */
                String sql="insert into music values (?,?)";
                PreparedStatement ps=c.prepareStatement(sql);
                ps.setString(1,fn);
                FileInputStream fis=new FileInputStream(mf);
                ps.setBinaryStream(2,fis, fis.available());
                int i=ps.executeUpdate();
                if(i==1){
                   out.println("data inserted");
                }
                else
                    out.println("data failed to insert");
    }
            catch(Throwable t){
    out.println(t);
    }
%>
    <a href="home.jsp" >go to home page</a>
    </body>
</html>
