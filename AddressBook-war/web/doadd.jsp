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
        <%@page import="javax.naming.*,com.addressbook.lab.*"%>
      
        <%!AddressBookSessionRemote ejbRef;%>
        <%
            InitialContext ic = new InitialContext();
            ejbRef = (AddressBookSessionRemote) ic.lookup("com.addressbook.lab.AddressBookSessionRemote");
            System.out.println(request.getParameterNames());
            ejbRef.addEmailAddress(request.getParameter("firstName"),
                    request.getParameter("lastName"),
                    request.getParameter("email"),
                    request.getParameter("phone"),
                    request.getParameter("group")
            );
        %>
        <h1>Record successfully added!</h1>
        <p><a href="index.jsp">Return</a></p>
    </body>
</html>