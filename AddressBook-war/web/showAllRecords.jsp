<%-- 
    Document   : showAllRecords
    Created on : 19.09.2018, 15:12:25
    Author     : gonch
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AddressBook Aplication</title>
    </head>
    <body>
        <%@page import="javax.naming.*, com.addressbook.lab.*" %>
        <%!AddressBookSessionRemote ejbRef;%>
        <%!GroupsSessionRemote ejbGroupsRef;%>
        <%!Address[] addresses;%>
        <%!int iteration;%>
        <%!String[] deletedRecords;%>
        <%
            
            InitialContext ic = new InitialContext();
            ejbGroupsRef = (GroupsSessionRemote) ic.lookup("com.addressbook.lab.GroupsSessionRemote");
            ejbRef = (AddressBookSessionRemote) ic.lookup("com.addressbook.lab.AddressBookSessionRemote");
            try {
            deletedRecords =  request.getParameterValues("deletedRecords");
            if (deletedRecords.length>0)
                    ejbRef.deleteEmailAddress(deletedRecords);
            }
            catch (Exception e)
                    {
                    
                    }
            
            addresses = ejbRef.showAllRecords();
            iteration = 0;
        %>

        <h1>All records</h1>
        <form action="showAllRecords.jsp" method="POST">
        <table border = "1" width = "100%">
            <tr>
                <th>Имя</th> 
                <th>Фамилия</th>
                <th>E-mail</th>
                <th>Телофон</th>
                <th>Группа</th>
                <th>Удалить запись</th>
            </tr>
            <c:forEach var="add" items = "<%=addresses%>">
                <tr>
                 <td>${add.firstname} </td> 
                 <td>${add.lastname}</td>
                 <td>${add.email}</td>
                 <td>${add.phone}</td>
                 <td><%=ejbGroupsRef.findGroupName(addresses[iteration++].getGroupid())%></td>
                 <td ><input type="checkbox" value = "${add.id}" name = "deletedRecords"></td>
                </tr>
            </c:forEach>
        </table>
            <p><input type="submit" value="Удалить записи"></p>
        </form>
        
        <p><a href="index.jsp">Return</a></p>
    </body>
</html>
