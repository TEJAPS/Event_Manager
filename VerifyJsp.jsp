
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.io.*" %>
<%@ page import="java.sql.*" %>
<% 
   
	String lusername=request.getParameter("lusername");
	String lpassword=request.getParameter("lpassword");
	ServletContext context=getServletContext();
					String url=context.getInitParameter("url");
					String u_name=context.getInitParameter("u_name");
					String password=context.getInitParameter("pwd");
					String driver=context.getInitParameter("driver");
					session=request.getSession(true);
					session.setAttribute("lusername",lusername);
					session.setAttribute("lpassword",lpassword);


	out.print("<body color=yellow bgcolor=yellow>");
	session=request.getSession(true);

					
					
    String uname= null;
	String pwd=null;	
	String dname=null;
	Class.forName(driver);
	Connection con=DriverManager.getConnection(url,u_name,password);
		Statement st1=con.createStatement();
				Statement st2=con.createStatement();
				ResultSet rs1=null,rs2=null;
		
try{
if(st1.execute("select password from plogin where username like '"+lusername+"'" ))
		{
	rs1=st1.getResultSet();
	ResultSetMetaData rsmd=rs1.getMetaData();
	int nc=rsmd.getColumnCount();
	while(rs1.next())
			{ for(int i=1;i<=nc;i++)
				{
					pwd=rs1.getString(1);
				}
			}
		}

		/////////////////////////////////////////

if(st1.execute("select username from plogin where password like '"+lpassword+"'" ))
		{
	rs1=st1.getResultSet();
	ResultSetMetaData rsmd=rs1.getMetaData();
	int nc=rsmd.getColumnCount();
	while(rs1.next())
			{ for(int i=1;i<=nc;i++)
				{
					uname=rs1.getString(1);
				}
			}
			
		}
		
 if(st1.execute("select DEPARTMENT from plogin where password like '"+lpassword+"'"))
	{
	rs1=st1.getResultSet();
	ResultSetMetaData rsmd=rs1.getMetaData();
	int nc=rsmd.getColumnCount();
	while(rs1.next())
			{ for(int i=1;i<=nc;i++)
				{
					dname=rs1.getString(1);
				}
			}
		}

		if(pwd.equals(lpassword))
		{
				if(lusername.equals("vnrcse")||lusername.equals("vnrece")||lusername.equals("vnreee")||lusername.equals("vnreie")||lusername.equals("vnrit")||lusername.equals("vnrmech")||lusername.equals("vnrcivil")||lusername.equals("vnrame")||lusername.equals("vnrhns")||lusername.equals("vnrcommon"))
			{	session.setAttribute("helll", "loggedin");
				response.sendRedirect("allinone.jsp");
				session.setAttribute("dname",dname);
			}
				else if(lusername.equals("vnradmin"))
					{session=request.getSession(true);
						session.setAttribute("hell", "loggedin");
						response.sendRedirect("admin.jsp");
					}

     	}//if loop main wala
		else if(pwd.equals(null) || uname.equals(null))
		{	%>
			   <script> alert("username or Password is not valid..");</script>
	        <%  request.getRequestDispatcher("homepage.html").include(request,response);
										
			 
		}
			
				out.print("</body>");

	
}
catch(Exception e){ 					

										%>
										<script>alert("username or password is wrong"); </script>
										<%
										RequestDispatcher rd=request.getRequestDispatcher("homepage.html");
										rd.include(request,response);
				}
%>