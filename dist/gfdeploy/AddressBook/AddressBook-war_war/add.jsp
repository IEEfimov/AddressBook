<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AddressBook Application</title>
    </head>
    <%request.setCharacterEncoding("UTF-8");%>
    <%@page import="javax.naming.*,com.addressbook.lab.*" %>
    <%!GroupsSessionRemote ejbGroupsRef;%>
    <%!Groups[] groups;%>
    <%
        InitialContext ic = new InitialContext();
        ejbGroupsRef = (GroupsSessionRemote) ic.lookup("com.addressbook.lab.GroupsSessionRemote");
        groups = ejbGroupsRef.showAllGroups();
    %>
    <body>
        <h1>Add new record to the address book</h1>
        <form action="doadd.jsp" method="POST">
            <p>First Name: <input type="text" name="firstName"
                                  value="" /></p>
            <p>Last Name: <input type="text" name="lastName"
                                 value="" /></p>
            <p>E-Mail: <input type="text" name="email" value=""
                              />
            </p>

            <p>Phone: <input type="text" name="phone" value=""
                             />
            </p>

            <p>Group:
                <select name="group">
                    <c:forEach var="row" items="<%=groups%>">
                        <option value = "${row.getId()}"> ${row.getName()}  </option>
                    </c:forEach>
                </select>
            </p>
            <input type="submit" value="Submit" />
        </form>
    </body>
</html>