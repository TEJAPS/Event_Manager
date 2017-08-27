<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
 <%@ page import="java.sql.*" %>
 <%
			    session=request.getSession(true);
				session.invalidate();
				
					RequestDispatcher rd=request.getRequestDispatcher("homepage.html");
					rd.forward(request,response);



 %>