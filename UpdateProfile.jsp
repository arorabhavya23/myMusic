<%@page import="java.sql.*"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8" />
    <title>New user</title>
    <style type="text/css">
        .auto-style1 {
            width: 129px;
        }
    </style>
</head>
<body>
    <%
        try {
            HttpSession s=request.getSession();
            String eid=(String)s.getAttribute("eid");
            if(eid==null)
            response.sendRedirect("newjsp.jsp");
            out.print("welcome "+eid+"<br><br>");
            Cookie cookie = null;
            Cookie[] cookies = null;
   // Get an array of Cookies associated with this domain
            cookies = request.getCookies();
            cookie = cookies[2];
            //out.print("Value: " + cookie.getValue( )+" <br/>");
    %>
    <form>
    <table style="width:33%; height: 251px;">
       <tr>
            <td class="auto-style1">User Name</td>
            <td><input type="text" name="UsrNm" />&nbsp;</td>
            
        </tr>
        <tr>
            <td class="auto-style1">E mail</td>
            <td><input type="email" name="eId" value=""/>&nbsp;</td>
            
        </tr>
        
        <tr>
           
            <td class="auto-style1">mobile</td>
            <td><input type="tel" name="mob"/></td>
        </tr>
        <tr>
            <td class="auto-style1">city</td>
                <td><select name ="Cityname" requried="">
                        <option>Muzaffarnagar</option>
                        <option>Delhi</option>
                        <option>merut</option>
                        <option>goa</option>
                        <option>Shimla</option>
                
                </select></td>
            
        </tr>
        <tr>
           
            <td class="auto-style1">gender</td>
            <td>
                <input type="radio" name="RB" value="M" />Male<input type="radio" name="RB" value="F" />Female</td>
        </tr>
        <tr>
            <td class="auto-style1">intrest</td>
            <td>C<input name="CB1" type="checkbox" value="c"/>&nbsp; C++<input name="CB2" type="checkbox" value="c++" />&nbsp; java
                <input name="CB3" type="checkbox" value="java" /></td>
            
        </tr>
        <tr>
           
            <td class="auto-style1">Describe</td>
            <td><input name="desc" type="text" /></td>
        </tr>
        <tr>
            <td class="auto-style1">confirm password</td>
            <td><input type="password" name="Cpass"/></td>
            
        </tr>
    </table>
        <input type="submit" value="Update Profile">
</form>
    
            
    <%      String Un=request.getParameter("UsrNm");
            
            String em=eid;
            String m=request.getParameter("mob");
            String ct=request.getParameter("Cityname");
            String g=request.getParameter("RB");
            String i1=request.getParameter("CB1");
            String i2=request.getParameter("CB2");
            String i3=request.getParameter("CB3");
            String i=i1+i2+i3;
            String d=request.getParameter("desc");
            String cp=request.getParameter("Cpass");
            
            //cookie = cookies[2];
            //out.print(cookie.getValue( ));
            if(cp.equals(cookie.getValue( ))){
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url="jdbc:oracle:thin:@localhost:1521:xe";
            String user="system";
            String pass="oracle";
            Connection c=DriverManager.getConnection(url, user, pass);
            Statement st=c.createStatement();
            String sql="update DBUser set user1='"+Un+"', MOBILE='"+m+"',city='"+ct+"',gender='"+g+"',intrest='"+i+"',describe='"+d+"' where Email='"+em+"'";
            st.executeQuery(sql);
            if(em.equals(null))
                    out.println("enter Data to be updated");
            else
            response.sendRedirect("home.jsp");
            }
            else
               out.println("wrong password plaese re do");
            //out.println("user name is:"+Un+"  Email id is:"+em+"  mobile num: "+m+"  city: "+ct+"  gender: "+g+"  intrset: "+i+"  decription: "+d);
        
        } 
        catch (Throwable ex) {
            out.println(ex);
        }
    %>
</body>
</html>