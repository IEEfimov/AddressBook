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
        <h1>Find email address</h1>
        <form action="findResult.jsp" method="POST"><p>First Name: <input type="text" name="firstName"
                                                                          value="" /></p>
            <p>Last Name: <input type="text" name="lastName"
                                 value="" /></p>
            <input type="submit" value="Search" />
        </form>
    </body>
</html>