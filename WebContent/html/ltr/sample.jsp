 <%@page import="java.nio.file.Path"%>
<%@page import="upload.UploadDetail"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html" import = "java.io.*" import = 'com.oreilly.servlet.*' %>
 <%@ page import="java.util.*" %>
<%@page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %> 
 <%@ page import="upload.UploadDetail"%>
 <%@ page import="java.text.SimpleDateFormat"%>
 

<%  


   String level1=request.getParameter("level1data");
   System.out.println("============="+level1);
	MultipartRequest m = new MultipartRequest(request, "/home/assc/level1files/",500000000);  
	out.print("successfully uploaded");
	String msg="File Successfully Uploaded...!";
	//Enumeration files = m.getFileNames();
	 File file = new File("/home/assc/level1files/");
     File[] files = file.listFiles();
    
     ArrayList<UploadDetail> names = new ArrayList<UploadDetail>();
     SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
 	UploadDetail uploadDetail = null;
     for(File f: files){
    	 uploadDetail = new UploadDetail();
    	 String absolutePath = f.getAbsolutePath();
 	    System.out.println("File path : " + absolutePath);
 	    
 	    String filePath = absolutePath.
 	    	     substring(0,absolutePath.lastIndexOf(File.separator));
     	
        uploadDetail.setFileName(f.getName());
        //uploadDetail.setAbsolutePath(f.getAbsolutePath());
        uploadDetail.setAbsolutePath(filePath);
        uploadDetail.setFileSize(f.length());
        uploadDetail.setlastdate(sdf.format(f.lastModified()));
   
     names.add(uploadDetail);
     }
     request.setAttribute("names", names);
    // RequestDispatcher dispatcher = request.getRequestDispatcher("/html/ltr/loadfiles.jsp");
	// dispatcher.forward(request, response); 
	request.setAttribute("message", "File Successfully Uploaded...!");
	String redirectURL = "/Pipeline/html/ltr/loadfiles.jsp?names="+names;
response.sendRedirect(redirectURL); 
	
 

  
%>