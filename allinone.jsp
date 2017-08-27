<%
					ServletContext context=getServletContext();
					String url=context.getInitParameter("url");
					String u_name=context.getInitParameter("u_name");
					String pwd=context.getInitParameter("pwd");
					String driver=context.getInitParameter("driver");
					/*
                Date d=new Date();
                int n=d.getHours();
                if(n>=0 && n<12)
                {
                out.print("<div style=\"text-align:right\"><h2 >Good Morning</h2></div>");
//                out.print("<embed src=mng.ogg hidden=true loop=1></embed>");
                        }
                else if(n>=12 && n<16)
                {
                out.print("<div style=\"text-align:right\"><h2 >Good Afternoon</h2></div>");
//                out.print("<embed src=noon.ogg hidden=true loop=1></embed>");
                        }
                
                else if(n>=16 && n<0)
                {
                    out.print("<div style=\"text-align:right\"><h2 >Good Evening</h2></div>");             
  //              out.print("<embed src=evening.ogg hidden=true loop=1></embed>");
                }*/
				 Class.forName(driver);
					Connection  con=DriverManager.getConnection(url,u_name,pwd);
									 Statement st=con.createStatement();
									 Statement st1=con.createStatement();
									String DeptId=null;
									ResultSet rs=null;
			
				session=request.getSession(true);
				String dname=(String)session.getAttribute("dname");
				try
				{
					String helll="excuseme";
					 helll=(String)session.getAttribute("helll");
					if(!helll.equals("loggedin"))
					{
					RequestDispatcher rd=request.getRequestDispatcher("homepage.html");
					}
				}//try
				catch(NullPointerException npe)
				{
					RequestDispatcher rd=request.getRequestDispatcher("homepage.html");
					rd.forward(request,response);
				}
				session.setAttribute("coming","allinone.jsp");
					session.setAttribute("coming1","allinone.jsp");
				%>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
 <%@ page import="java.sql.*" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Welcome To Dept Events</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Capitalist Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
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
                        alert("course selected");
		}
					
		function gotodbex()
		{
		document.getElementById('iframe_a').focus();
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
<!-- for side menu vertical -->
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
      /*background-color: transparent;*/
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
    /*background-color: transparent;*/
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
	alert("Do Visit Again");
}
</script>
<!--/logout script over-->
<script>
				$(document).ready( function(){

				$('details').click(function(event){
					$('details').not(this).removeAttr("open");
				});						
											});
	</script>
<!-- top bar -->
<div class="top-bar navbar-wrapper" style="margin-top:0;background-color:brown;" >
	<div class="container" >
		<ul class="top-contacts">
			<li class="top-unhover"><p><span class="fa fa-phone-square" aria-hidden="true"></span> +(91)298396</p></li>
			<li class="top-hover"><p><span class="fa fa-envelope" aria-hidden="true"></span> <a href="http://www.vnrvjiet.ac.in/" target="_blank">www.vnrvjiet.ac.in</a></p></li>
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
<div class="navbar-wrapper" ">
	<div class="container-fluid" >      
		<nav class="navbar navbar-inverse navbar-static-top cl-effect-4" style="height:150px">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					              <a class="navbar-brand" href="#">
			  			<img style="float:left; margin-right:5%;width:13%; height:1100%;" src="eventsdoc/logo1.png">
								<h1 style="color:white">Welcome To The Events Of Vnr</h1>
								<p >
									An Autonomous Institution
									Accredited by NAAC with 'A' Grade
									UG & PG Programmes are Accredited by NBA
									Recognized as "College with Potential for Excellence" by UGC
								</p></a>
				</div>
				<div id="navbar" class="navbar-collapse collapse " >
				  <ul class="nav navbar-nav navbar-right ">
				    <li>				<div class="dropdown maindata">
										  <button class="dropbtn" style="background-color:#000080">Events</button>
										  <div class="dropdown-content">
						<!-- ------ 942	/--------------- -->
											<%
																		 
												 if(st.execute("select id from plogin where department like '"+dname+"'") )  
												 {  rs=st.getResultSet();
													rs.next();
													DeptId=rs.getString(1);
												 }																		
														
													out.print("<details><summary style=\"font-size:10px;padding:10px;\">UPCOMING</summary>");   
														 if(st1.execute("select * from pevent where dept in ('"+DeptId+"','CMN') and start_date>sysdate"))
														   {
																ResultSet rs1=st1.getResultSet();
																 ResultSetMetaData rsmd1=rs1.getMetaData();
																		int nc1=rsmd1.getColumnCount();
																		out.print("<table class=\"subdata\"border=0; >");
																		int count=1;
																	while(rs1.next())
																	{
																		

																	for(int i=1;i<=nc1;i++)
																   {
																	 if(i==3)
																		   {
																		   out.print("<tr style=\"background-color:white;\"><td style=\"width:50%\"><input style=\"color:grey\" type=text value="+rs1.getString(3)+"   onClick=assigntab(this.value)></td></tr> ");
																		   }
																   
																	 }//for
																	}//white
																		   out.print(" </table></details>");
															}//if
																				   //////////////////////////////////////ongoing
																	out.print("<details ><summary style=\"font-size:10px;padding:10px;\">ONGOING</summary>");
													 if(st1.execute("select * from pevent where dept in ('"+DeptId+"','CMN') and start_date<sysdate and end_date>sysdate"))
														 {
																			ResultSet rs1=st1.getResultSet();
																			ResultSetMetaData rsmd1=rs1.getMetaData();
																			int nc1=rsmd1.getColumnCount();
																			out.print("<table class=\"subdata\" border=0; >");
																			int count=1;
																			while(rs1.next())
																			{	
																			  for(int i=1;i<=nc1;i++)
																				  {
																				  if(i==3)
																					{
																					out.print("<tr style=\"background-color:white;\"><td style=\"width:50%\"><input type=\"text\" value="+rs1.getString(3)+"  style=\"color:grey\" onClick=assigntab(this.value)></td></tr> ");
																					}
																					else
																					{
																					//out.print(rs1.getString(i));
																					}
																				   }
																			}
																		   out.print(" </table></details>");
														}
																	   //////////////////////////////////completed

															out.print("<details ><summary style=\"font-size:10px;padding:10px;\">COMPLETED</summary>");
														if(st1.execute("select * from pevent where dept in ('"+DeptId+"','CMN') and end_date<sysdate"))
														  {
																		ResultSet rs1=st1.getResultSet();
																		ResultSetMetaData rsmd1=rs1.getMetaData();
																		int nc1=rsmd1.getColumnCount();
																		out.print("<table class=\"subdata\"  >");
																		int count=1;
																		while(rs1.next())
																		{																		
																	  for(int i=1;i<=nc1;i++)
																		  {
																			  if(i==3)
																				{
																				out.print("<tr style=\"background-color:white;\"><td style=\"width:50%\"><input type=\"text\" value="+rs1.getString(3)+"  onClick=assigntab(this.value)></td></tr> ");
																				}
																				else
																				{
																			//	out.print(rs1.getString(i));
																				}
																		  }//for
																		}//while
																	   out.print(" </table></details>");
															  }

										%>
										</div>
									</div>
					</li>
					<li>
						<form METHOD=POST NAME="logout" ACTION="logout.jsp">
						<input type="submit" onclick="log_out()" class=dropbtn style="background-color:#000080" value="Log out">
						</form>
					</li>						  	
				  </ul>
				</div>
          </div>
        </nav>
	</div>
</div>
<!-- /navigation section -->
<div class="agileits"></div>
<!-- services section -->
<section class="service-w3ls Mainsection bgg"  id="service" > 
		<!-- mine  -->
				<h1 style="margin-top: 2%;" class="text-center ">Welcome To 
			   <%
				out.print(dname+" Events </h1>	<br><br><br><br>");
				%>				
		<!-- mine over-->
						<div style="border:1px solid black;" > 
									<form action="dbex.jsp" method=post target="iframe_a" style="clear:both"   >
									<table align=center>
									<tr style="background-color:red;"><td style="width:80%;"><marquee><strong style="font-size:30px;color:#000080">Select Course And Press:</strong></marquee></td>
									<input id="tab1" type=text name="table"  required   style="display:none">
									<td style=""><input type=submit id="eventdetails" title="select any course first" style="float:right;width:100%; font-size:40px;background-color:#000080;" class="dropbtn" onClick="gotodbex()" value=EventDetails ></td>
									</tr>
									  </table>
									 </form>  
						</div>
						<div >
				    	<!--	<div class="vertical-menu " >
									  <br><br>
										<div class="btn btn-success">
											<a href="#" data-toggle="modal" data-target="#largeModal1" >
										   <div class="input-group">	  
												<span class="input-group-addon"><i class=" glyphicon glyphicon-refresh" style="color:orange"></i></span>
											   <input type="button"  value="update" >
										   </div>
											</a>
			
									  </div>
														  <br><br>
									  <div class="btn btn-danger">
											<div class="input-group">	  
												<span class="input-group-addon"><i class=" glyphicon glyphicon-trash" style="color:orange"></i></span>
												<a href="#" data-toggle="modal" data-target="#largeModal2" ><input type=button  value=Delete></a>	
											</div>
									  </div>
									  <br><br>
									  <div class="btn btn-success">
											
												<form action=download.jsp class=scripthide style="margin-top:15px;margin-bottom:15px;height=15%">
													  <input type="text" name=tab6 id=tab6 style="display:none" required>
														<div class="input-group ">
														<span class="input-group-addon"><i class=" glyphicon glyphicon-download" style="color:skyblue"></i></span>
													  <input type="submit"  value="download" >
													   </div>
												  </form>
									  </div>
									  <br><br>
									  <div >
											<div class="input-group btn btn-danger">	  
												<span class="input-group-addon"><i class=" glyphicon glyphicon-qrcode" style="color:orange"></i></span>
											<a href="#" data-toggle="modal" data-target="#largeModal4" ><input type=button  value="Change Password"></a>
											</div>
											<br>
									  </div>										
									  
								/////////////////////////////////////-->
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
										<li>
											<a href="#" data-toggle="modal" data-target="#largeModal1" >					   
											   Update			
											   <span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-refresh"></span>
											</a>
										</li>
										<li>
											<a href="#" data-toggle="modal" data-target="#largeModal2" >Delete
											<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-trash"></span></a>
										</li>
										<li>
											<form action=download.jsp style="margin-right:0%;padding:10px;">
												<input type="text" name=tab6 id=tab6 style="display:none" required>
												<input type=submit  value=download  style="color:grey">
										    </form>			
										</li>
										<li>
										<a href="#" data-toggle="modal" data-target="#largeModal4" >
										Change Password
										<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-qrcode"></span>
										</a>
										</li>									
									  </ul>
									</div>
								  </div>
								</nav>
							</div>
				<!-- now see it for pakka done -->
									<iframe name="iframe_a" id="iframe_a"
									style="float:left;  width:88%;height:400px;" frameBorder="0">
									</iframe>						
						</div>
	<!---------/////////////////////////////////////--->
</section>
<!-- /services section -->

<!--update service section -->
<section  class="service-w3ls Mainsections"  id="service" > 
		<div class="modal fade" id="largeModal1" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h3 style="color:black" class="modal-title" id="myModalLabel">First Search Then Update</h3>
					</div>					
				</div>
				<div class="model-body">
					 <form method="post" action="update.jsp" class="form-inline" target="iframe_b">
						<div class="form-group">
							  <input id="tab3" type=text name=table3 required style="display:none">
							  <div class="input-group">
								 <span class="input-group-addon"><i class=" glyphicon glyphicon-search" style="color:orange"></i></span>
								  <input  type=text style="color:black" name=hno onChange="cdisplay()" placeholder="Enter Hall Ticket Number">
								  <input type=submit value="find" class="btn btn-warning form-control">
						      </div>
						</div>
					 </form>
				</div>
				<div class="model-footer">
					 <iframe id="iframe_b" name="iframe_b"  text=white
								style="  width:100%;height:500px; display:none">
					 </iframe>	
				</div>
			</div>
		</div>																					  
	</div>
	
<!-- </section>
<!--update service section

<!--delete service section
<section class="service-w3ls Deletesection" id="service"> -->

				<div class="modal fade" id="largeModal2" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								<h3 class="modal-title" style="color:black" id="myModalLabel">Remember!!!! Can't Be Undone</h3>
							</div>
							<div class="modal-body">
								<form action=delrecord.jsp class="from-inline">
									<div class="form-group">		
										<input type=text id=tab4 name=tab4 required style="display:none">
										hno:<input type=text id=delhno name=delhno style="color:black">
										<input type=submit style="color:black" class="form-control">
									</div>
								</form>	
							</div>							
						</div>
					</div>
				</div>

<!--delete service section-->

<!-- change password service section
<section class="service-w3ls changepassword" id="service">  -->
	<div class="modal fade" id="largeModal4" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div class="modal-body">
				<!-- <h3 ng-show="edit">Change Password:</h3> -->
					  <form style="margin:10%;color:black" action="change.jsp" name="myform">
						<div class="form-group">
						  <label for="name">user name:</label>
						  <input type="text" name="uname" placeholder="username" ng-model="uname" class="form-control" id="name" required>
						</div>

						<div class="form-group">
						  <label for="pwd1">Current Password:</label>
						  <input type="password" required class="form-control" id="pwd1"
						  name="pwd1" ng-model="pwd1" placeholder="Current Password">
						</div>
						<div class="form-group">
						  <label for="pwd2">Password:</label>
						  <input type="password" required class="form-control" id="pwd2"
						  name="pwd2" ng-model="pwd2" placeholder="New Password">
						</div>

						<div class="form-group">
						  <label for="pwd3">Repeat Password:</label>
						  <input type="password" required class="form-control" id="pwd3"
						  name="pwd3" ng-model="pwd3" placeholder="Repeat Password">
					   </div>
					   <span ng-show="pwd2!=pwd3 && myform.pwd3.$touched">repeated password is not same</span>
   <button type="submit" class="btn btn-default" ng-disabled=" myform.$invalid || !(pwd2==pwd3)">Submit</button>
						</form>
				</div>
			</div>
		</div>
    </div>									

</section>
<!--//chane password section-->
<!-- map section -->
 <div class="map " id="gm">
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7608.7080038914555!2d78.38126595474198!3d17.538324617619526!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bcb8e0ab28e0975%3A0x7b048b2858fdee94!2sVNR+Vignana+Jyothi+Institute+of+Engineering+and+Technology!5e0!3m2!1sen!2sin!4v1499703452049" width="100%" height="400" frameborder="0" style="border:0" allowfullscreen></iframe>
</div> 
<!-- /map section -->
<!-- contact section -->
<section class="contact-w3ls" id="contact">
	<div class="container">
		<h3 class="text-center ">Follow Us</h3>
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
		<p>&copy; 2017 Vnr Vjiet. All Rights Reserved | Design by <a href="http://www.vnrvjiet.ac.in/" target="_blank"> vnr vjiet students </a></p>
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