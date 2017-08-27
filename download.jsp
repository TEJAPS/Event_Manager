<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>


<%
		
					ServletContext context=getServletContext();
					String url=context.getInitParameter("url");
					String u_name=context.getInitParameter("u_name");
					String pwd=context.getInitParameter("pwd");
										String driver=context.getInitParameter("driver");

		String table=request.getParameter("tab6");
		 response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment; filename=users.xls");
		Class.forName(driver);
        Connection  con=DriverManager.getConnection(url,u_name,pwd);
         Statement st=con.createStatement();
    	
 
		ResultSet rs=st.executeQuery("select * FROM "+table);
		ResultSetMetaData rsmd=rs.getMetaData();
	    int nc=rsmd.getColumnCount();
		
		out.print("<table><tr>");
		for(int i=1;i<=nc;i++)
		{
		out.print("<th>"+rsmd.getColumnName(i)+"</th>");
		}
		out.print("</tr>");
		while(rs.next())
		{
			out.print("<tr>");
		   for(int i=1;i<=nc;i++)
			{		
					out.print("<td>"+rs.getString(i)+"</td>");
			}
			out.print("</tr>");
		}
  		out.print("</table>");
	 
		 
		 
		
%>