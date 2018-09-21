<%-- 
    Document   : addGroup
    Created on : 18.09.2018, 18:41:43
    Author     : gonch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AddressBook Application</title>
        <%@page import="javax.naming.*,com.addressbook.lab.*" %>
        <%request.setCharacterEncoding("UTF-8");%>
    </head>
    <body>
        <h1>Add new record to the groups table</h1>
        <form action="doaddGroup.jsp" method="POST">
            <p>Name: <input type="text" name="Name"  value="" /></p>
            <input type="submit" value="Submit" />
        </form>
    </body>
</html>
