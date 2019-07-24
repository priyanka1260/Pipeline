<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
    <title>Pipeline</title>
    <!-- Custom CSS -->
    <link href="../../css/login.css" rel="stylesheet">
    <link href="../../assets/libs/flot/css/float-chart.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../../dist/css/style.min.css" rel="stylesheet">
    <!-- <script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->
      
<!--     <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  

 

   
<!-- Latest compiled and minified CSS -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>  
Latest compiled JavaScript
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> -->


<!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script> -->

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #808080;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #43A047;
}
.form .si {
  margin: 15px 0 0;
  color: 87cefa;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}
body {
  background: #76b852; /* fallback for old browsers */
  background: -webkit-linear-gradient(right, #76b852, #8DC26F);
  background: -moz-linear-gradient(right, #76b852, #8DC26F);
  background: -o-linear-gradient(right, #76b852, #8DC26F);
  background: linear-gradient(to left, #76b852, #8DC26F);
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;      
}
</style>
</head>
<script>
//$('.message a').click(function(){
   //$('form').animate({height: "toggle", opacity: "toggle"}, "slow");
//});

$( document ).ready(function() {
	document.getElementById("id01").style.display = "none";
	
	<%-- var msg2=null;
	msg2="<%=(String)request.getSession().getAttribute("names1")%>"
	
	if (msg2 != null && msg2 != "" && msg2 !='null')
	{
alert(msg2);
	} --%>
	
	var msg1=null;

	 var msg1="<%=(String)request.getSession().getAttribute("uname")%>";
	 alert(msg1)
	 //alert("in page refresh");
     
	 <%-- if (msg == "pipeline.jsp")
	 {
		
		 validation();
	 }
	var msg="<%=request.getAttribute("uname")%>"; --%>

	
	if (msg1 != null && msg1 != "" && msg1 !='null')
	{
		alert("Welcome "+msg1+"!");
		 document.getElementById("p_data").style.display="block";
		 document.getElementById("load_file").style.display="block";
	}
	<%-- //var msg=null;

	 //var msg="<%=(String)request.getSession().getAttribute("names")%>";
	// alert(msg) --%>
	 //alert("in page refresh");
    
	 <%-- if (msg == "pipeline.jsp")
	 {
		
		 validation();
	 }
	var msg="<%=request.getAttribute("uname")%>"; --%>

	
	/* if (msg != null && msg != "" && msg !='null')
	{
alert(msg);
	} */
<%-- 	var msg=null;
	request
	msg="<%=(String)request.getSession().getAttribute("userId")%>";
	alert(msg);
	//alert("in page refresh");
	 
	if (msg != null)
	{
		
		 document.getElementById("p-data").style.display="block";
	} */ --%>

	$('#createaccount').click(function(){
		   $('#formaccount1').animate({height: "toggle", opacity: "toggle"}, "slow");
		   $('#formaccount2').animate({height: "toggle", opacity: "toggle"}, "slow");
		});
	
	$('#signin').click(function(){
		   $('#formaccount1').animate({height: "toggle", opacity: "toggle"}, "slow");
		   $('#formaccount2').animate({height: "toggle", opacity: "toggle"}, "slow");
		});
});

<%--  /*function processModule()
{
var msg=null;
alert("in load");
var msg="<%=(String)request.getSession().getAttribute("message")%>";
// alert(msg)
//alert("in page refresh");
 
if (msg )
{
	
	 document.getElementById("p-data").style.display="block";
}

} */ --%>
</script>
<body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar" data-navbarbg="skin5">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header" data-logobg="skin5">
                    <!-- This is for the sidebar toggle which is visible on mobile only -->
                    <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                    <!-- ============================================================== -->
                    <!-- Logo -->
                    <!-- ============================================================== -->
                    <a class="navbar-brand" href="index.jsp">
                        <!-- Logo icon -->
                        <b class="logo-icon p-l-10">
                        <img src="../../assets/images/astrosat.png" class="img-fluid" width="1400" style="margin-top:35px";>
                        
                            
                        </b>
                        </a>
                 </div>
 
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
              <!--  <div class="w3-container">
  <h2>Dropdown Button</h2>
 
  <div class="w3-dropdown-hover">
    <button class="w3-button w3-black">Hover Over Me!</button>
    <div class="w3-dropdown-content w3-bar-block w3-border">
      <button class="dropdown-item" onclick="document.getElementById('id01').style.display='block'" style="width:auto;"> <i class="ti-user m-r-5 m-l-5"></i> Login</button>
      <button class="dropdown-item" ><i class="fa fa-power-off m-r-5 m-l-5"></i>Logout</button>

    </div>
  </div>
</div> -->
            <!--                    
                    <ul class="navbar-nav float-right" style="float:right;">
                       
                        <li class="nav-item dropdown">
                            <a align="right" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="../../assets/images/users/1.jpg" alt="user" class="rounded-circle" width="31"></a>
                            <div class="dropdown-menu dropdown-menu-right user-dd animated">
                               <button class="dropdown-item" onclick="document.getElementById('id01').style.display='block'" style="width:auto;"> <i class="ti-user m-r-5 m-l-5"></i> Login</button>
                                <a class="dropdown-item" href="document.getElementById('id01').style.display='block'" style="width:auto;">
                                <a class="dropdown-item" href="javascript:void(0)"><i class="ti-wallet m-r-5 m-l-5"></i> My Balance</a>
                                <a class="dropdown-item" href="javascript:void(0)"><i class="ti-email m-r-5 m-l-5"></i> Inbox</a>
                               
                                <a class="dropdown-item" href="javascript:void(0)"><i class="ti-settings m-r-5 m-l-5"></i> Account Setting</a>
                                <div class="dropdown-divider"></div>
                                <form action="/Pipeline/logout" method="post">
		 <button class="dropdown-item" ><i class="fa fa-power-off m-r-5 m-l-5"></i>Logout</button>
	</form>
                                <a class="dropdown-item" href="javascript:void(0)"><i class="fa fa-power-off m-r-5 m-l-5"></i> Logout</a>
                                <div class="dropdown-divider"></div>
                                <div class="p-l-30 p-10"><a href="javascript:void(0)" class="btn btn-sm btn-success btn-rounded">View Profile</a></div>
                            </div>
                        </li>
                       
                    </ul> -->
                     <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                               
                    <ul class="navbar-nav float-right">
                       
                        <li class="nav-item dropdown">
                               <a   align="right" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="../../assets/images/users/login.jpg"  class="rounded-circle" width="31"></a>
                            <div class="dropdown-menu dropdown-menu-right user-dd animated">
                            
                              <button class="dropdown-item" onclick="document.getElementById('id01').style.display='block'"> <i class="ti-user m-r-5 m-l-5"></i> Login</button>
								
                              <div class="dropdown-divider"></div>
                                <form action="/Pipeline/logout" method="post">
		 <button class="dropdown-item" ><i class="fa fa-power-off m-r-5 m-l-5"></i>Logout</button>
	</form>
                              
                            </div>
                        </li>
                      
                    </ul>
                </div> 
            
            </nav>
           
        </header>
        
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <aside class="left-sidebar" data-sidebarbg="skin5">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav" class="p-t-30">
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="index.jsp" aria-expanded="false"><i class="mdi mdi-view-dashboard"></i><span class="hide-menu">Home</span></a></li>
<!--                         <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="charts.html" aria-expanded="false"><i class="mdi mdi-chart-bar"></i><span class="hide-menu">Charts</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="widgets.html" aria-expanded="false"><i class="mdi mdi-chart-bubble"></i><span class="hide-menu">Widgets</span></a></li>
                       <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="tables.html" aria-expanded="false"><i class="mdi mdi-border-inside"></i><span class="hide-menu">Tables</span></a></li>
                          <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="grid.html" aria-expanded="false"><i class="mdi mdi-blur-linear"></i><span class="hide-menu">Full Width</span></a></li>
      -->                  <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false" style="Display:none" id="p_data"><i class="mdi mdi-receipt"></i><span class="hide-menu">Process Data </span></a>
                            <ul aria-expanded="false" class="collapse  first-level">
                                <li class="sidebar-item"><a href="pipeline.jsp" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu"> Standard Pipeline </span></a></li>
                  			<li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-receipt"></i><span class="hide-menu">Customized Pipeline</span></a>
                                 <ul aria-expanded="false" class="collapse  first-level">
                  			<li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-receipt"></i><span class="hide-menu">Processing Stage 1</span></a>
                  			<ul aria-expanded="false" class="collapse  first-level">
                                <li class="sidebar-item"><a href="cztscience2event.jsp" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu"> cztscience2event </span></a></li>
                                <li class="sidebar-item"><a href="cztbunchclean.jsp" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu"> cztbunchclean </span></a></li>
                                <li class="sidebar-item"><a href="cztpha2energy.jsp" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu"> cztpha2energy </span></a></li>
                                
                                 </ul> </li> 
                                 <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-receipt"></i><span class="hide-menu">Processing Stage 2</span></a>
                  			<ul aria-expanded="false" class="collapse  first-level">
                                <li class="sidebar-item"><a href="cztigen.jsp" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu"> cztigen </span></a></li>
                                <li class="sidebar-item"><a href="cztgaas.jsp" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu"> cztigas </span></a></li>
                                <li class="sidebar-item"><a href="cztdatasel.jsp" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu"> cztdatasel </span></a></li>
                                <li class="sidebar-item"><a href="cztpixclean.jsp" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu"> cztpixclean </span></a></li>
                                <li class="sidebar-item"><a href="cztflagbadpix.jsp" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu"> cztflagbadpix </span></a></li>
                                <li class="sidebar-item"><a href="cztevtclean.jsp" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu"> cztevtclean </span></a></li>
                                 </ul> </li>
                                 <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-receipt"></i><span class="hide-menu">Processing Stage 3</span></a>
                  			<ul aria-expanded="false" class="collapse  first-level">
                                <li class="sidebar-item"><a href="cztdpigen.jsp" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu"> cztdpigen </span></a></li>
                                <li class="sidebar-item"><a href="cztimage.jsp" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu"> cztimage </span></a></li>
                                <li class="sidebar-item"><a href="cztbindata.jsp" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu"> cztbindata </span></a></li>
                                <li class="sidebar-item"><a href="cztrspigen.jsp" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu"> cztrspigen </span></a></li>
                                 </ul> 
                                 </li>
                                 </ul> 
                                 </li>    
                                  </ul>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="loadfiles.jsp" aria-expanded="false" style="Display:none" id="load_file"><i class="mdi mdi-view-dashboard"></i><span class="hide-menu">Load files</span></a></li>
<!--                         <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="pages-buttons.html" aria-expanded="false"><i class="mdi mdi-relative-scale"></i><span class="hide-menu">Buttons</span></a></li>
 -->                      <!--   <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-face"></i><span class="hide-menu">Icons </span></a>
                            <ul aria-expanded="false" class="collapse  first-level">
                                <li class="sidebar-item"><a href="icon-material.html" class="sidebar-link"><i class="mdi mdi-emoticon"></i><span class="hide-menu"> Material Icons </span></a></li>
                                <li class="sidebar-item"><a href="icon-fontawesome.html" class="sidebar-link"><i class="mdi mdi-emoticon-cool"></i><span class="hide-menu"> Font Awesome Icons </span></a></li>
                            </ul>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="pages-elements.html" aria-expanded="false"><i class="mdi mdi-pencil"></i><span class="hide-menu">Elements</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-move-resize-variant"></i><span class="hide-menu">Addons </span></a>
                            <ul aria-expanded="false" class="collapse  first-level">
                                <li class="sidebar-item"><a href="index2.html" class="sidebar-link"><i class="mdi mdi-view-dashboard"></i><span class="hide-menu"> Dashboard-2 </span></a></li>
                                <li class="sidebar-item"><a href="pages-gallery.html" class="sidebar-link"><i class="mdi mdi-multiplication-box"></i><span class="hide-menu"> Gallery </span></a></li>
                                <li class="sidebar-item"><a href="pages-calendar.html" class="sidebar-link"><i class="mdi mdi-calendar-check"></i><span class="hide-menu"> Calendar </span></a></li>
                                <li class="sidebar-item"><a href="pages-invoice.html" class="sidebar-link"><i class="mdi mdi-bulletin-board"></i><span class="hide-menu"> Invoice </span></a></li>
                                <li class="sidebar-item"><a href="pages-chat.html" class="sidebar-link"><i class="mdi mdi-message-outline"></i><span class="hide-menu"> Chat Option </span></a></li>
                            </ul>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-account-key"></i><span class="hide-menu">Authentication </span></a>
                            <ul aria-expanded="false" class="collapse  first-level">
                                <li class="sidebar-item"><a href="authentication-login.html" class="sidebar-link"><i class="mdi mdi-all-inclusive"></i><span class="hide-menu"> Login </span></a></li>
                                <li class="sidebar-item"><a href="authentication-register.html" class="sidebar-link"><i class="mdi mdi-all-inclusive"></i><span class="hide-menu"> Register </span></a></li>
                            </ul>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-alert"></i><span class="hide-menu">Errors </span></a>
                            <ul aria-expanded="false" class="collapse  first-level">
                                <li class="sidebar-item"><a href="error-403.html" class="sidebar-link"><i class="mdi mdi-alert-octagon"></i><span class="hide-menu"> Error 403 </span></a></li>
                                <li class="sidebar-item"><a href="error-404.html" class="sidebar-link"><i class="mdi mdi-alert-octagon"></i><span class="hide-menu"> Error 404 </span></a></li>
                                <li class="sidebar-item"><a href="error-405.html" class="sidebar-link"><i class="mdi mdi-alert-octagon"></i><span class="hide-menu"> Error 405 </span></a></li>
                                <li class="sidebar-item"><a href="error-500.html" class="sidebar-link"><i class="mdi mdi-alert-octagon"></i><span class="hide-menu"> Error 500 </span></a></li>
                            </ul>
                        </li> -->
                    </ul>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
             <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h3 class="page-title">Astrosat CZTI Pipeline Portal</h3>                     
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                             <!--  <div class="row"> -->
                        <!-- Tabs -->
                        <div class="card">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#home" role="tab"><span class="hidden-sm-up"></span> <span class="hidden-xs-down">Home</span></a> </li>
                                <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#profile" role="tab"><span class="hidden-sm-up"></span> <span class="hidden-xs-down">About Modules</span></a> </li>
                                <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#messages" role="tab"><span class="hidden-sm-up"></span> <span class="hidden-xs-down">FAQ</span></a> </li>
                                <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#contact" role="tab"><span class="hidden-sm-up"></span> <span class="hidden-xs-down">Contact Us</span></a> </li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content tabcontent-border">
                                <div class="tab-pane active" id="home" role="tabpanel">
                                    <div class="p-20">
                                    <center>
	                                     <!-- 			  <center> <h2>Welcome to the portal..!!</h2> -->
	                                       			<img src="../../assets/images/mainczti.png"  width="1550" height="300"></center>
	                                       			<br>
                                       <br>
                                    		
                                      

<p>
The software to process data from Level 1 to Level 2 contains user configurable elements. While a default configuration is run at the Payload Operation Centre (POC) to create the automated Level 2 standard data products, the user has the option to generate more customized products by using the same software with other configuration settings.comment. Usually, you just wish these sorts of comments would come to an end.multiple paragraphs and is full of waffle to pad out the comment..</p>

 
 <p>The  Cadmium  Zinc  Telluride  Imager  (CZTI)  on-board  ASTROSAT  is  a  Coded  Mask
Imaging camera working in the energy range 15 to 150 keV. The detector is an array of
a pixellated CZT detectors,  and the Coded Mask is composed of a collection of pseudo
noise Hadamard coded Uniformly Redundant Array (URA) patterns.  The instrument is
configured as four independent quadrants, each with 16 detector modules.  Each detector
module has 256 pixels.  There are collimator slats surrounding every detector module and
the Coded Aperture Mask is placed above the collimator. The instrument operates in event
mode, wherein the time, energy and pixel coordinates of each photon event is recorded in
the data.  There is a CsI Veto detector under the CZT modules.  If an event recorded in
the Veto occurs within a certain small time window of any CZT event, then the latter is
tagged with a Veto flag.  The instrument also contains Alpha-tagged calibration sources,
which generate 60 keV photons simultaneously with an Alpha particle.  CZT events that
fall within a defined time window of any alpha detection are marked with an Alpha tag
in the recorded data.
Although the CZTI could be configured to work in a variety of modes, in normal course
of operation data are acquired in only three of them.  Mode M0 (Normal Mode) would
contain the regular event mode data.  Mode SS (Secondary Spectral Mode) operates in
parallel with all other modes, and records, once every 100 seconds, accumulated spectral
and housekeeping information.  When the spacecraft passes through the South Atlantic
Anomaly, High Voltage in the CZT and Veto detectors are switched off, and data collected
in Mode M9 (SAA mode) wherein no events, but only housekeeping information is recorded
once every second. Data telemetered to ground are accumulated into separate files for these
different modes before delivery.</p>                 
                    </div>
                                </div>
                                <div class="tab-pane  p-20" id="profile" role="tabpanel">
                                    <div class="p-20">
                                    <h5 class="card-title">Overview of CZTI data and pipeline</h5>
<!--                                         <img src="../../assets/images/background/img4.jpg" class="img-fluid">
 -->                                        <p class="m-t-10">CZTI level-2 data reduction pipeline is organized into different modules for each specific
														    task.In work flow of the pipeline is shown.summarizes the tasks
															performed by various software modules.
															Data reduction for CZTI is performed in three stages.Each of these stages involves
														    execution of several tasks of the pipeline.</p>
                                    </div>
                                    <!-- stage 1 -->
                                    <h5 class="card-title">Processing Stage 1 :</h5>
                                    <div class="row">
                                    
                                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">cztscience2event</h5>
                                <p> This module reads the level 1 science data file and decodes the data packets into events.
									It creates an event file in FITS format with events for each quadrant in different exten-sions. 
									Each event is assigned a calibrated time stamp which is computed using the time
									calibration table.  Relevant housekeeping information present in headers and detector tem-perature
								    information present in modeSS data are also decoded and written to output files
									in tabular form.
								</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">cztbunchclean</h5>
                                <p>As CZTI is composed of pixellated detectors, each pixel acts as an independent X-ray
detector.  So one charged particle can produce events in many pixels of CZTI at the same
time.   We  call  these  multi-hit  events  as  ‘bunches’,  as  they  are  bunched  in  time.   Such
events need to be identified and removed from the event file.  This module of the level-2
pipeline identifies the bunched events and removes them.  It also keeps track of the dead
time caused by this.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">cztpha2energy</h5>
                                <p>Each X-ray photon incident on the CZT detector produces charge proportional to photon
energy, which is measured as a voltage, and through the Analog to Digital Converters it
is recorded as a Pulse Height Amplitude (PHA) channel value.  This software module uses
temperature dependent pixel wise calibration data to estimate the nominal energy of the
incident photon from the recorded PHA, and expresses it on a Pulse Invariant and Pixel
Invariant scale, called a PI channel value.</p>
                            </div>
                        </div>
                    </div>                     
                                </div>
                                 <!-- stage 2 -->
                                    <h5 class="card-title">Processing Stage 2 :</h5>
                                    <div class="row">
                                    
                                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">cztgtigen</h5>
                                <p>There are time intervals where the data is not present
due to SAA passage, data transmission loss etc.  Also there are intervals when the source is
occulted by the earth or the angular offset of the source has changed.  In order to generate
science  products  from  such  observations,  it  is  important  to  identify  such  intervals  and
ignore the data for that duration and to properly account for the data gaps.
This task produces GTI file for each quadrant of CZTI based on thresholds on various
parameters, as well as the GTI present in the event file.</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">cztgaas</h5>
                                <p>In order to find the position and orientation of the CZTI field of view one needs to utilize
the satellite aspect information and account for the alignment of the CZTI payload with
respect  to  the  satellite  reference  axes  which  is  recorded  in  the  telescope  definition  file.
This module computes the time dependent pointing direction of CZTI axes as well as the
average value.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">cztdatasel</h5>
                                <p>This  pipeline  module  filters  the  events  in  the  input  event  file  based  on  GTI  file.   As
each quadrant has an independent GTI, it is possible to filter each quadrant data by the
respective GTI or filter all quadrants with the common GTI. User input GTITYPE which
has two possible values quad or common, determines this.</p>
                            </div>
                        </div>
                    </div>
                      <div class="col-md-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">cztpixclean</h5>
                                <p>CZTI is composed of 64 detectors each having 256 pixels.  Some of these pixels can be noisy
during the observations.  In some cases, a few pixels are consistently noisy for substantial
duration  of  the  observation,  and  the  events  from  these  pixels  need  to  be  filtered  out.
Certain pixels and detectors are noisy for short durations and these pixels/detectors need
to  be  ignored  for  those  durations.   This  pipeline  module  filters  the  event  file  for  noisy
pixels/detectors.</p>
                            </div>
                        </div>
                    </div>
                     <div class="col-md-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">cztflagbadpix</h5>
                                <p>This module combines bad pixel information from multiple sources, if available.  It reads
a list of bad pixel files and writes out a single bad pixel file combining the information
from all of them.</p>
                            </div>
                        </div>
                    </div>
                     <div class="col-md-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">cztevtclean</h5>
                                <p>Events with simultaneous veto count or alpha particle detection are to be segregated from
the rest of the events which constitute science data.  Alpha tagged events have to be accu-
mulated for calibration purpose.  This module provides the functionality to select/reject
alpha and veto-tagged events in various combinations according to user-supplied choices.</p>
                            </div>
                        </div>
                    </div>
                                </div>
                                    <!-- stage 2 -->
                                    <h5 class="card-title">Processing Stage 3 :</h5>
                                    <div class="row">
                                    
                                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">cztdpigen</h5>
                                <p>The  Detector  Plane  Image  (DPI)  gives  the  shadow  of  the  coded  mask  recorded  on  the
CZT detector.  The pattern of total counts on each pixel gives a Detector Plane Histogram
(DPH), which is then corrected for difference in effective area of different pixels to yield
the DPI. This module bins the event data to generate DPH and DPI.</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">cztimage</h5>
                                <p>Cross-correlation of mask pattern with the DPI using Fourier technique produces a crude
image of the field.  This module generates image using DPI by FFT method.</p>
                            </div>
                        </div>
                    </div>                  
                      <div class="col-md-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">cztbindata</h5>
                                <p>Spectrum and light curves are generated by binning events in energy or time.  As CZTI
has a coded aperture mask, it is possible to generate background subtracted light curve
or spectrum by weighting events from each pixel with the maskweights derived from the
mask open fractions.  This module generates spectrum/light curve for the field or for a
given source direction by mask weighting or the total light curve and spectrum including
background.</p>
                            </div>
                        </div>
                    </div>
                     <div class="col-md-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">cztrspigen</h5>
                                <p>This module generates response matrix for CZTI spectrum.  Redistribution matrices for
groups of pixels are precomputed and weighted addition of these with the effective area is
employed to obtain multipixel response for CZTI.</p>
                            </div>
                        </div>
                    </div>
                                </div>
                                </div>
                                <div class="tab-pane p-20" id="messages" role="tabpanel">
                                    <div class="p-20">
                                    <h5 class="card-title">Frequently Asked Questions ?</h5>
                                 </div>
                                </div>
          <div class="tab-pane p-20" id="contact" role="tabpanel">
                                                                    <h5 class="card-title">Contact Us:</h5>
                                
                                    <div class="p-20">
                                       <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!-- <div class="jumbotron jumbotron-sm">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-lg-12">
                <h1 class="h1">
                    Contact us <small>Feel free to contact us</small></h1>
            </div>
        </div>
    </div>
</div> -->
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <div class="well well-sm">
                <form>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="name">
                                Name</label>
                            <input type="text" class="form-control" id="name" placeholder="Enter name" required="required" />
                        </div>
                        <div class="form-group">
                            <label for="email">
                                Email Address</label>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span>
                                </span>
                                <input type="email" class="form-control" id="email" placeholder="Enter email" required="required" /></div>
                        </div>
                        <div class="form-group">
                            <label for="subject">
                                Subject</label>
                            <!-- <select id="subject" name="subject" class="form-control" required="required">
                                <option value="na" selected="">Choose One:</option>
                                <option value="service">General Customer Service</option>
                                <option value="suggestions">Suggestions</option>
                                <option value="product">Product Support</option>
                            </select> -->
                                                            <input type="subject" class="form-control" id="email" placeholder="Subject" required="required" />
                            
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="name">
                                Message</label>
                            <textarea name="message" id="message" class="form-control" rows="9" cols="25" required="required"
                                placeholder="Message"></textarea>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <button type="submit" class="btn btn-primary pull-right" id="btnContactUs">
                            Send Message</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
        <div class="col-md-4">
            <form>
            <legend><span class="glyphicon glyphicon-globe"></span> Our office</legend>
            <address>
                <strong>IUCAA,ASTROSAT Science Support Cell.</strong><br>
                Post Bag 4 Ganeshkhind,<br>
                Savitribai Phule Pune University Campus
				Pune 411 007, India<br>
               <!--  <abbr title="Phone">
                    P:</abbr> -->
                
            </address>
            <address>
                <strong>Please send your queries to</strong><br>
                <a href="mailto:#">astrosathelp@iucaa.in</a>
            </address>
            </form>
        </div>
    </div>
</div>
                                       
                              </div>
                                </div>
                        
                            </div>
                            
                        </div>
                        
                  <!--   </div> -->
                    
                </div>
                <!-- ============================================================== -->
                <!-- Recent comment and chats -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center" style="background:#D3D3D3"style="color: #FFF">
                All Rights Reserved by Astrosat. Designed and Developed by <a href="https://iucaa.com">IUCAA CZTI</a>.
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    
    
                                       			<div id="id01" class="modal" style="background: rgba(128,128,128,0.8);">
                                                  <div class="login-page">
  <div class="form" style="background: lightgray">
   <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal" >&times;</span>
    <form id="formaccount1" class="register-form" method="post" action="/Pipeline/Main">
     <h4>Register </h4>
     <div class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input type="text" class="form-control" name="name" placeholder="name"/>
      </div>
      <br>
      <div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock"></i></span>
      <input type="password" class="form-control" name="pass" placeholder="password"/>
      </div>
      </br>
      <div class="input-group">
						<span class="input-group-addon"><i class="fa fa-envelope"></i></span>
      <input type="email" class="form-control" name="email" placeholder="email address"/>
      </div>
      </br>
      <input type="submit" value="register" class="btn btn-success" style="background-color: green;">
      <!-- <button>create</button> -->
      <p class="si">Already registered? <a id="signin" href="#">Sign In</a></p>
    </form>
    <form id="formaccount2"  class="login-form" method="post" action="/Pipeline/login">
    <h4>Sign In </h4>
<div class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                         <input type="text" name="uname"  class="form-control" placeholder="username"/>
                                         </div>
                                         </br>
   <div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock"></i></span>
      <input type="password" class="form-control" name="pwd" placeholder="password"/>
      </div>
      </br>
      <input type="submit" value="login" class="btn btn-success" style="background-color: green;">
 <!--      <button>login</button> -->
      <p class="si">Not registered? <a id="createaccount" href="#">Create an account</a></p>
    </form>
  </div>
</div>

</div>
    
   <!--  <script src="../../assets/libs/jquery/dist/jquery.min.js"></script> -->
    Bootstrap tether Core JavaScript
    <script src="../../assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <!-- <script src="../../assets/libs/bootstrap/dist/js/bootstrap.min.js"></script> -->
    <script src="../../assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../assets/extra-libs/sparkline/sparkline.js"></script>
    Wave Effects
    <script src="../../dist/js/waves.js"></script>
    Menu sidebar
    <script src="../../dist/js/sidebarmenu.js"></script>
    Custom JavaScript
    <script src="../../dist/js/custom.min.js"></script>
    This page JavaScript
    <script src="../../dist/js/pages/dashboards/dashboard1.js"></script>
    Charts js Files
    <script src="../../assets/libs/flot/excanvas.js"></script>
    <script src="../../assets/libs/flot/jquery.flot.js"></script>
    <script src="../../assets/libs/flot/jquery.flot.pie.js"></script>
    <script src="../../assets/libs/flot/jquery.flot.time.js"></script>
    <script src="../../assets/libs/flot/jquery.flot.stack.js"></script>
    <script src="../../assets/libs/flot/jquery.flot.crosshair.js"></script>
    <script src="../../assets/libs/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
    <script src="../../dist/js/pages/chart/chart-page-init.js"></script>

</body>

</html>
