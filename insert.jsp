<!Doctype html>
<%@ page import="javax.servlet.http.*" %>
<%@ page import=" javax.servlet.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>


	<body bgcolor="green" text="white">
	<%
	try
	{   
					ServletContext context=getServletContext();
					String url=context.getInitParameter("url");
					String u_name=context.getInitParameter("u_name");
					String pwd=context.getInitParameter("pwd");
										String driver=context.getInitParameter("driver");

     Class.forName(driver);
        Connection  con=DriverManager.getConnection(url,u_name,pwd);
                         Statement st=con.createStatement();

					//	 String table=request.getParameter("table2");
					//	 String value=request.getParameter("vinsert");
						 session=request.getSession(true);
				         String coming=(String)session.getAttribute("coming");
						session.setAttribute("coming","insert.jsp");
						 String table=(String)session.getAttribute("tablename");
					 int size=(int)session.getAttribute("size");
					 String value=null;
		if(st.execute("select * from " +table))
		{       ResultSet rs=st.getResultSet();
				ResultSetMetaData rsmd=rs.getMetaData();
				for(int i=1;i<=size;i++)
					{String y="tb"+i;
							if(i==1)
								{ if(rsmd.getColumnTypeName(i).toUpperCase().matches("DATE(.*)"))
									{ value= " TO_DATE('"+request.getParameter(y)+"', 'YYYY-MM-DD')" ; }
								else if(rsmd.getColumnTypeName(i).toUpperCase().matches("VARCHAR2(.*)")||rsmd.getColumnTypeName(i).toUpperCase().matches("VARCHAR(.*)")||rsmd.getColumnTypeName(i).toUpperCase().matches("CHAR(.*)"))
									{value="'"+request.getParameter(y)+"'";}
								  else 
									{  value=request.getParameter(y); }
							     }
							else
								{  if(rsmd.getColumnTypeName(i).toUpperCase().matches("DATE(.*)"))
								    { value=value+","+ "TO_DATE('"+request.getParameter(y)+"', 'YYYY-MM-DD')"; }
								else if(rsmd.getColumnTypeName(i).toUpperCase().matches("VARCHAR2(.*)")||rsmd.getColumnTypeName(i).toUpperCase().matches("VARCHAR(.*)")||rsmd.getColumnTypeName(i).toUpperCase().matches("CHAR(.*)"))
									{value=value+",'"+request.getParameter(y)+"'";}
									else
									{  value=value+","+request.getParameter(y); }
							    }
					}			

		}


	
//	out.print(value);
  	int k=	st.executeUpdate("insert into "+table+" values("+value+")"  );
	if(k>0)
		{%> <script>alert("insertion successful"); </script>
	<%
		}
	else{%>
	    <script> alert("insertion failed"); </script>
	<%}
	RequestDispatcher rd=request.getRequestDispatcher("dbex.jsp");
					rd.include(request,response);

	}
	catch(Exception e)
	{
		out.print(e);
	}

	


	%>	


	<body>
	
