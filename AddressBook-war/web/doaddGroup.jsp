<%-- 
    Document   : doaddGroup
    Created on : 18.09.2018, 18:47:34
    Author     : gonch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;  charset=windows-1251">    
        <title>Well done!</title>
    </head>
    <body>
       <%request.setCharacterEncoding("UTF-8");%>
       <%@page import="javax.naming.*,com.addressbook.lab.*" %>
      
        <%!GroupsSessionRemote ejbRef;%>
        <%
            InitialContext ic = new InitialContext();
            ejbRef = (GroupsSessionRemote) ic.lookup("com.addressbook.lab.GroupsSessionRemote");
            ejbRef.addNewGroup(request.getParameter("Name"));
        %>
        <h1>Record successfully added!</h1>
        <p><a href="index.jsp">Return</a></p>
    </body>
</html>
