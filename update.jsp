<!Doctype html>
<%@ page import="javax.servlet.http.*" %>
<%@ page import=" javax.servlet.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>


	<body bgcolor="green" text="white">
	<%ServletContext context=getServletContext();
					String url=context.getInitParameter("url");
					String u_name=context.getInitParameter("u_name");
					String pwd=context.getInitParameter("pwd");
								String driver=context.getInitParameter("driver");
     Class.forName(driver);
        Connection  con=DriverManager.getConnection(url,u_name,pwd);
                         Statement st=con.createStatement();

						 String table=request.getParameter("table3");
						 String hno=request.getParameter("hno");

		
                                                        session=request.getSession(true);
                                                        session.setAttribute("HNO",hno);
		if(st.execute(   "select * from "+table+" where hno='"+hno+"'"  )  )
		{   
			 out.print("<form action=\"apply.jsp\">");
			ResultSet rs=st.getResultSet();
			ResultSetMetaData rsmd=rs.getMetaData();
			int nc=rsmd.getColumnCount();
			out.print("<table style=\"align:middle \"><tr ncol="+nc+"><th><input type=text value="+table+"           name=\"table4\"></th></tr><tr>");
			for(int i=2;i<=nc;i++)
			{
			out.print("<th>"+rsmd.getColumnName(i)+"</th>");
			}
			out.print("</tr>");
            while(rs.next())
			{  out.print("<tr>");
				for(int i=2;i<=nc;i++)
				{  if(rsmd.getColumnTypeName(i).toUpperCase().matches("VARCHAR2(.*)")||rsmd.getColumnTypeName(i).toUpperCase().matches("VARCHAR(.*)")||rsmd.getColumnTypeName(i).toUpperCase().matches("CHAR(.*)"))
                                    {	out.print("<td><input type=text name="+rsmd.getColumnName(i)+" value=  "+rs.getString(i)+"></td>"); }
                                   else if(rsmd.getColumnTypeName(i).toUpperCase().matches("TIME(.*)"))
                                      {	out.print("<td><input type=time name="+rsmd.getColumnName(i)+" value="+rs.getString(i)+"></td>"); }
                                   else if(rsmd.getColumnTypeName(i).toUpperCase().matches("DATE(.*)"))
                                       {	out.print("<td><input type=date name="+rsmd.getColumnName(i)+" value="+rs.getString(i)+"></td>"); }
                                  else
                                     {	out.print("<td><input type=text name="+rsmd.getColumnName(i)+" value="+rs.getString(i)+"></td>"); }
				}
				
				out.print("</tr>");
			}
			out.print("</table>");

						 out.print("<input type=submit value=apply></form>");
		}
		%>	
			

	<body>
	
