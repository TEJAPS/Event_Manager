<%
				 session=request.getSession(true);
					session.setAttribute("coming","admin.jsp");
					session.setAttribute("coming1","admin.jsp");
				
			 try
				{
					String hell="excuseme";
					 hell=(String)session.getAttribute("hell");
					if(!hell.equals("loggedin"))
					{
					RequestDispatcher rd=request.getRequestDispatcher("homepage.html");
					}
				}//try
				catch(NullPointerException npe)
				{
					RequestDispatcher rd=request.getRequestDispatcher("homepage.html");
					rd.forward(request,response);
				}
					
					ServletContext context=getServletContext();
					String url=context.getInitParameter("url");
					String u_name=context.getInitParameter("u_name");
					String pwd=context.getInitParameter("pwd");
					String driver=context.getInitParameter("driver");
%>		  
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
 <%@ page import="java.sql.*" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Admin Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="storaing of events" />
<!-- font files -->
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<!-- /font files -->
<!-- css files -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/jQuery.lightninBox.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/pogo-slider.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- /css files -->
<!-- js files -->
<script src="js/modernizr.custom.js"></script>
<!-- /js files -->
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
		<script>
         history.forward();

		function cdisplay()
			{document.getElementById('iframe_b').style.display="inline";
			}
				
		function assigntab(x)
		{
			document.getElementById('tab1').value=x;
             document.getElementById('eventdetails').focus();           
			document.getElementById('tab3').value=x;
			document.getElementById('tab4').value=x;
			document.getElementById('tab6').value=x;
			document.getElementById('tab5').value=x;
			document.getElementById('tab7').value=x;
			alert("course selected");
		}
					
					function gotodbex()
				{
				document.getElementById("iframe_a").focus();
				}
	</script>
		
			<!-- Latest compiled and minified CSS -->
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

			<!-- jQuery library -->
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

			<!-- Latest compiled JavaScript -->
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
			
			<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script> 
			<!--for side bar just try -->	
			<style>
			
  nav.sidebar, .main{
    -webkit-transition: margin 200ms ease-out;
      -moz-transition: margin 200ms ease-out;
      -o-transition: margin 200ms ease-out;
      transition: margin 200ms ease-out;
  }

  .main{
    padding: 10px 10px 0 10px;
  }

 @media (min-width: 765px) {

    .main{
      position: absolute;
      width: calc(100% - 40px); 
      margin-left: 40px;
      float: right;
    }

    nav.sidebar:hover + .main{
      margin-left: 200px;
    }

    nav.sidebar.navbar.sidebar>.container .navbar-brand, .navbar>.container-fluid .navbar-brand {
      margin-left: 0px;
    }

    nav.sidebar .navbar-brand, nav.sidebar .navbar-header{
      text-align: center;
      width: 100%;
      margin-left: 0px;
    }
    
    nav.sidebar a{
      padding-right: 13px;
    }

    nav.sidebar .navbar-nav > li:first-child{
      border-top: 1px #e5e5e5 solid;
    }

    nav.sidebar .navbar-nav > li{
      border-bottom: 1px #e5e5e5 solid;
    }

    nav.sidebar .navbar-nav .open .dropdown-menu {
      position: static;
      float: none;
      width: auto;
      margin-top: 0;
      background-color: transparent;
      border: 0;
      -webkit-box-shadow: none;
      box-shadow: none;
    }

    nav.sidebar .navbar-collapse, nav.sidebar .container-fluid{
      padding: 0 0px 0 0px;
    }

    .navbar-inverse .navbar-nav .open .dropdown-menu>li>a {
      color: #777;
    }

    nav.sidebar{
      width: 200px;
      height: 100%;
      margin-left: -160px;
      float: left;
      margin-bottom: 0px;
    }

    nav.sidebar li {
      width: 100%;
    }

    nav.sidebar:hover{
      margin-left: 0px;
    }

    .forAnimate{
      opacity: 0;
    }
  }
   
  @media (min-width: 1330px) {

    .main{
      width: calc(100% - 200px);
      margin-left: 200px;
    }

    nav.sidebar{
      margin-left: 0px;
      float: left;
    }

    nav.sidebar .forAnimate{
      opacity: 1;
    }
  }

  nav.sidebar .navbar-nav .open .dropdown-menu>li>a:hover, nav.sidebar .navbar-nav .open .dropdown-menu>li>a:focus {
    color: #CCC;
    background-color: transparent;
  }

  nav:hover .forAnimate{
    opacity: 1;
  }
 
			</style>
</head>
<body id="h12" ng-app="" background="images/sushbg.jpg">
<!--//////log out script -->
<script type="text/javascript">
function log_out()
{
	alert("please do visit again");
}
</script>
<!--/logout script over-->

<script>
	$(document).ready(function(){
		
		  $("details.maindata").click(function(event){
		   $("details.maindata").not(this).removeAttr("open");
		   });
		  
		  
		  $("details.subdata").click(function(event){
		   $("details.subdata").not(this).removeAttr("open");
		   });

		   
		  $("details.subsubdata").click(function(event){
		   $("details.subsubdata").not(this).removeAttr("open");
		   });
		   
		  $("details.details2").click(function(event){
		   $("details.details2").not(this).removeAttr("open");
		   });
	});
</script>

<!-- top bar -->
<div class="top-bar navbar-wrapper" style=" margin-top:0;  background-color:brown;" >
	<div class="container-fluid" style="">
		<ul class="top-contacts">
			<li class="top-unhover"><p><span class="fa fa-phone-square" aria-hidden="true"></span> +(91) 8686298396</p></li>
			<li class="top-hover"><p><span class="fa fa-envelope" aria-hidden="true"></span> <a  href="http://www.vnrvjiet.ac.in/" target="_blank">www.vnrvjiet.ac.in</a></p></li>
		</ul>
		<ul class="top-links">
			<li><a href="#"><i class="fa fa-facebook"></i></a></li>
			<li><a href="#"><i class="fa fa-twitter"></i></a></li>
			<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
			<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
		</ul>
		<div class="clearfix"></div>
	</div>		
</div>
<!-- /top bar -->

<!-- navigation section -->
<div class="navbar-wrapper" >
  
	<div class="container-fluid">
		<nav class="navbar navbar-inverse navbar-static-top cl-effect-4" style="height:150px">
			<div  class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
						<a class="navbar-brand" href="#">
			  			<img style="float:left; margin-right:5%;width:13%; height:1100%;" src="eventsdoc/logo1.png">
								<h1 style="color:white"> Vnr Vjiet</h1>
								
								<h4 >
									An Autonomous Institution
									Accredited by NAAC with 'A' Grade
									UG & PG Programmes are Accredited by NBA
									Recognized as "College with Potential for Excellence" by UGC
								</h4></a>

            </div>
            
          </div>
        </nav>
	</div>
</div>
<!-- menu bar horizontal -->
<div class="navbar-wrapper container-fluid">
	<div id="navbar" style="clear:both;" class="navbar-collapse collapse" >
              <ul class="nav navbar-nav navbar-right" >
				<li>  	<div class="dropdown">
							  <button class="dropbtn" style="    background-color:#000080;">Branch Wise Events</button>
								  <div class="dropdown-content">
									<%
						out.print("<section style=\"width:200%; background-color:white;\">");
                        Class.forName(driver);
                        Connection  con=DriverManager.getConnection(url,u_name,pwd);
                         Statement st=con.createStatement();
                        if(st.execute("select department,id from plogin"))
                        { 
                            //out.print("<table class=maindata   width=100% >");
                            ResultSet rs=st.getResultSet();
                            rs.next();
                            while(rs.next())
                            {
                                out.print("<details  class=maindata><summary  style=\"color:grey;font-size:15px;padding:5px;\">"+rs.getString(1)+"</summary>"); 
		
                    
                //                out.print("<p>");
                                Statement st1=con.createStatement();
                                if(st1.execute("select * from pevent where dept = '"+rs.getString(2)+"'"))
                                {
                                ResultSet rs1=st1.getResultSet();
                                ResultSetMetaData rsmd1=rs1.getMetaData();
                                int nc1=rsmd1.getColumnCount();
                                out.print("<table class=subdata border=0; >");
								int count=1;
                                 while(rs1.next())
                                {
                                for(int i=3;i<=nc1;i++)
                                    { 
                                       if(i==3)
                                       {  
                                           out.print("<tr style=\"background-color:white;\" height=\"15\"><td><input class=\"dropdown-toggle\" type=\"text\" value="+rs1.getString(3)+" onClick=assigntab(this.value) style=\"background-color:#FAFAFF;color:grey;width:100%\" > </td></tr>");
                                       }                                    
                                     }                                    
                                }
                                out.print(" </table>");
                                }                
                out.print("</details>");
                }
                
              //  out.print("</table>");
		   }
				
           
        out.print("</section>");			
        %>       
		<!-- /////////////////////////////////////////////////////////////////-->
										  </div>
									</div>
				</li>
				<li>
					<div style="display:none" class="dropdown">
					  <button class="dropbtn" style="    background-color:#000080;">Duration Wise</button>
					  <div class="dropdown-content">
						<%
						        out.print("<section >");	
                  st=con.createStatement();
                    if(st.execute("select department,id from plogin"))
                    {  
                        out.print("<table class=maindata  width=100% >");
                        ResultSet rs=st.getResultSet();
                        rs.next();
                        while(rs.next())
                        {
							
								out.print("<tr><td><details  class=subdata><summary  style=\"color:red;font-size:10px;\">"+rs.getString(1)+"</summary>"); 


                                                    out.print("<p >");
                                                    out.print("<details style=\"float left;\" class=subsubdata><summary style=\"font-size:10px;\">upcoming</summary>");
                                                    Statement st1=con.createStatement();
                                           if(st1.execute("select * from pevent where dept = '"+rs.getString(2)+"' and start_date>sysdate"))
                                           {
                                            ResultSet rs1=st1.getResultSet();
                                            ResultSetMetaData rsmd1=rs1.getMetaData();
                                            int nc1=rsmd1.getColumnCount();
                                            out.print("<table class=subdata border=0;  >");
											int count=1;
                                            while(rs1.next())
                                            {
												/*if(count==1)                                
												{
												   out.print("<tr>");
														for(int i=1;i<=nc1;i++)
														{
															
																out.print("<th>"+rsmd1.getColumnName(i));											
																out.print("</th>");
																count++;										
														}
													out.print("</tr>");
												}*/
                                             //out.print("  <tr>");
                                             for(int i=1;i<=nc1;i++)
                                              {
                                                 //   out.print("<td>");
                                                  if(i==3)
                                                    {
                                                    out.print("<tr><td><input class=\"btn btn-info\" type=\"button\" value="+rs1.getString(3)+" onClick=assigntab(this.value)> </td></tr>");
                                                    }
                                                    else
                                                    {
                                                   // out.print(rs1.getString(i));
                                                    }
                                                  //out.print("</td>");
                                              }
                                             //out.print("</tr>");
                                            }
                                           out.print(" </table></details>");
                                           }
                                           //////////////////////////////////////ongoing
                                           out.print("<details class=subsubdata style=\"float left;\"><summary style=\"font-size:10px;\">ongoing</summary>");
                                           if(st1.execute("select * from pevent where dept = '"+rs.getString(2)+"' and start_date<sysdate and end_date>sysdate"))
                                           {
                                            ResultSet rs1=st1.getResultSet();
                                            ResultSetMetaData rsmd1=rs1.getMetaData();
                                            int nc1=rsmd1.getColumnCount();
                                            out.print("<table border=1; >");
											int count=1;
                                            while(rs1.next())
                                            {
												/*if(count==1)                                
												{
													out.print("<tr>");
													for(int i=1;i<=nc1;i++)
													{
														
															out.print("<th>"+rsmd1.getColumnName(i));											
															out.print("</th>");
															count++;										
													}
													out.print("</tr>");
												}*/
                                         // out.print("  <tr>");
                                          for(int i=1;i<=nc1;i++)
                                              {
                                                //  out.print("<td>");
                                                  if(i==3)
                                                    {
                                                    out.print("<tr><td><input class=\"btn btn-info\" type=\"button\" value="+rs1.getString(3)+" onClick=assigntab(this.value)> </td></tr>");
                                                    }
                                                    else
                                                    {
                                                   // out.print(rs1.getString(i));
                                                    }
                                                //  out.print("</td>");
                                               }
                                           // out.print("</tr>");
                                            }
                                           out.print(" </table></details>");
                                           }





                                           //////////////////////////////////completed

                                           out.print("<details class=subsubdata style=\"float left;\"><summary style=\"font-size:10px;\">completed</summary>");
                                           if(st1.execute("select * from pevent where dept = '"+rs.getString(2)+"' and end_date<sysdate"))
                                           {
                                            ResultSet rs1=st1.getResultSet();
                                            ResultSetMetaData rsmd1=rs1.getMetaData();
                                            int nc1=rsmd1.getColumnCount();
                                            out.print("<table style=\"font-size:15px\" >");
											int count=1;
                                            while(rs1.next())
                                            {
												/*if(count==1)                                
												{
													out.print("<tr>");
													for(int i=1;i<=nc1;i++)
													{
														
															out.print("<th>"+rsmd1.getColumnName(i));											
															out.print("</th>");
															count++;										
													}
													out.print("</tr>");
												}*/
                                          //out.print("  <tr>");
                                          for(int i=1;i<=nc1;i++)
                                              {
                                                    //out.print("<td>");
                                                  if(i==3)
                                                    {
                                                    out.print("<tr><td><input class=\"btn btn-info\" type=\"button\" value="+rs1.getString(3)+" onClick=assigntab(this.value)> </td></tr>");
                                                    }
                                                    else
                                                    {
                                                   // out.print(rs1.getString(i));
                                                    }
                                            //      out.print("</td>");
                                              }
                                          //out.print("</tr>");
                                            }
                                           out.print(" </table></details>");
                                           }
                                           /////////////////////////////////

                                           out.print("</p></details></td></tr>");
                                                }

                                                out.print("</table>");
                            }				                                                
                    out.print("</section>");
		%>
						

					  </div>
					</div>
				</li>
<!--                   //////////////////////////////////////////////////////////////////////////////-->
				<li>
					<div data-toggle="modal" font-weight:600 data-target="#UploadModal" class=dropbtn style="    background-color:#000080;">Upload File
					</div>
				</li>
				<li>
					<form METHOD=POST NAME="logout" ACTION="logout.jsp">									  					
						<input type="submit"  onclick="log_out()" class=dropbtn value="Log out" style="background-color:#000080;">
					</form>
				</li>						  					  
              </ul>
            </div>

</div>
<!-- /navigation section -->


<!-- services section -->
<section class="service-w3ls bgg" id="service" style=" margin-top:12%;"> 
	<div>
		<h3 class="text-center " style="color:black">WELCOME TO ADMIN PAGE</h3>		
		<!-- mine  -->				    <%		
               /* Date d=new Date();
                int n=d.getHours();
                if(n>=0 && n<12)
                {
                out.print("<div style=\"text-align:right; color:white\"><h2 >Good Morning</h2></div>");
				}
                else if(n>=12 && n<16)
                {
                out.print("<div style=\"text-align:right; color:white\"><h2 >Good Afternoon</h2></div>");
                }             
                else if(n>=16 && n<0)
                {
                    out.print("<div style=\"text-align:right; color:white\"><h2 >Good Evening</h2></div>");             
                }
			out.print("</div>");
			*/
				%>
		<!-- mine over-->
	</div>
	<!-------------//////////////////////////////////--->
	<div style="border:1px solid black;"> 
				<form action="dbex.jsp" method=post target="iframe_a" style="clear:both"   >
				<table>
				<tr><td style="width:80%;background-color:red;"><marquee ><strong style="font-size:30px;color:#000080;">Select Course And Press:</strong></marquee></td>
				<td ><input type=submit id="eventdetails" title="select any course first" style="float:right;width:100%; font-size:40px;background-color:#000080;" class="dropbtn" value=EventDetails onclick="gotodbex()" ></td>
				<td><input id="tab1" type=text name="table"  required   style="display:none"></td>
				</tr>
				 </table>
				</form>  
	</div>
	<!-- trying just -------------->


	<nav class="navbar navbar-default sidebar" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>      
    </div>
    <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="#">Home<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a>
		</li>
        <li>
				<a href="#" data-toggle="modal" data-target="#largeModal1" >
				<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-refresh"></span>	
							  Update						 
				</a>
		</li>
		<li>		
				<a href="#" data-toggle="modal" data-target="#largeModa2" >
				<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-trash"></span>	
				Delete</a>	
		</li>                 
        <li >
			<form action=download.jsp style="padding:15px;">
					  <input type="text" name=tab6 id=tab6 style="display:none" required>			  
					  <input type="submit" style="color:grey;" value="download" >
					  <a>		<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-download"></span></a>
			</form>		
		</li>        
		<li>		
			<a href="#" data-toggle="modal" data-target="#largeModal3" >
			Change Password
			<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-qrcode"></span></a>
		</li>
		<li>
		
						<form action=freeze.jsp  id=freezedate >
						<input type=date style="color:black;" name="fdate">
						<input type=text name="tab7" id="tab7" style="display:none">
						<input type=submit  style="color:grey;" value=freeze>
						</form>
		</li>
      </ul>
    </div>
  </div>
</nav>
<!--trying over-->
	<!-- <div >
				<!--- frygafbrg trying now for sure pakka 
				<div class="vertical-menu" >
				  <div style="margin-left:5%;">
								<a href="#" data-toggle="modal" data-target="#largeModal1" >
										   <div class="input-group">	  
												<span class="input-group-addon"><i class=" glyphicon glyphicon-refresh" style="color:orange"></i></span>
											   <input type="button" class="button" value="update" >
										   </div>
								</a>
				  </div>
				  <div class="text-center " style="margin-left:5%;">
						<div class="input-group">	  
							<span class="input-group-addon"><i class=" glyphicon glyphicon-trash" style="color:orange"></i></span>
							<a href="#" data-toggle="modal" data-target="#largeModa2" >
							<input type=button class="button" value=Delete></a>	
						</div>
				  </div>
				  <div style="margin-left:5%;">
						
							<form action=download.jsp class=scripthide style="margin-top:15px;margin-bottom:15px;height=15%">
								  <input type="text" name=tab6 id=tab6 style="display:none" required>
									<div class="input-group ">
									<span class="input-group-addon"><i class=" glyphicon glyphicon-download" style="color:skyblue"></i></span>
								  <input type="submit" class="button" value="download" >
								   </div>
							  </form>
				  </div>				  
				  <div style="margin-left:5%;">
						<div class="input-group ">	  
							<span class="input-group-addon"><i class=" glyphicon glyphicon-qrcode" style="color:orange"></i></span>
						<a href="#" data-toggle="modal" data-target="#largeModal3" >
						<input type=button class="button" value="Change Password"></a>
						</div>
						<br>
				  </div>				  
				  <div  >
						<form action=freeze.jsp  id=freezedate >
						<input type=date  name="fdate">
						<input type=text name="tab7" id="tab7" style="display:none">
						<input type=submit class="button"  value=freeze>
						</form>
				  </div>								  
				</div>
				<!-- now see it for pakka done --

				<iframe name="iframe_a" id="iframe_a"
				style="float:right; width:80%;height:500px;" >
				</iframe>
	
	</div> -->
<!---------/////////////////////////////////////--->
	<iframe name="iframe_a" id="iframe_a"
				style="height:500px;float:left;width:85%;" frameBorder="0" >
				</iframe>
	
</section>
<!-- /services section -->

<!-- divider section -->
<section style="clear:both" class="divider">
	<div class="container">
		<h2 class="text-center">Ideas Are The Roots Of Creation</h2>
		<a href="#" data-toggle="modal" data-target="#largeModal" class="slideanim">Create Event</a>	
	</div>
	<div class="modal fade" id="largeModal" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Define Here:</h4>
				</div>
				<div class="modal-body">
					<!--   details inside create event//////////////////////////////// -->
					<script>
										function assigning(y)
										{ 
											document.getElementById('final').size=document.getElementById('final').size+20;

											if(y===("varchar2"))
											{ alert("enter max size inside() before ',' "); 
												document.getElementById('final').value=document.getElementById('final').value+" "+document.getElementById(y).name+'(),';
												document.getElementById('final').focus();
											}
										   else if(y===("CHAR"))
										   {  alert("enter exact length inside() before ',' ");
											 document.getElementById('final').value=document.getElementById('final').value+" "+document.getElementById(y).name+'(),';
											 document.getElementById('final').focus();
										   }
											else if(y===("BOOLEAN"))
											{ alert("no need to enter anything ");
												document.getElementById('final').value=document.getElementById('final').value+" "+document.getElementById(y).name+',';
												document.getElementById('final').focus();
											}
											else if(y===("NUMERIC"))
											{ alert("no need to do anything");
												document.getElementById('final').value=document.getElementById('final').value+" "+document.getElementById(y).name+',';
												document.getElementById('final').focus();
											}
											else if(y===("DATE"))
											{ alert("no need to enter anything ");
												document.getElementById('final').value=document.getElementById('final').value+" "+document.getElementById(y).name+',';
												document.getElementById('final').focus();
											}
											else if(y===("TIME"))
											{ alert("no need to enter anything  ");
												document.getElementById('final').value=document.getElementById('final').value+" "+document.getElementById(y).name+',';
												document.getElementById('final').focus();
											}
										}
									  
									  </script>
                                              
                                              
						  <form action="create.jsp" class="form-inline" method=post style="color:black">
							<a href="https://www.w3schools.com/sql/sql_datatypes_general.asp">?help</a>

								<div class="form-group">
									<input type=text name=ctable style="color:black" id=ctable placeholder="Enter Event Name" size=50>
									<input type=button class="form-control" name=varchar2 id="varchar2" value="string" onClick="assigning(this.id)">
									<!--<input type=button name=CHAR id="CHAR" class="form-control" value="char" onClick="assigning(this.id)"> -->
									<!--<input type=button name=BOOLEAN id="BOOLEAN" class="form-control"value="true/false" onClick="assigning(this.id)">-->
									<input type=button name=NUMERIC id="NUMERIC" value="NUMERIC" class="form-control" onClick="assigning(this.id)">
									<input type=button name=DATE id="DATE" value="DATE" onClick="assigning(this.id)">
								</div>
								<div class="form-group">
									<input type=text class="form-control" name=final id=final size="60" value="hno varchar2(15)," >
									<input type="submit" class="form-control" value="create event ">
								</div>
						  </form>     
						  <!--//////////////////////create event over------------>
	<!--				<div class="col-lg-6 col-md-6">
							<img src="images/banner1.jpg" class="img-responsive" alt="w3layouts" title="w3layouts">
						</div>
						<div class="col-lg-6 col-md-6">
							<p class="banner-p1">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sed nisl ultricies, dignissim mi at, dignissim dolor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Quisque tempor ultrices nisi eget dictum. Integer quis massa ut elit laoreet consectetur. Sed rhoncus erat tellus, at commodo erat mattis eu.</p>
						</div>
         -->
						<div class="clearfix"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-lg btn-success" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
    </div>

</section>
<!-- /divider section -->
<!--update service section -->
<section id="service" > 
	<div class="modal fade" id="largeModal1" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h3 style="color:black">Search First Then Update</h3>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div class="model-body">
					
					  <form method="post" class="form-inline" action="update.jsp"  target="iframe_b">					  
						  <div class="form-group">
							  <input id="tab3" type=text name=table3 required style="display:none">
							  <div class="input-group">
									<span class="input-group-addon"><i class=" glyphicon glyphicon-search" style="color:orange"></i></span>
									<input style="color:black" type=text name=hno placeholder="Enter Hall Ticket Number" onChange="cdisplay()">
									<input type=submit value=find class="btn btn-warning form-control">
							  </div>
						  </div>
					  </form>
					 <iframe id="iframe_b" name="iframe_b"  text=white
								style="  width:100%;height:125px; display:none">
					  </iframe>								
				</div>
			</div>
		</div>
	</div>								 																  
	<!--               ///////////////////////////////////////                   -->
	<div class="modal fade" id="UploadModal" tabindex="-1" role="dialog" aria-labelledby="UploadModal" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" style="color:black">
				<div class="modal-header">
					<h3 style="color:black">Read Carefully Then Update</h3>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div class="model-body">
					
					<ol>
					<li> Excel Sheet Must have ColumnNames On The Top</li>
					<li> Hno aliaz HallTicket Number Should Be The First Column </li>
					<li> It should be Saved in the Type as Excel 97-2003 WorkBook(*.xls)</li>
					<li> It should have an extension as (.xls)</li>
					<li> Before Uploading make sure you created event for it</li>
					<li>The Whole Path is To be Typed in FileName</li>
					</ol>
					<br><br><br><br>
							<form action="db2.com" method=post >
							Enter Event Name :
							<input type=text name=new_table_name>
							Enter File Name :
							<input type=text placeholder="enter file name along with path" name=file_name>
							<input type=submit value=sendfilename>
							</form>					
				</div>
				<div class="modal-footer">
				<h3>Thank You</h3>
				</div>
			</div>
		</div>
	</div>								 																  
	<div class="modal fade" id="largeModa2" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h3 style="color:black">Remember!!!!!!!!!! Can't be Undone</h3>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div class="modal-body">
					<details class="btn btn-danger"> 
									<summary>Delete Record</summary>
									<form action=delrecord.jsp class="form-inline">
										<div class="form-group">
											<input type=text id=tab4 name=tab4 required style="display:none">
											hno:<input type=text id=delhno name=delhno style="color:black">
											<input type=submit class="form-control " value="Delete Record">
										</div>
									</form>				
							</details>
							<details class="btn btn-danger">
									<summary>Delete Event</summary>
									<form action=removetable.jsp class="form-inline">
										<div class="from-group">
											event:<input type=text id=tab5 name=tab5 required style="display:none">
											<input type=submit class="form-control" style="color:black" value="Delete Event">
										</div>
									</form>
							</details>	
				</div>				
			</div>
		</div>
    </div>

</section> 
<!--delete service section-->

<!--download service section-->
<section > 								  
			<div class="modal fade" id="largeModal3" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel"></h4>
						</div>
						<div class="modal-body">
									<form style="margin:10%;color:black" action="change.jsp" name="myform">
										<div class="form-group">
										  <label for="name">user name:</label>
										  <input type="text" name="uname" ng-model="uname" class="form-control" id="name" required>
										</div>

										<div class="form-group">
										  <label for="pwd1">Current Password:</label>
										  <input type="password" required class="form-control" id="pwd1"
										  name="pwd1" ng-model="pwd1" >
										</div>
										<div class="form-group">
										  <label for="pwd2">Password:</label>
										  <input type="password" required class="form-control" id="pwd2"
										  name="pwd2" ng-model="pwd2" >
										</div>

										<div class="form-group">
										  <label for="pwd3">Repeat Password:</label>
										  <input type="password" required class="form-control" id="pwd3"
										  name="pwd3" ng-model="pwd3">
									   </div>
									   <span ng-show="pwd2!=pwd3 && myform.pwd3.$touched">repeated password is not same</span>
										<button type="submit" class="btn btn-default" ng-disabled=" myform.$invalid || !(pwd2==pwd3)">Submit</button>
										</form>
						</div>				
					</div>
				</div>
			</div>
		  
					  
</section>


<!-- subscribe section -->
<!--<section class="subs slideanim">
	<div class="container">
		<div class="col-lg-6 col-md-6 subs-w3ls1 slideanim">
			<h3>Subscribe To Us</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam convallis augue at auctor mollis. Aliquam sollicitudin accumsan scelerisque. Sed aliquet elit vitae ex posuere, a fringilla metus congue.</p>
		</div>
		<div class="col-lg-6 col-md-6 subs-w3ls1">
			<div class="subscribe">
				<form action="#" method="post">
					<div class="form-group1">
						<input class="form-control" id="email" name="email" placeholder="Enter Your Email Address" type="email" required>
					</div>
					<div class="form-group2">
						<button class="btn btn-outline btn-lg" type="submit">Subscribe</button>
					</div>
					<div class="clearfix"></div>
				</form>
			</div>	
		</div>
		<div class="clearfix"></div>
	</div>
</section>
<!-- /subscribe section 
-->
<!-- map section -->
 <div class="map " >
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7608.7080038914555!2d78.38126595474198!3d17.538324617619526!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bcb8e0ab28e0975%3A0x7b048b2858fdee94!2sVNR+Vignana+Jyothi+Institute+of+Engineering+and+Technology!5e0!3m2!1sen!2sin!4v1499703452049" width="100%" height="400" frameborder="0" style="border:0" allowfullscreen></iframe>
</div> 
<!-- /map section -->

<!-- contact section -->
<section class="contact-w3ls" id="contact">
	<div class="container">
		<h3 class="text-center slideanim">Follow Us</h3>
		<ul class="social-icons1">
			<li><a href="#"><i class="fa fa-facebook"></i></a></li>
			<li><a href="#"><i class="fa fa-twitter"></i></a></li>
			<li><a href="#"><i class="fa fa-whatsapp"></i></a></li>
			<li><a href="#"><i class="fa fa-youtube"></i></a></li>
			<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
		</ul>	
	</div>
</section>
<!-- /contact section -->
<!-- footer section -->
<div class="footer">
	<div class="container">
		<p>&copy; 2017 Vnr Vjiet. All Rights Reserved | Design by <a  href="http://www.vnrvjiet.ac.in/" target="_blank"><b> vnr vjiet <b></a></p>
	</div>
</div>
<!-- /footer section -->
<a href="#0" class="cd-top">Top</a>
<!-- js files -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/SmoothScroll.min.js"></script>
<script src="js/top.js"></script> 
<script src="js/jQuery.lightninBox.js"></script>
<script type="text/javascript">
	$(".lightninBox").lightninBox();
</script>
<script>
$(document).ready(function(){
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar li a").on('click', function(event) {

   // Make sure this.hash has a value before overriding default behavior
  if (this.hash !== "") {

    // Store hash
    var hash = this.hash;

    // Using jQuery's animate() method to add smooth page scroll
    // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
    $('html, body').animate({
      scrollTop: $(hash).offset().top
    }, 900, function(){

      // Add hash (#) to URL when done scrolling (default click behavior)
      window.location.hash = hash;
      });
    } // End if
  });
})
</script>
<script>
$(window).scroll(function() {
  $(".slideanim").each(function(){
    var pos = $(this).offset().top;

    var winTop = $(window).scrollTop();
    if (pos < winTop + 600) {
      $(this).addClass("slide");
    }
  });
});
</script>	
<script src="js/jquery.pogo-slider.min.js"></script>
<script src="js/main.js"></script>
<!-- /js files -->
</body>
</html>