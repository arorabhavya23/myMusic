




<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>music</title>
    </head>
    <body>
        <a href="home.jsp"><input type="button" value="home"></a>
    <center>
        <%
            HttpSession s=request.getSession();
            String eid=(String)s.getAttribute("eid");
            if(eid!=null)
            out.print("welcome "+eid+"<br><br>");
        %>
        <h1>all the music is on your tips</h1>
        <%
            int i=0;
        try{
            
	Class.forName("oracle.jdbc.driver.OracleDriver");
            String url="jdbc:oracle:thin:@localhost:1521:xe";
            String user="System";
            String pass="oracle";
            Connection c=DriverManager.getConnection(url, user, pass);
            //String sql="insert into music values ('"+fn+"','"+mf+"')"; we dont have to use this
        String sql="select * from music";
        PreparedStatement ps=c.prepareStatement(sql);
	//ps.setString(1);
	ResultSet rs=ps.executeQuery();
	
    while(rs.next()){
//rs.getBLOB(1);
        
        out.println("song name: "+rs.getString(1)+"<br>");
        
	Blob b1=rs.getBlob(2);
	
        byte b2[]=b1.getBytes(1,(int)b1.length());
       
        FileOutputStream fos= new FileOutputStream("E:/Java/NetBeans/MusicJava/web/music/"+rs.getString(1)+".mp3");
        
        fos.write(b2);
        
        out.print("<audio controls><source src=music/"+rs.getString(1)+".mp3 type=audio/mpeg></audio><br>");
        
        out.print("Download from here<a href=music/"+rs.getString(1)+".mp3 download=music/"+rs.getString(1)+".mp3> "+rs.getString(1)+"</a><br><br><br>");
        
           
    }

Thread.sleep(3000);
}
catch(Throwable t){
    out.print("error occured: "+t);
}
%>
</center>
    </body>
</html>
