<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AddressBook Application</title>
    </head>
    <body>
        <%request.setCharacterEncoding("UTF-8");%>
        <%@page import="javax.naming.*,com.addressbook.lab.*" %>
        <%!AddressBookSessionRemote ejbRef;%>
        <%!GroupsSessionRemote ejbGroupsRef;%>
        <%!Address result;%>
        <%
            InitialContext ic = new InitialContext();
            
            ejbRef = (AddressBookSessionRemote) ic.lookup("com.addressbook.lab.AddressBookSessionRemote");
            ejbGroupsRef = (GroupsSessionRemote) ic.lookup("com.addressbook.lab.GroupsSessionRemote");
            result = (Address) ejbRef.findEmailAddress(request.getParameter("firstName"), request.getParameter("lastName")); 
        %>
        <h1>Search Results:</h1>
        <p>First Name: <%=result.getFirstname()%></p>
        <p>Last Name: <%=result.getLastname()%></p>
        <p>E-Mail: <%=  result.getEmail()%></p>
         <p>Phone: <%=  result.getPhone()%></p>
         <p>group: <%= ejbGroupsRef.findGroupName(""+result.getGroupid())%></p>
        <p><a href="index.jsp">Return</a></p>
    </body>
</html>