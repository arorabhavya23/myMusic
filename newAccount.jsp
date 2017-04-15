<%@page import="java.sql.*"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8" />
    <title>New user</title>
    <style type="text/css">
        .auto-style1 {
            width: 129px;
        }
         #Text1 {
            width: 221px;
            height: 72px;
        }
        
    </style>
</head>
<body>
    <form>
    <table style="width:33%; height: 251px;">
       
        <tr>
            <td class="auto-style1">E mail</td>
            <td><input type="email" name="eId"/>&nbsp;</td>
            
        </tr>
        <tr>
           
            <td class="auto-style1">Password</td>
            <td><input type="password" name="pass"/></td>
        </tr>
        <tr>
            <td class="auto-style1">confirm password</td>
            <td><input type="password" name="Cpass"/></td>
            
        </tr>
        <tr>
           
            <td class="auto-style1">User Name</td>
            <td><input type="text" name="UsrName"/></td>
        </tr>
    </table>
        <input type="submit" value="Regester">
</form>
    <%
        try {
            HttpSession s=request.getSession();
            String eid=(String)s.getAttribute("eid");
            if(eid!=null)
            response.sendRedirect("newjsp.jsp");
           
            String p=request.getParameter("pass");
            String cp=request.getParameter("Cpass");
            String usr=request.getParameter("UsrName");
            String em=request.getParameter("eId");
            if(p.equals(cp)){
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url="jdbc:oracle:thin:@localhost:1521:xe";
            String user="System";
            String pass="oracle";
            Connection c=DriverManager.getConnection(url, user, pass);
            Statement st=c.createStatement();
            String sql="insert into Dblogin values ('"+usr+"','"+p+"','"+em+"')";
            String sql1="insert into DbUser(user1, email) values ('"+usr+"','"+em+"')";
            st.executeQuery(sql);
            st.executeQuery(sql1);
            out.println("Data inserted in table");
            //HttpSession s=request.getSession();
            s.setAttribute("eid",em);
            response.sendRedirect("home.jsp");
        } 
            else{
            out.println("Passwords do not match");
            }
        }catch (Throwable ex) {
            System.out.println("the error is "+ex);
        }
    %>
</body>
</html>