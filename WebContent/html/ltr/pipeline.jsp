<%@page import="java.nio.file.Path"%>
<%@page import="java.nio.file.LinkOption"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    

     <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> 
    <!-- harshad add  -->
    <!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script> -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
 
<!--     <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
 --><!--  <script src="../../dist/js/pipelinemodules/cztflagbadpix.js"></script>-->

</head>
<style>
#myProgress {
  width: 100%;
  background-color: #ddd;
}

#myBar {
  width: 1%;
  height: 30px;
  background-color: #4CAF50;
}
</style>

<script>
function progressFunc() {
	alert('in progress bar function***************');
	
	
	//$('#myProgress').style.display = "block";
	
	document.getElementById("myProgress").style.display = "";
	
	var elem = document.getElementById("myBar");   
	  var width = 1;
	  var id = setInterval(frame, 1000);
	  function frame() {
	    if (width >= 100) {
	      clearInterval(id);
	    } else {
	      width++; 
	      elem.style.width = width + '%'; 
	    }
	  }
	
	
	
   // var pleaseWait = $('#pleaseWaitDialog'); 
   // pleaseWait.modal('show');
    
    /* 
    showPleaseWait = function() {
        
    };
        
    hidePleaseWait = function () {
        pleaseWait.modal('hide');
    };
    
    showPleaseWait(); */
    
    
    
    //$('#pleaseWaitDialog').show(); 
}
</script>

 <script>

 function evtfile(){
	
	  alert("in evtfile")
	  //var level2path=document.getElementById("level2path").value;
	   var start=document.getElementById("start").value;
var end=document.getElementById("end").value;
var ra=document.getElementById("ra").value;
var dec=document.getElementById("dec").value;

 var x = document.getElementById("mySelect").selectedIndex;
 var history=(document.getElementsByTagName("option")[x].value);
 alert(history);
 var y = document.getElementById("mySelect1").selectedIndex;
 var write=(document.getElementsByTagName("option")[y].value);
 alert(write); 
 var d = new Date();
 d.setTime(d.getTime() + (2*24*60*60*1000));
 var expires = "expires="+ d.toUTCString();
	    //document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";

	//alert(expires);
	 //document.cookie = "level2path="+ level2path+ ";" + expires + ";path=/";
	 document.cookie = "start="+start+";" + expires + ";path=/";
	 document.cookie = "end="+end+";" + expires + ";path=/";
	 document.cookie = "ra="+ra+";" + expires + ";path=/";
	 document.cookie = "dec="+dec+";" + expires + ";path=/";
	 document.cookie = "history="+history+";" + expires + ";path=/";
	 document.cookie = "write="+write+";" + expires + ";path=/";

	 document.form1.submit();

	 }
 
function validation()
{
	//progressFunc();
	 var submit="submit...!";
	
	 alert("inside validation")
/*v ar level1path=document.getElementById("level1path").value;
var level2path=document.getElementById("level2path").value;
var start=document.getElementById("start").value;
var end=document.getElementById("end").value;
var ra=document.getElementById("ra").value;
var dec=document.getElementById("dec").value;

 var x = document.getElementById("mySelect").selectedIndex;
 var history=(document.getElementsByTagName("option")[x].value);
 alert(history);
 var y = document.getElementById("mySelect1").selectedIndex;
 var write=(document.getElementsByTagName("option")[y].value);
 alert(write);
 if(document.getElementById("history").checked)
	{
var values=document.getElementById('history').value;
alert(values);
	}else if(document.getElementById("history1").checked)
	{
		var values=document.getElementById('history1').value;
		alert(values);
			} 

var url="/Pipeline/pipeline?&level1path="+level1path+"&level2path="+level2path+"&start="+start+"&end="+end+"&ra="+ra+"&dec="+dec+"&history="+history+"&write="+write; 
 */
 var url="/Pipeline/pipeline?&submit="+submit; 
   
   alert(url);
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
//var timeout = setInterval(display, 10000);
function display()
{
	//alert("state===="+req.readyState);
	//var msg1="<%=(String)request.getSession(false).getAttribute("status")%>";
	 //alert("msg1"+msg1);
	alert("state===="+req.status);
	
	<%-- <%
	
		File checkStatus222 = new File("/home/assc/filecheck/status2222");
	
		if(checkStatus222.exists()){
		BufferedReader bfr = new BufferedReader(new FileReader("/home/assc/filecheck/status2222"));
		if(bfr != null ){
			System.out.println(bfr.readLine());
			System.out.println("**************************************************************");
		}
	}
		
	
		
	%> --%>
	
	
	
    //if (req.readyState == 4 && req.status == 200)
   // {
    	//alert("Pipeline Status:") ; 
    	
 
    	
    	//var xml = req.response;
    	//alert(xml);
       
        //var divid = document.getElementById("download");
        //var xml = req.response;  
        //alert(xml)
        //var responseNode = xml.getElementsByTagName("response")[0];
        //iles = responseNode.getElementsByTagName("files")[0]; 
        //alert(files);
      //  var filecount = responseNode.getElementsByTagName("filecount")[0].childNodes[0].nodeValue;    
        //alert(filecount);
        /* var i=0;
        for(i=0;i<filecount;i++)
        	{
        	if(i==(filecount-2))
        		{ */
        		//filecount = responseNode.getElementsByTagName("filecount")[0].childNodes[0].nodeValue;
        //filepath = responseNode.getElementsByTagName("filepath")[0].childNodes[0].nodeValue;
        		
       // $('#loading2').hide();
                
        //alert("Pipeline Status:"+filepath) ;  
        //$('#link').show();
        //divid.innerHTML=filepath;
        //alert(filepath);
        
        /* 	}
        	} */
        
//}
   
}
function FileDetails() {

    // GET THE FILE INPUT.
    var fi = document.getElementById('file');
    
    if (fi.files.length > 0) {
        // RUN A LOOP TO CHECK EACH SELECTED FILE.
        for (var i = 0; i <= fi.files.length - 1; i++) {

            var fname = fi.files.item(i).webkitRelativePath;
            //alert(fname);
            
        }
    }

    //alert(fi);
}
</script>
<script>
 function poll() {
    setTimeout(function () {
        $.ajax({
            type: 'POST',
            url: 'http://localhost:8080/Pipeline/pipeline',
            success: function (data) {
            
               alert("inside ajax"+data); //DatO ANY PROCESS HERE
               //document.getElementById("testid").value=data;
               //document.write(data)
            },
            complete: poll
        });
    }, 15000);
} 
function processModule()
{
	poll()
	alert("inside processModule");
	/* setTimeout(function () {
        $.ajax({
            type: 'POST',
            url: 'http://localhost:8080/Pipeline/html/ltr/pipeline.jsp',
            success: function (data) {
               alert(data); //DatO ANY PROCESS HERE
               //document.getElementById("testid").value=data;
               //document.write(data)
            },
            complete: poll
        });
    }, 5000); */
	var msg=null;

	 var msg="<%=(String)request.getSession().getAttribute("userId")%>";
	// alert(msg)
	 //alert("in page refresh");
      
	 if (msg == "pipeline.jsp")
	 {
		
		 validation();
	 }
	 
	
	
	 /*document.getElementById("sciencefile").value="";
	document.getElementById("tctfile").value="";
	document.getElementById("eventfile").value="";
	document.getElementById("headerfile").value="";
	document.getElementById("bunchfile").value=""; */
	

}
function pageRefresh()
{
	document.getElementById("level1path").value="";
	document.getElementById("level2path").value="";
	document.getElementById("start").value="";
	document.getElementById("end").value="";
	document.getElementById("ra").value="";
	document.getElementById("dec").value="";
}
</script> 

<body onload="processModule()">
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
   
    <div id="main-wrapper">

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
                         <img src="../../assets/images/astrosat.png" class="img-fluid" width="1400" style="margin-top:20px";>
                           
                        </b>

                    </a>

                    <a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i class="ti-more"></i></a>
                </div>
                
            </nav>
        </header>

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
      -->                  <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-receipt"></i><span class="hide-menu">Process Data </span></a>
                            <ul aria-expanded="false" class="collapse  first-level">
                                <li class="sidebar-item"><a href="pipeline.jsp	" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu"> Standard Pipeline </span></a></li>
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
                                 </ul> </li>             </ul>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="loadfiles.jsp" aria-expanded="false"><i class="mdi mdi-view-dashboard"></i><span class="hide-menu">Load files</span></a></li>

                    </ul>
                </nav>
            </div>
        </aside>

        <div class="page-wrapper">

            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">Complete Processing-CZTPIPELINE </h4>
                        <div class="ml-auto text-right">
                            
                        </div>
                    </div>
                </div>
            </div>

            <div class="container-fluid">

                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                           <form class="form-horizontal" name="form1" action="/Pipeline/html/ltr/uplod.jsp" method="post" enctype="multipart/form-data">
 			<div class="card-body">
 			
			<div class="form-group row">
  			<label for="fname" class="col-sm-3 text-right control-label col-form-label">Level 1 directory path</label>
            <div class="col-sm-9">
    		
    		<input type="text" id="level1path" class="form-control" placeholder="level1 directory path">
    		<!-- <input type="file" id="filepicker" name="fileList" size="500" onchange="document.getElementById('level1path').value = this.value"/> -->
    		<input type="file" name="fileInput" id="file"  multiple="multiple"/>  
    		<% session.setMaxInactiveInterval(15*60);
    		session.setAttribute("userId", "pipeline.jsp");%>
    		</div>
    		</div>
            
			<!-- <div class="form-group row">
			<label for="lname" class="col-sm-3 text-right control-label col-form-label">Path create level 2</label>
            <div class="col-sm-9">
    		<input type="text"  id="level2path" class="form-control" placeholder="level2 create file path">

    		 <input type="hidden" name="uname" value="hiddenValue">
			</div>
			</div> -->

			<div class="form-group row">
			<label for="fname" class="col-sm-3 text-right control-label col-form-label">Enter start stage</label>
            <div class="col-sm-9">
    		<input type="number" id="start" class="form-control" placeholder="1 or 3" min="1" max="3">
    		</div>
			</div>
				<div class="form-group row">
			<label for="fname" class="col-sm-3 text-right control-label col-form-label">Enter end stage</label>
            <div class="col-sm-9">
    		<input type="number" id="end" class="form-control" placeholder="1 or 3" min="1" max="3">
    		</div>
			</div>
				<div class="form-group row">
			<label for="fname" class="col-sm-3 text-right control-label col-form-label">Enter RA of source</label>
            <div class="col-sm-9">
    		<input type="text" id="ra" class="form-control" placeholder="RA" >
    		</div>
			</div>
				<div class="form-group row">
			<label for="fname" class="col-sm-3 text-right control-label col-form-label">Enter DEC od source</label>
            <div class="col-sm-9">
    		<input type="text" id="dec" class="form-control" placeholder="DEC" >
    		</div>
			</div>
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
						<!-- <div class="form-group row">
						<label for="fname" class="col-sm-3 text-right control-label col-form-label">Save History?</label>
						<div class="col-sm-9">
								Yes:<input type ="radio"  id ="history" value="YES"> <br>
								No:<input type ="radio" id="history1" value="NO"> <br>	
								</div>
								</div>		 -->								

		<div class="border-top">
         <div class="card-body">
         <div  id="loading2" style="display:none;" align="center"><img src="../../assets/images/loading.gif" alt=""/>Loading!</div>
         
		<input type="submit" value="submit" class="btn btn-success" onClick="evtfile()">
		  <button type="submit"  value="Reset" class="btn btn-primary" onClick="window.location.reload()">Reset</button>
		  <a id="link" style="display:none;"href="<%=request.getContextPath()%>/download"><u>Download Output Files</u></a>
		  
<!-- <div id="myProgress" style = "display:none">
  <div id="myBar">10%</div>
</div> -->



		</div>
         </div>
         
         
	</div>	

</form>
<div align="center" id="download"></div> 
                        </div>
                     
                
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            </div>
            </div>
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
<!--     <script>
    document.getElementById("filepicker").addEventListener("change", function(event) {
    	  let output = document.getElementById("listing");
    	  let files = event.target.files;

    	  for (let i=0; i<files.length; i++) {
    	    let item = document.createElement("li");
    	    item.innerHTML = files[i].webkitRelativePath;
    	    output.appendChild(item);
    	  };
    	}, false);
    </script> -->
</body>

</html>
