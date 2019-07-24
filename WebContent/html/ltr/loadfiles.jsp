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
<!--   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 -->     <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content=""> 
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
    <title>Pipeline</title>

    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="../../assets/libs/select2/dist/css/select2.min.css">
    <link rel="stylesheet" type="text/css" href="../../assets/libs/jquery-minicolors/jquery.minicolors.css">
    <link rel="stylesheet" type="text/css" href="../../assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" type="text/css" href="../../assets/libs/quill/dist/quill.snow.css">
    
    <link rel="stylesheet" type="text/css" href="../../assets/extra-libs/multicheck/multicheck.css">
    <link href="../../assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">
    <link href="../../dist/css/style.min.css" rel="stylesheet">
    <!-- harshad add  -->
    <!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script> -->
     <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
 <!--     <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
 --><!--  <script src="../../dist/js/pipelinemodules/cztflagbadpix.js"></script>-->

</head>


<body>
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
                                <li class="sidebar-item"><a href="form-basic.html" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu"> Standard Pipeline </span></a></li>
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
                        <h4 class="page-title">Upload data LEVEL1 & LEVEL2 </h4>
                        <div class="ml-auto text-right">
                            
                        </div>
                    </div>
                </div>
            </div>
           <div class="card">
                            <div class="card-body">
<!--                                 <h5 class="card-title">Basic Datatable</h5>
 -->			
 	
  <form class="form-horizontal" action="/Pipeline/html/ltr/sample.jsp" method="post" enctype="multipart/form-data">
  <div class="form-group row">
					<label for="fname" class="col-sm-3 text-right control-label col-form-label">Upload Data levels</label>
           			 <div class="col-sm-9">
           			 
                    Level1: <input type="radio" name="group1" value="level1" />
					Level2: <input type="radio" name="group1" value="level2" />
					
				
						</div>	
						</div> 	      
						<!-- file upload -->
						<!-- 1st form -->
						<div id="hidden_elements">
						<div class="form-group row">
                          <label class="col-md-3">File Upload</label>
                          <input type = "file" name = "file"  />
                       <input type="submit" value="Upload" class="btn btn-success">
                                </div>   
                                  
                                <!-- file upload end -->                
  							<div class="table-responsive">
                                    <table id="zero_config" class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th>File Name</th>
                                                <th>Location</th>
                                                <th>Size</th>
                                                <th>Uploaded Date</th>
                                                <th>Download</th>
                                               
                                               <!--  <th>Salary</th> -->
                                            </tr>
                                        </thead>
                                        <tbody>                                      
                                            <%
                                            List<UploadDetail> uploadDetails1=(List<UploadDetail>)request.getAttribute("names");
                                            if(uploadDetails1==null)
                                    		{
                                            	 File file = new File("/home/assc/level1files/");
                                                 File[] files = file.listFiles();                                                                                             
                                                 SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
                                             	
                                                 for(File f: files){
                                                	
                                                	 String absolutePath = f.getAbsolutePath();
                                              	    System.out.println("File path : " + absolutePath);
                                              	    
                                              	    String filePath = absolutePath.
                                              	    	     substring(0,absolutePath.lastIndexOf(File.separator));
                                             		long fileSize = f.length();
                                             		String fileSizeDisplay = FileUtils.byteCountToDisplaySize(fileSize);
                                                    %>
                                                	 <tr>
                             		    	    	<td><%=f.getName() %></td>
                             		    	    	 <td><%=filePath%></td>                             		    	    	
                             		    	    	<%-- <td><%=f.getAbsolutePath()%></td> --%>
                             		    	    	<td><%=fileSizeDisplay%></td>
                             		    	    	<td><%=sdf.format(f.lastModified())%></td>
		    	    	<td><a href="<%=request.getContextPath()%>/level1download?fileName=<%=f.getName()%>">Download</a></td>
                             		    	    </tr>
                                             <% }
		    			}
		    			%> 
		    		
                                         	 <% List<UploadDetail> uploadDetails=(List<UploadDetail>)request.getAttribute("names");
                                        		// String tname=(String)session.getAttribute("uploadDetails");

                                        		if(uploadDetails!=null)
                                        		{
                                        		//	out.println("size1==="+uploadDetails.size());
		    			for(int i=0;i<uploadDetails.size();i++){
		    	    %>
		    	    <tr>
		    	    	<td><%=uploadDetails.get(i).getName() %></td>
		    	    	<td><%=uploadDetails.get(i).getAbsolutePath()%></td>
		    	    	<td><%=uploadDetails.get(i).length()%></td>
		    	    	<td><%=uploadDetails.get(i).lastdate()%></td>
		    	    	<td><a href="<%=request.getContextPath()%>/level1download?fileName=<%=uploadDetails.get(i).getName()%>">Download</a></td>
		    	    </tr>
		    	    <%
		    	     }
		    			}%>  
                                            
                                                                                 
                                            
                                           
                                        </tbody>
                                       </table>
                                </div>
                                </div>
                                </form>
                                <!-- end first form -->
                                <!-- 2nd form -->
                                <form class="form-horizontal" action="/Pipeline/html/ltr/level2.jsp" method="post" enctype="multipart/form-data">
						<div id="hidden_elements1">
						<div class="form-group row">
                                    <label class="col-md-3">File Upload</label>                            
                                     <input type = "file" name = "file"  />
                                  <input type="submit" value="Upload" class="btn btn-success">
                                </div>       
                                <!-- file upload end -->                
  							<div class="table-responsive">
                                    <table id="zero_config1" class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th>File Name</th>
                                                <th>Location</th>
                                                <th>Size</th>
                                                <th>Uploaded Date</th>
                                                <th>Download</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                              <%
                                            List<UploadDetail> uploadDetailslevel2=(List<UploadDetail>)request.getAttribute("names");
                                            if(uploadDetailslevel2==null)
                                    		{
                                            	 File file = new File("/home/assc/level2files/");
                                                 File[] files = file.listFiles();                                                                                             
                                                 SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
                                             	
                                                 for(File f: files){
                                                	
                                                	 String absolutePath = f.getAbsolutePath();
                                              	    System.out.println("File path : " + absolutePath);
                                              	    
                                              	    String filePath = absolutePath.
                                              	    	     substring(0,absolutePath.lastIndexOf(File.separator));
                                             		long fileSize = f.length();
                                             		String fileSizeDisplay = FileUtils.byteCountToDisplaySize(fileSize);
                                             		out.println("level2 data");
                                                    %>
                                                	 <tr>
                             		    	    	<td><%=f.getName() %></td>
                             		    	    	 <td><%=filePath%></td>                             		    	    	
                             		    	    	<%-- <td><%=f.getAbsolutePath()%></td> --%>
                             		    	    	<td><%=fileSizeDisplay%></td>
                             		    	    	<td><%=sdf.format(f.lastModified())%></td>
		    	    	<td><a href="<%=request.getContextPath()%>/level2download?fileName=<%=f.getName()%>">Download</a></td>
                             		    	    </tr>
                                             <% }
		    			}
		    			%> 
		    		
                                         	 <% List<UploadDetail> uploadDetailslevel2s=(List<UploadDetail>)request.getAttribute("names");
                                        		// String tname=(String)session.getAttribute("uploadDetails");

                                        		if(uploadDetailslevel2s!=null)
                                        		{
                                        		//	out.println("size1==="+uploadDetails.size());
		    			for(int i=0;i<uploadDetailslevel2s.size();i++){
		    	    %>
		    	    <tr>
		    	    	<td><%=uploadDetailslevel2s.get(i).getName() %></td>
		    	    	<td><%=uploadDetailslevel2s.get(i).getAbsolutePath()%></td>
		    	    	<td><%=uploadDetailslevel2s.get(i).length()%></td>
		    	    	<td><%=uploadDetailslevel2s.get(i).lastdate()%></td>
		    	    	<td><a href="<%=request.getContextPath()%>/level2download?fileName=<%=uploadDetailslevel2s.get(i).getName()%>">Download</a></td>
		    	    </tr>
		    	    <%
		    	     }
		    			}%>  
                                        </tbody>
                                      
                                    </table>
                                </div>
                                </div>
                                <!-- 2nd form -->
 							</form>
 
                            </div>
                        </div>

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
    <!-- this page js -->
    
<script src="../../assets/extra-libs/multicheck/datatable-checkbox-init.js"></script>
    <script src="../../assets/extra-libs/multicheck/jquery.multicheck.js"></script>
    <script src="../../assets/extra-libs/DataTables/datatables.min.js"></script>
  <script type="text/javascript">
        /****************************************
         *       Basic Table                   *
         ****************************************/
  
        	    // The cell has stuff in it
        	  
       
        $('#zero_config').DataTable();
        $('#zero_config1').DataTable();
       /*  if ( ! $.fn.DataTable.isDataTable( '#zero_config' ) ) {
        	  $('#zero_config').dataTable();
        	}
        if ( ! $.fn.DataTable.isDataTable( '#zero_config1' ) ) {
        	  $('#zero_config1').dataTable();
        	  
        	} */
        	
        window.onload=function() {

        	   document.getElementById("hidden_elements").style.display="none";
        	   document.getElementById("hidden_elements1").style.display="none";

        	   //  attach the click event handler to the radio buttons
        	   var radios = document.forms[0].elements["group1"];
        	   for (var i = [0]; i < radios.length; i++)
        	     radios[i].onclick=radioClicked;
        	 }
        	 function radioClicked() {
        	  if (this.value == "level1") {
        		 
        	     document.getElementById("hidden_elements").style.display="block";
        	    } else {
        	     document.getElementById("hidden_elements").style.display="none";
        	    }
        	    if (this.value == "level2") {
        	    	  
        	     document.getElementById("hidden_elements1").style.display="block";
        	    } else {
        	     document.getElementById("hidden_elements1").style.display="none";
        	    }
        	 }
       
        </script> 
    <!-- </script> -->
</body>

</html>