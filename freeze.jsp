	<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
 <%@ page import="java.sql.*" %>
 <%
   session=request.getSession(true);
		String tablename=request.getParameter("tab7");
		                        ServletContext context=getServletContext();
					String url=context.getInitParameter("url");
					String u_name=context.getInitParameter("u_name");
					String pwd=context.getInitParameter("pwd");
					String driver=context.getInitParameter("driver");

					Class.forName(driver);

                        Connection  con=DriverManager.getConnection(url,u_name,pwd);
                         Statement st=con.createStatement();
						 if(st.execute("update pevent set freeze_date=TO_DATE('"+request.getParameter("fdate")+ "','YYYY-MM-DD') where course_name='"+tablename+"'")){
						 %> <script> alert("updated successfully");</script>
						 <%}else{%>
						 <script> alert("updated successfully");</script>
						 <%}
						 
					RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
					rd.include(request,response);
					%>