<%-- 
    Document   : play
    Created on : 1 Feb, 2016, 12:31:03 PM
    Author     : user
--%>

<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Play Music</title>
    </head>
    <body>
        <a href="home.jsp"><input type="button" value="home"></a>
        <%
            HttpSession s=request.getSession();
            String eid=(String)s.getAttribute("eid");
            if(eid!=null)
            out.print("welcome "+eid+"<br><br>");
        %>
        <h1>Play music</h1>
        <form method="post">
        <p>
        &nbsp;</p>
    <p>
        Song Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input name="fn" type="text" />&nbsp;&nbsp;<input type="Submit" value="Search"></p>
        
    
    </form>
<%
    String fn=request.getParameter("fn");
    //String mf=request.getParameter("mf");
    int i=0;
        try{
            i++;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            i++;
            String url="jdbc:oracle:thin:@localhost:1521:xe";
            String user="System";
            String pass="oracle";
            Connection c=DriverManager.getConnection(url, user, pass);
            i++;
            //String sql="insert into music values ('"+fn+"','"+mf+"')"; we dont have to use this
            String sql="select musicfile from music where filename=?";
            i++;
            PreparedStatement ps=c.prepareStatement(sql);
            i++;    
            ps.setString(1,fn);
            i++;
            ResultSet rs=ps.executeQuery();
            i++;
//ps.setString(1,fn);
	
            if(rs.next()){
                i++;
                //rs.getBLOB(1);
                //ps.setString(1,fn);
                Blob b1=rs.getBlob(1);
                i++;
                byte b2[]=b1.getBytes(1,(int)b1.length());
                i++;    
                FileOutputStream fos= new FileOutputStream("E:/Java/NetBeans/MusicJava/web/music/"+fn+".mp3");
                i++;
                fos.write(b2);
        
                    i++;
                    out.print("<audio controls><source src=music/"+fn+".mp3 type=audio/mpeg></audio>");
                    i++;
                    out.print("<center>Download from here<a href=music/"+fn+".mp3 download=music/"+fn+".mp3> "+fn+"</a></center>");
            }
            else
                out.print("please enter the correct name or the song you requested is not avaiable");
            i++;
            Thread.sleep(3000);
        }
        catch(Throwable t){
            out.print(t+" this error at <br> line number "+i);
        }
        /*
//out.print("<audio autoplay=autoplay controls><source src=music/"+fn+".mp3 type=audio/mpeg></audio><br><br>");
//out.print("<audio autoplay=autoplay controls><source src="+fn+".mp3 type=audio/mpeg></audio><br><br>");
//out.print("<audio autoplay=autoplay controls><source src=music/"+fn+".mp3></audio><br>");
    out.print("<audio controls><source src=music/"+fn+".mp3 type=audio/mpeg></audio>");
    out.print("<center>Download from here<a href=music/"+fn+".mp3 download=music/"+fn+".mp3> "+fn+"</a></center>");
*/
%>
<br><br><br><br>Check out all we have<a href="music.jsp"><input type="button" value="All Music"></a>
    </body>
</html>
