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
    <!-- harshad add  -->
    <!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script> -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<!--     <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
 --><!--  <script src="../../dist/js/pipelinemodules/cztflagbadpix.js"></script>-->

</head>
<script>
 
 
 function evtfile(){
  //alert("in evtfile")
  var number_of_badpix=document.getElementById("number_of_badpix").value;
var output_badpix=document.getElementById("output_badpix").value;


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
 document.cookie = "number_of_badpix="+number_of_badpix+";" + expires + ";path=/";
 document.cookie = "output_badpix="+output_badpix+";" + expires + ";path=/";
 document.cookie = "history="+history+";" + expires + ";path=/";
 document.cookie = "write="+write+";" + expires + ";path=/";

 document.form1.submit();

 }
 </script>
  <script>
function add(type)
{
	var i;
	if (type < 21) {
	for (i = 0; i < type; i++) {
		var element = document.createElement("input");

		//Assign different attributes to the element.
		element.setAttribute("type", "text");
		//element.setAttribute("value", "text");
		var str = 'input_badpix_'+i;
		var str1 = 'level2_GTITYPE_badpix_'+i+'.fits';
		element.setAttribute("id", str);
		element.setAttribute("placeholder", str1);
		
		var foo = document.getElementById("fooBar");

		//Append the element in page (in span).
		foo.appendChild(element);
	  
	} 
	}
	
	}
</script>
 <script>
 function FileDetails() {

     // GET THE FILE INPUT.
     var fi = document.getElementById('file');

     // VALIDATE OR CHECK IF ANY FILE IS SELECTED.
     if (fi.files.length > 0) {
         // RUN A LOOP TO CHECK EACH SELECTED FILE.
         for (var i = 0; i <= fi.files.length - 1; i++) {
        	 var str = 'input_badpix_'+i;
        	 var str1 = 'level2_quad_badpix_'+i+'.fits';
        	 var str2 = 'level2_common_badpix_'+i+'.fits';

             var fname = fi.files.item(i).name;      // THE NAME OF THE FILE.
             if(fname.indexOf(str1) !== -1)
            	 {
            	 document.getElementById(str).value=fname;
            	 }
             else if(fname.indexOf(str2) !== -1)
        	 {
            	 document.getElementById(str).value=fname;
        	 }
         }
     }
     else { 
         alert('Please select a file.');
     }
 }


 </script>  
 <script>
function validation()
{
	$('#loading2').show();
	var submit="submit...!";
/* var number_of_badpix=document.getElementById("number_of_badpix").value;
var input_badpix=document.getElementById("input_badpix").value;
var output_badpix=document.getElementById("output_badpix").value;

 var x = document.getElementById("mySelect").selectedIndex;
 var history=(document.getElementsByTagName("option")[x].value);
 alert(history);
 var y = document.getElementById("mySelect1").selectedIndex;
 var write=(document.getElementsByTagName("option")[y].value);
 alert(write); */
/* if(document.getElementById("history").checked)
	{
var values=document.getElementById('history').value;
alert(values);
	}else if(document.getElementById("history1").checked)
	{
		var values=document.getElementById('history1').value;
		alert(values);
			} */

var url="/Pipeline/cztflagpic?&submit="+submit; 

   
   
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
function display()
{
	//alert("state===="+req.readyState);
	//alert("state===="+req.status);
    if (req.readyState == 4 && req.status == 200)
    {
       
        var divid = document.getElementById("download");
        var xml = req.responseXML;     
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
        filepath = responseNode.getElementsByTagName("filepath")[0].childNodes[0].nodeValue;
        		$('#loading2').hide();
                
               	alert("Pipeline Status:"+filepath) ;  
               	$('#link').show();
        divid.innerHTML=filepath;
        //alert(filepath);
        
        /* 	}
        	} */
        
}
   
}
function processModule()
{
	var msg=null;

	 var msg="<%=(String)request.getSession().getAttribute("msg")%>";
	 //alert(msg)
	 //alert("in page refresh");
      
	 if (msg == "File Successfully Uploaded for cztflagbadpix...!")
	 {
		
		 validation();
	 }
	 
	
	
	 /*document.getElementById("sciencefile").value="";
	document.getElementById("tctfile").value="";
	document.getElementById("eventfile").value="";
	document.getElementById("headerfile").value="";
	document.getElementById("bunchfile").value=""; */
	

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
                        <h4 class="page-title">Module 8-CZTFLAGBADPIX </h4>
                        <div class="ml-auto text-right">
                            
                        </div>
                    </div>
                </div>
            </div>

            <div class="container-fluid">

                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                           <form class="form-horizontal" name="form1"  action="/Pipeline/html/ltr/uplod.jsp" method="post" enctype="multipart/form-data">
 			<div class="card-body">
 			
			<div class="form-group row">
  			<label for="fname" class="col-sm-3 text-right control-label col-form-label">Number of badpixel file</label>
            <div class="col-sm-9" >
    		<input type="text" id="number_of_badpix" class="form-control" placeholder="1 to 20" onchange="add(this.value);">
    		
    		</div>
    		</div>

			<div class="form-group row">
			<label for="lname" class="col-sm-3 text-right control-label col-form-label">Input badpixel file</label>
            <div class="col-sm-9" id="fooBar">

    		 
    		</div>
			</div>
			<div class="form-group row">
			      <div class="col-sm-9" >
			<input type="file" name="fileInput" id="file"  onChange="FileDetails()" multiple="multiple"/>
	
			</div>
</div>
		<% request.getSession().setAttribute("userId", "cztflagbadpix.jsp");%>
			<div class="form-group row">
			
			<label for="fname" class="col-sm-3 text-right control-label col-form-label">Output badpixel file</label>
            <div class="col-sm-9">
            
    		<input type="text" id="output_badpix" class="form-control" placeholder="level2_GTITYPE_badpix.fits_">
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
<!--                                     <div  id="loading2" style="display:none;"><img src="../../assets/images/loading.gif" alt="" />Loading!</div>
                                 <div id="loading"></div> -->
      <input type="button" value="submit" class="btn btn-success" onClick="evtfile()">
     <%-- <input type="button" value="Download" class="btn btn-success"  onClick="<%=request.getContextPath()%>/download"> --%>
		  							<button type="button"  value="Reset" class="btn btn-primary" onClick="window.location.reload()">Reset</button>
		  							<a id="link" style="display:none;"href="<%=request.getContextPath()%>/download1"><u>Download Output Files</u></a> 
                                 
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