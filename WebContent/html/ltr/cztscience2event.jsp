<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
 <%@ page import="upload.UploadDetail"%>
 <%@page import="java.util.ArrayList" %>
 <%@ page import="java.text.SimpleDateFormat"%>
 <%@ page import="org.apache.commons.io.FileUtils" %>
<bean:write name="names" property="names"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html dir="ltr" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--     <meta http-equiv="X-UA-Compatible" content="IE=edge">
 -->    <!-- Tell the browser to be responsive to screen width -->
   <!--  <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content=""> -->
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
    <title>Pipeline</title>

    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="../../assets/libs/select2/dist/css/select2.min.css">
    <link rel="stylesheet" type="text/css" href="../../assets/libs/jquery-minicolors/jquery.minicolors.css">
    <link rel="stylesheet" type="text/css" href="../../assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" type="text/css" href="../../assets/libs/quill/dist/quill.snow.css">
    <link href="../../dist/css/style.min.css" rel="stylesheet">
    
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
   
    <!-- harshad add  -->
    <!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script> -->
<!--     <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://smtpjs.com/v2/smtp.js"></script> -->

<!--     <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
 --><!--  <script src="../../dist/js/pipelinemodules/cztflagbadpix.js"></script>-->
<style>
table.c {
  table-layout: auto;
  width: 100%;  
}
</style>
</head>
 <script>
 //var serverClicked = "false";
 //var localClicked = "false";

//window.localStorage.setItem('serverClicked', false);

window.localStorage.setItem('localClick', false);

 $( document ).ready(function() {
 	/* document.getElementById("id01").style.display = "none"; */
 	$('#browse').click( function () {
 	    $('#file').click();
 	}); 
 	
 	
 	$('#butM').click( function () {
 		   $.ajax( {
 			   
 		      url: "<%=request.getContextPath()%>/Showdata",                 // URL of Servlet
 		      data: { q: "submit" },     // parameters to Servlet
 		      dataType: 'text',            // type of data to expect back

 		      success: function ( data ) {
 		    	  //alert("success")
 		    	  //alert(data)
 		   
 		    	  var res = data.split(" ");
 		    	 // alert(res.length);
 		    	  fi=[];
 		    	  var myTableDiv = document.getElementById("demo");
 		    	  myTableDiv.innerHTML = "";
 		    	  var table = document.createElement('TABLE');
 		    	  table.border='0';
 				var tableBody = document.createElement('TBODY');
 		    	 table.appendChild(tableBody);
 		    	  for (var i=1; i<res.length; i++){
 		    	  var tr = document.createElement('TR');
 		    	  tableBody.appendChild(tr);
 		    	  //for (var j=0; j<4; j++){
 		    	  var td = document.createElement('TD');
 		    	  //td.width='75';
 		    	  td.innerHTML='<input type="checkbox" name="chkSingle" value="'+res[i]+'"/>'+" "+res[i];
 		    	  tr.appendChild(td);
 		             
 		    	  }
 		    	  myTableDiv.appendChild(table);  //$('#tb3').val( data.course );
 		      }
 		   } );
 		} );
 <%-- 	var msg2=null;
 	msg2="<%=(String)request.getSession().getAttribute("names1")%>"
 	
 	if (msg2 != null && msg2 != "" && msg2 !='null')
 	{
 alert(msg2);
 	} --%>
 	
 	var msg1=null;

 	 var msg1="<%=(String)request.getSession().getAttribute("uname")%>";
 	// alert(msg)
 	 //alert("in page refresh");
      
 	 <%-- if (msg == "pipeline.jsp")
 	 {
 		
 		 validation();
 	 }
 	var msg="<%=request.getAttribute("uname")%>"; --%>

 	
 	if (msg1 != null && msg1 != "" && msg1 !='null')
 	{
 	
 		 document.getElementById("p_data").style.display="block";
 		 document.getElementById("load_file").style.display="block";
 	}
 	<%-- var msg=null;

 	 var msg="<%=(String)request.getSession().getAttribute("names")%>";
 	// alert(msg)
 	 //alert("in page refresh");
     
 	 if (msg == "pipeline.jsp")
 	 {
 		
 		 validation();
 	 }
 	var msg="<%=request.getAttribute("uname")%>";

 	
 	if (msg != null && msg != "" && msg !='null')
 	{
 alert(msg);
 	} --%>
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

 
 function evtfile(){
  //alert("in evtfile")
 var sciencefile=document.getElementById("sciencefile").value;

var tctfile=document.getElementById("tctfile").value;  
   var evt = document.getElementById("eventfile").value;
   
   var headerfile=document.getElementById("headerfile").value;
   var bunchfile=document.getElementById("bunchfile").value;
   
   if  (sciencefile==null || sciencefile=="",tctfile==null || tctfile=="",evt==null || evt=="",headerfile==null || headerfile=="",bunchfile==null || bunchfile=="")
	 {
	   
	   if (sciencefile==null || sciencefile=="")
	   {
	   	document.getElementById("1").classList.toggle("has-error");

	       
	   }
	   if (tctfile==null || tctfile=="")
	   {
	   	document.getElementById("2").classList.toggle("has-error");

	       
	   }
  if (evt==null || evt=="")
  {
  	document.getElementById("3").classList.toggle("has-error");

      
  }
  if (headerfile==null || headerfile=="")
  {
  	document.getElementById("4").classList.toggle("has-error");

      
  }
  if (bunchfile==null || bunchfile=="")
  {
  	document.getElementById("5").classList.toggle("has-error");

      
  }
   
  return false
}
  else{
    
	  
	  document.getElementById("1").classList.toggle("has-success");
  	document.getElementById("2").classList.toggle("has-success");
  	document.getElementById("3").classList.toggle("has-success");
  	document.getElementById("4").classList.toggle("has-success");
  	document.getElementById("5").classList.toggle("has-success");

    var x = document.getElementById("mySelect").selectedIndex;
    var history=(document.getElementsByTagName("option")[x].value);
    //alert(history);
    var y = document.getElementById("mySelect1").selectedIndex;
    var write=(document.getElementsByTagName("option")[y].value); 
   
    var d = new Date();
    d.setTime(d.getTime() + (2*24*60*60*1000));
    var expires = "expires="+ d.toUTCString();
    //document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";

//alert(expires);
 document.cookie = "evt123="+ evt+ ";" + expires + ";path=/";
 document.cookie = "headerfile="+headerfile+";" + expires + ";path=/";
 document.cookie = "bunchfile="+bunchfile+";" + expires + ";path=/";
 document.cookie = "history="+history+";" + expires + ";path=/";
 document.cookie = "write="+write+";" + expires + ";path=/";

 //document.form1.submit();
 alert("inside eventfile "+localClicked)
 if(localClicked == "true")
	{
	 
	 document.form1.submit();
	
	}else
		{
		   validation();
		}
 
		}

 	
 }

 
 function serverFileOpen(checkboxName)
 {
	 window.localStorage.setItem('localClick', false);
	 //document.getElementById("close").disabled = false;
	 
	  //window.serverClicked = "true";
	  //alert("--------------yse----------------",window.serverClicked);
	 var checkboxes = document.getElementsByName(checkboxName);
     var selected = [];
     var flag=0;
     for (var i=0; i<checkboxes.length; i++) 
     {
         if (checkboxes[i].checked) 
         {
              fname=checkboxes[i].value;
              
              if ((fname.indexOf("level1.fits") !== -1   ) || (fname.indexOf("level1.tct") !== -1))
            	  {
            	  

              				if(fname.indexOf("level1.fits") !== -1  )
         	 					{
         	 									
         	 						document.getElementById("sciencefile").value=fname;
         	 							}
              
         		 				if(fname.indexOf("level1.tct") !== -1)
     					 		{
         	 						
         	 					document.getElementById("tctfile").value=fname;
     	 										}
                  }
              	else
            	  {
              		 flag=1;
            	  }
     		}
	}
     if (flag == 1)
     {
    	 alert("Plese Select Specified file");
     }
    // alert("Plese Select Specified file");
     //$('#myModal1').modal('hide');
     
     
	  //document.getElementById("demo").innerHTML = x;
 }
 function FileDetails() {
    
	 //window.localClicked = "true";
	 window.localStorage.setItem('localClick', true);
     // GET THE FILE INPUT.
     var fi = document.getElementById('file');

     // VALIDATE OR CHECK IF ANY FILE IS SELECTED.
     if (fi.files.length > 0) {
         // RUN A LOOP TO CHECK EACH SELECTED FILE.
         for (var i = 0; i <= fi.files.length - 1; i++) {

             var fname = fi.files.item(i).name;      // THE NAME OF THE FILE.
             if(fname.indexOf("level1.fits") !== -1)
            	 {
            	 document.getElementById("sciencefile").value=fname;
            	 }
             if(fname.indexOf("level1.tct") !== -1)
        	 {
            	 document.getElementById("tctfile").value=fname;
        	 }
         }
     }
     else { 
         alert('Please select a file.');
     }
 }



function validation()
{
	 //alert("--------------not----------------",localClicked)
	//alert("in validation");
  $('#loading2').show();
 /* var sciencefile=document.getElementById("sciencefile").value;
alert(sciencefile);
var tctfile=document.getElementById("tctfile").value;  */
//var submit="submit...!";
	//document.getElementById("eventfile").value;
//alert(""+eventfile);
/*var headerfile=document.getElementById("headerfile").value;
var bunchfile=document.getElementById("bunchfile").value;
//var numbuffer=document.getElementById("numbuffer").value;

 var x = document.getElementById("mySelect").selectedIndex;
 var history=(document.getElementsByTagName("option")[x].value);
 //alert(history);
 var y = document.getElementById("mySelect1").selectedIndex;
 var write=(document.getElementsByTagName("option")[y].value); */
// alert(write);
/* if(document.getElementById("history").checked)
	{
var values=document.getElementById('history').value;
alert(values);
	}else if(document.getElementById("history1").checked)
	{
		var values=document.getElementById('history1').value;
		alert(values);
			} 

alert(sciencefile);*/

//var msg=null;
<%-- 
 //var msg="<%=(String)request.getSession().getAttribute("userId")%>";
 //alert(msg) --%>
 //alert("state===="+req.readyState);
//alert("state===="+req.status);
 //alert("in page refresh");
 //if (req.readyState == 4 && req.status == 200)
   // {
     //      alert("inside***************")
    //}
  
/*  if (msg == "cztscience2event.jsp")
 {
var url="/Pipeline/cztscience?&submit="+submit; 
//var checkajaxstatus=false;
 } */
 var localClicked = "<%=(String) request.getSession().getAttribute("localClicked")%>"; 
 
 alert("inside validation");
 var url="/Pipeline/cztscience?&localClicked="+localClicked; 
   //alert(url);
    if (window.XMLHttpRequest)
    {
        req = new XMLHttpRequest();
        try
        {
            req.onreadystatechange = display;
            req.open("GET", url, true);
        } catch (e)
        {
            alert(e);
        }
        req.send(null);
    } else if (window.ActiveXObject)
    {
        req = new ActiveXObject("Microsoft.XMLHTTP");
        if (req)
        {
            req.onreadystatechange = display;
            req.open("GET", url, true);
            req.send();
        }
    }
}
function display()
{
	
	
	  if (req.readyState == 4 && req.status == 200)
	    {
	       
	        var divid = document.getElementById("download");
	        var xml = req.responseXML;  
	        var file=[];
	        //var res = xml
	        document.getElementById("Button").disabled = false;
	        var responseNode = xml.getElementsByTagName("response")[0];
	        files = responseNode.getElementsByTagName("files")[0]; 
	        var filecount = responseNode.getElementsByTagName("filecount")[0].childNodes[0].nodeValue;  
	        for(var i=0;i<filecount;i++)
	    	{
	        	var flag=0;
	        filepath = responseNode.getElementsByTagName("filepath")[i].childNodes[0].nodeValue;
	        
	      
	        file[i]=filepath.replace("[", "<br>[");
	        if(file[i].indexOf("***Error") !== -1)
	        	{
	        	  flag=1;
	        	  var err=file[i];
	        	}
	        
	        //alert("hhheee"+file[i])
	    	}
	       
	        //	alert("Pipeline Status:"+filepath) ;  
	       	alert(flag)
	      	 //divid.innerHTML=filepath;
	        
	        document.querySelector('#text2').innerHTML=file;
	        $('#loading2').hide();
	        //alert(file);
	        if (flag == 0)
	        	{
	        $('#link').show();
	        window.localStorage.setItem('localClick', false);
	        <%session.removeAttribute("localClicked");%>
	        alert("CZTSCIENCE2EVENT COMPLETED SUCCESSFULLY");
	        	}
	        else
	        	{
	        	alert(err);
	        	}

	        
	}
	
	
/* 	alert("state====display"+req.readyState);
	alert("state====display"+req.status);
	//var link = document.getElementById("link");
    if (req.readyState == 4 && req.status == 200)
    {
    	checkajaxstatus=true;
        var divid = document.getElementById("download");
        var xml = req.response;     
       alert(xml);
        var responseNode = xml.getElementsByTagName("response")[0];
        files = responseNode.getElementsByTagName("files")[0]; 
      //  var filecount = responseNode.getElementsByTagName("filecount")[0].childNodes[0].nodeValue;    
        //alert(filecount);
        /* var i=0;
        for(i=0;i<filecount;i++)
        	{
        	if(i==(filecount-2))
        		{ */
        		
                //document.getElementById("content").style.display = "block";
        		
        			/* $(window).load(function() {
        				// Animate loader off screen
        				$(".se-pre-con").fadeOut("slow");;
        			}); 
       // document.getElementById("loading").style.display = "none";  
        filepath = responseNode.getElementsByTagName("filepath")[0].childNodes[0].nodeValue;
        $('#loading2').hide();
        
       	alert("Pipeline Status:"+filepath) ;  
       	$('#link').show();
       	//link.style.visibility="visible";
        divid.innerHTML=filepath;
        //divid.style.display = "block";
        //alert(filepath);
        
        /* 	}
        	} 
        	
        
} */
    
}

function processModule()
{
	//var msg=null;
	
	
	
	//alert("pageload")
	document.getElementById("Button").disabled = true;
	//document.getElementById("close").disabled = true;
	var msg=null;

	 var msg='<%=(String)request.getSession().getAttribute("userId")%>';
	 //alert(msg)
	 //alert("in page refresh");
      
	 //if (msg == "File Successfully Uploaded...!-4")
	if (msg == "cztscience2event.jsp")/* & (eventfile!=null || eventfile!="",bunchfile!=null || bunchfile!="",outputfile!=null || outputfile!="",livetimefile!=null || livetimefile!="",bdeftime!=null || bdeftime!="",threshold!=null || threshold!="",livetime!=null || livetime!="") */
	 {
		
		<%
		// Removing after display
		session.removeAttribute("userId");
		%>
		
		//alert(msg);
		
		 validation();
		 
	 }
       <%-- alert("pageload");
       alert("pageload")
   	document.getElementById("Button").disabled = true;
       
	 //var msg="<%=(String)request.getSession().getAttribute("userId")%>";
	 //alert(msg)
	 //alert("state===="+req.readyState);
	//alert("state===="+req.status);
	 //alert("in page refresh");
	 //if (req.readyState == 4 && req.status == 200)
	   // {
	     //      alert("inside***************")
	    //}
      
	 if (msg == "cztscience2event.jsp")
	 {
		
		 validation();
	 }
	  --%>
	
	
	 /*document.getElementById("sciencefile").value="";
	document.getElementById("tctfile").value="";
	document.getElementById("eventfile").value="";
	document.getElementById("headerfile").value="";
	document.getElementById("bunchfile").value=""; */
	

}


function clear()
{
	
	 document.getElementById("sciencefile").value="";
	document.getElementById("tctfile").value="";
	document.getElementById("eventfile").value="";
	document.getElementById("headerfile").value="";
	document.getElementById("bunchfile").value=""; 
}

</script> 

<body onload="processModule()">
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
                            <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                            <!-- Dark Logo icon -->
<!--                             <img src="../../assets/images/astrosat.png" alt="homepage" class="light-logo" width="230" height="85" style="padding-left:-10px"; />
 -->                           
                         <img src="../../assets/images/astrosat.png" class="img-fluid" width="1400" style="margin-top:20px";>
 
                        </b>
                        <!--End Logo icon -->
                         <!-- Logo text -->
                        <!-- <span class="logo-text">
                             dark Logo text
                             <img src="../../assets/images/logo-text.png" alt="homepage" class="light-logo" />
                            
                        </span> -->
                        <!-- Logo icon -->
                        <!-- <b class="logo-icon"> -->
                            <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                            <!-- Dark Logo icon -->
                            <!-- <img src="../../assets/images/logo-text.png" alt="homepage" class="light-logo" /> -->
                            
                        <!-- </b> -->
                        <!--End Logo icon -->
                    </a>
                    <!-- ============================================================== -->
                    <!-- End Logo -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- Toggle which is visible on mobile only -->
                    <!-- ============================================================== -->
                    <a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i class="ti-more"></i></a>
                </div>
                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                               
                    <ul class="navbar-nav float-right">
                       
                        <li class="nav-item dropdown">
                               <a   align="right" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="../../assets/images/users/login.jpg"  class="rounded-circle" width="31"></a>
                            <div class="dropdown-menu dropdown-menu-right user-dd animated">
                            
                            <!--   <button class="dropdown-item" onclick="document.getElementById('id01').style.display='block'"> <i class="ti-user m-r-5 m-l-5"></i> Login</button> -->
								
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
      -->                  <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false" id="p_data"><i class="mdi mdi-receipt"></i><span class="hide-menu">Process Data </span></a>
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
                                 </ul> </li>
                                 </ul> </li>         
                            </ul>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="loadfiles.jsp" aria-expanded="false" id="load_file"><i class="mdi mdi-view-dashboard"></i><span class="hide-menu">Load files</span></a></li>
                        
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
                        <h4 class="page-title">Module 1-CZTSCIENCE2EVENT </h4>
                        <div class="ml-auto text-right">                           
                        </div>
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
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <form class="form-horizontal" name="form1"  action="/Pipeline/html/ltr/uplod.jsp" method="post" enctype="multipart/form-data">
                                <div class="card-body">
                                   <!--  <h4 class="card-title">Personal Info</h4> -->
                                    <div class="form-group row">
                                        <label for="fname" class="col-sm-3 text-right control-label col-form-label">Level 1 science file</label>
                                        <div class="col-sm-9" id="1">                                          
								        <input type="text" class="form-control" id="sciencefile" placeholder="level1.fits" disable>
                                   </div>
                                    </div>                                   
                             
 			                  <% request.getSession().setAttribute("userId", "cztscience2event.jsp");%>
 	                			
                                     <div class="form-group row" >
                                        <label for="lname" class="col-sm-3 text-right control-label col-form-label">TCT file </label>
                                        <div class="col-sm-9" id="2">
                                            <input type="text" class="form-control" id="tctfile" placeholder="level1.tct" disable>
                                            <!-- <input type="file" name="fileInput" id="file"  onChange="FileDetails()" multiple="multiple"/>  -->
                                        </div>
                                    </div>
                                    
                             <div class="form-group row" ">
                                        <label for="fname" class="col-sm-3 text-right control-label col-form-label">Browse files</label>
                                        <div class="col-sm-9" >
                                        <table >
  
  														<tr>
    														<td>
    														<button type="button" id="browse" class="btn btn-primary browse"> <i class="fas fa-desktop"></i></button>
											<input  type='file' id="file" name="fileInput" onChange="FileDetails()" multiple="multiple"  style="display:none"/><br></td>
    																<td ><span style="font-weight:bold">OR</span>&nbsp;</td>
    															<td>  <button type="button"  id="butM" class="btn btn-primary" data-toggle="modal" data-target="#myModal1" ><i class="fas fa-server"></i></button> </td>
  																		</tr>
  																		</table>
                                            
                                            
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="lname" class="col-sm-3 text-right control-label col-form-label">Output event file</label>
                                        <div class="col-sm-9"  id="3">
                                            <input type="text" class="form-control" id="eventfile" placeholder="level2.fits">
                                        </div>
                                    </div>
                                    <div class="form-group row" >
                                        <label for="email1" class="col-sm-3 text-right control-label col-form-label">Output header file</label>
                                        <div class="col-sm-9" id="4">
                                            <input type="text" class="form-control" id="headerfile" placeholder="level2.hdr">
                                        </div>
                                    </div>
                                    <div class="form-group row" >
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label">Output bunch file</label>
                                        <div class="col-sm-9" id="5">
                                            <input type="text" class="form-control" id="bunchfile" placeholder="level2_bunch.fits">
                                        </div>
                                    </div>          
                                   <!--   <div class="form-group row">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label">Number of packets to be read in buffer</label>
                                        <div class="col-sm-9">
                                            <input type="number" class="form-control" id="numbuffer" placeholder="100000">
                                        </div>
                                    </div>  -->                       
                                                 <div class="form-group row">
									<label for="fname" class="col-sm-3 text-right control-label col-form-label">Save History?</label>
						            <div class="col-sm-9">
						                    <select id="mySelect">
						  <option value="YES">Yes</option>
						  <option value="NO">No</option>
						  </select>
												</div>	
												</div> 	
									<div class="form-group row">
									<label for="fname" class="col-sm-3 text-right control-label col-form-label">Overwrite files?</label>
						            <div class="col-sm-9">
						                    <select id="mySelect1">
						  <option value="YES">Yes</option>
						  <option value="NO">No</option>
						  </select>
												</div>	
												</div>
								
                                <div class="border-top">
                                    <div class="card-body">
                                    <div  id="loading2" style="display:none;" align="center"><img src="../../assets/images/loading.gif" alt=""/>Loading!</div>
<!--                                     <div  id="loading2" style="display:none;"><img src="../../assets/images/loading.gif" alt="" />Loading!</div>
                                 <div id="loading"></div> -->
      <input type="button" value="submit" class="btn btn-success" onClick="evtfile()">
     <%-- <input type="button" value="Download" class="btn btn-success"  onClick="<%=request.getContextPath()%>/download"> --%>
		  							<button type="button"  value="Reset" class="btn btn-primary" onClick="clear()">Reset</button>
		  							
		  							 <button type="button" id="Button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">View Log</button>
		  							<a id="link" style="display:none;"href="<%=request.getContextPath()%>/download1"><u>Download Output Files</u></a> 
                                 
                                 
<div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog modal-lg" >
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          
          <h4 class="modal-title" style="align:center;">Browse Files</h4>
        </div>
        <div class="modal-body" id="demo">
       
<%--    
			<%String homedir = System.getenv("HOME"); 
 	 File file = new File(homedir+"/level2files/");
	     File[] files = file.listFiles();
	     for(File f: files){
	    	 %>
	    	     var file1=document.getElementById("demo").innerHTML=<%=f %>;
	    	    
	    	     alert("=========="+file1);
	    	 <%
	    	out.println("--------------------------------------------files"+f);
 	 
	     } %> --%>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" >Close</button>
           <button type="button" id="close" class="btn btn-primary" onClick="serverFileOpen('chkSingle')" data-dismiss="modal">Open</button>
        </div>
      </div>
      
    </div>
  </div>
  
  
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg" >
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          
          <h4 class="modal-title" style="align:center;">Log</h4>
        </div>
        <div class="modal-body"  style="overflow-y: scroll; " id="text2" >
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" >Close</button>
        </div>
      </div>
      
    </div>
  </div>
  


		  							 
                                    </div>
                                </div>
                                </div>
                            </form>
                       <div align="center" id="download"></div> 
                            
                        </div>
                     
            </div>
            </div>
 <!--            <div id="id01" class="modal">
                                                  <div class="login-page">
  <div class="form">
   <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
    <form id="formaccount1" class="register-form" method="post" action="/Pipeline/Main">
      <input type="text"  name="name" placeholder="name"/>
      <input type="password" name="pass" placeholder="password"/>
      <input type="email" name="email" placeholder="email address"/>
      <input type="submit" value="register">
      <button>create</button>
      <p class="si">Already registered? <a id="signin" href="#">Sign In</a></p>
    </form>
    <form id="formaccount2"  class="login-form" method="post" action="/Pipeline/login">
<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user"></i></span>
                                         <input type="text" name="uname"  placeholder="username"/>
                                         </div>
                      
     <i class="glyphicon glyphicon-user"></i>
     <div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock"></i></span>
      <input type="password" name="pwd" placeholder="password"/>
      
      </div>
      <input type="submit" value="login">
      <button>login</button>
      <p class="si">Not registered? <a id="createaccount" href="#">Create an account</a></p>
    </form>
  </div>
</div>

</div> -->
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center">
                All Rights Reserved by Astrosat. Designed and Developed by <a href="https://iucaa.com">IUCAA CZTI</a>.
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
          <!-- <div class="modal fade" id="myModal" role="dialog">
                    <br><br><br><br><br>
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <p align="right"> <button type="button" class="btn btn-default" data-dismiss="modal">&times;</button></p>
                                 <div  class="modal-body" id="browse_div" >
                                    </div> 
                                        <div class="modal-footer">
                                        </div>
                                        </div> 
                                        </div>
                                        </div>
                                        </div>  -->
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
       <style>
    .modal-dialog {
    max-width: 95% !important;
}

    </style>
    <script src="../../assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="../../assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="../../assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="../../assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="../../dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="../../dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="../../dist/js/custom.min.js"></script>
    <!-- This Page JS -->
    <script src="../../assets/libs/inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
    <script src="../../dist/js/pages/mask/mask.init.js"></script>
    <script src="../../assets/libs/select2/dist/js/select2.full.min.js"></script>
    <script src="../../assets/libs/select2/dist/js/select2.min.js"></script>
    <script src="../../assets/libs/jquery-asColor/dist/jquery-asColor.min.js"></script>
    <script src="../../assets/libs/jquery-asGradient/dist/jquery-asGradient.js"></script>
    <script src="../../assets/libs/jquery-asColorPicker/dist/jquery-asColorPicker.min.js"></script>
    <script src="../../assets/libs/jquery-minicolors/jquery.minicolors.min.js"></script>
    <script src="../../assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script src="../../assets/libs/quill/dist/quill.min.js"></script>
    <script>
        //***********************************//
        // For select 2
        //***********************************//
        $(".select2").select2();

        /*colorpicker*/
        $('.demo').each(function() {
        //
        // Dear reader, it's actually very easy to initialize MiniColors. For example:
        //
        //  $(selector).minicolors();
        //
        // The way I've done it below is just for the demo, so don't get confused
        // by it. Also, data- attributes aren't supported at this time...they're
        // only used for this demo.
        //
        $(this).minicolors({
                control: $(this).attr('data-control') || 'hue',
                position: $(this).attr('data-position') || 'bottom left',

                change: function(value, opacity) {
                    if (!value) return;
                    if (opacity) value += ', ' + opacity;
                    if (typeof console === 'object') {
                        console.log(value);
                    }
                },
                theme: 'bootstrap'
            });

        });
        /*datwpicker*/
        jQuery('.mydatepicker').datepicker();
        jQuery('#datepicker-autoclose').datepicker({
            autoclose: true,
            todayHighlight: true
        });
        var quill = new Quill('#editor', {
            theme: 'snow'
        });

    </script>
</body>

</html>