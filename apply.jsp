<!Doctype html>
<%@ page import="javax.servlet.http.*" %>
<%@ page import=" javax.servlet.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>


	<body bgcolor="green" text="white">
	<%
try
{ServletContext context=getServletContext();
					String url=context.getInitParameter("url");
					String u_name=context.getInitParameter("u_name");
					String pwd=context.getInitParameter("pwd");
										String driver=context.getInitParameter("driver");
     Class.forName(driver);
        Connection  con=DriverManager.getConnection(url,u_name,pwd);
                         Statement st=con.createStatement();
                                                session=request.getSession(true);
						 String table=request.getParameter("table4");
						 String hno=(String)session.getAttribute("HNO");
						 //out.print("<h1>"+hno+"</h1>");
						 //out.print("<h1>"+table+"</h1>");
						ResultSet rs=null;  
						ResultSetMetaData rsmd=null;
			String wholeval=null;
		if(st.execute(   "select * from "+table+" where hno='"+hno+"'"  )  )
		{  
			
			 rs=st.getResultSet();
			 rsmd=rs.getMetaData();
			int nc=rsmd.getColumnCount();
			out.print("<table style=\"align:middle \"><tr ncol="+nc+"><th><input type=text value="+table+"  ></th></tr><tr>");
			for(int i=2;i<=nc;i++)
			{
			out.print("<th>"+rsmd.getColumnName(i)+"</th>");
			}
			out.print("</tr>");
            out.print("col names completed");
		
			while(rs.next())
			{out.print("<tr>");
			 
			for(int j=2;j<=nc;j++)
			{out.print("<td>");
			/*	out.print( request.getParameter(rsmd.getColumnName(j)) );
						out.print(rsmd.getColumnTypeName(j));
                            
				if(rsmd.getColumnTypeName(j).toUpperCase().matches("DATE(.*)"))
                                { out.print("date date"); 
                             st.executeUpdate("update "+ table + " set "+ rsmd.getColumnName(j) + " = TO_DATE('" + request.getParameter(rsmd.getColumnName(j)) + "','YYYY-MM-DD') where hno='"+hno+"'");
                                 }
			    else if(rsmd.getColumnTypeName(j).toUpperCase().matches("VARCHAR2(.*)")||rsmd.getColumnTypeName(j).toUpperCase().matches("VARCHAR(.*)")||rsmd.getColumnTypeName(j).toUpperCase().matches("CHAR(.*)"))
                                {  out.print("not date");
                             st.executeUpdate("update "+ table + " set "+ rsmd.getColumnName(j) + " = '" + request.getParameter(rsmd.getColumnName(j)) + "' where hno='"+hno+"'");
                                }
				else
				if(rsmd.getColumnTypeName(j).toUpperCase().matches("NUMBER(.*)"))
				{
				st.executeUpdate("update "+table+" set "+rsmd.getColumnName(j)+ "="+ request.getParameter(rsmd.getColumnName(j)) + "      where hno='"+hno+"'");
				}
			*/

if(rsmd.getColumnTypeName(j).toUpperCase().matches("DATE(.*)"))
	{if(j==2 && j==nc)
		{wholeval="set " + rsmd.getColumnName(j) + " = TO_DATE('" + request.getParameter(rsmd.getColumnName(j)) + "','YYYY-MM-DD')";}
      else if(j==2)
		{ wholeval="set " + rsmd.getColumnName(j) + " = TO_DATE('" + request.getParameter(rsmd.getColumnName(j)) + "','YYYY-MM-DD'),"; }
	 else if(j==nc)
		{wholeval=wholeval+ rsmd.getColumnName(j) + " = TO_DATE('" + request.getParameter(rsmd.getColumnName(j)) + "','YYYY-MM-DD')"; }
	 else
	  wholeval=wholeval+ rsmd.getColumnName(j) + " = TO_DATE('" + request.getParameter(rsmd.getColumnName(j)) + "','YYYY-MM-DD'),"; 
	}
else
if(rsmd.getColumnTypeName(j).toUpperCase().matches("VARCHAR2(.*)")||rsmd.getColumnTypeName(j).toUpperCase().matches("VARCHAR(.*)")||rsmd.getColumnTypeName(j).toUpperCase().matches("CHAR(.*)"))
	{if(j==2 && j==nc)
		{wholeval="set " +rsmd.getColumnName(j) + " = '" + request.getParameter(rsmd.getColumnName(j)) + "'";}
      else if(j==2)
		{wholeval="set " +rsmd.getColumnName(j) + " = '" + request.getParameter(rsmd.getColumnName(j)) + "',"; }
	 else if(j==nc)
		{wholeval=wholeval+rsmd.getColumnName(j) + " = '" + request.getParameter(rsmd.getColumnName(j)) + "'"; }
	 else
	wholeval=wholeval+rsmd.getColumnName(j) + " = '" + request.getParameter(rsmd.getColumnName(j)) + "',"; 
	}
else
  if(rsmd.getColumnTypeName(j).toUpperCase().matches("NUMBER(.*)"))
				{   if(j==2 && j==nc)
						{wholeval="set "+rsmd.getColumnName(j)+ "="+ request.getParameter(rsmd.getColumnName(j));}
					  else
						if(j==2)
						{wholeval="set "+rsmd.getColumnName(j)+ "="+ request.getParameter(rsmd.getColumnName(j))+",";}
					 else if(j==nc)
						{wholeval=wholeval+rsmd.getColumnName(j)+ "="+ request.getParameter(rsmd.getColumnName(j));}
					 else
				wholeval=wholeval+rsmd.getColumnName(j)+ "="+ request.getParameter(rsmd.getColumnName(j))+",";
				}









		//out.print("<h1>"+wholeval+"</h1>");
			out.print("</td>");				
			}
			out.print("</tr>");
			}
		  out.print("</table>");
		  st.executeUpdate("update "+table+" "+wholeval+" where hno='"+hno+"'");
		  %><script> alert("updated successfully");</script>
		  <%
		  }
}
			catch(SQLException e)
			{e.getMessage();
				e.printStackTrace();
				out.print(e);
				e.getSQLState();
				e.getErrorCode();
				e.getNextException();
			}
			catch(Exception e)
			{e.getMessage();
				e.printStackTrace();
				out.print(e);
				
			}
			session=request.getSession(true);
				/*String coming=(String)session.getAttribute("coming");
					if(coming.equals("admin.jsp"))
					response.sendRedirect("admin.jsp");
				else
					response.sendRedirect("allinone.jsp");
					*/
				

		%>	
			

	<body>
	
