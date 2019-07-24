 <%@page import="java.nio.file.Path"%>

<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html" import = "java.io.*" import = 'com.oreilly.servlet.*' %>
 <%@ page import="java.util.*" %>
<%@page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %> 

 <%@ page import="java.text.SimpleDateFormat"%>
 <%@ page import="java.util.UUID;"%>
 

<% 
String userid = (String) request.getSession().getAttribute("userId");
System.out.println("Inside upload ");
//String userid = (String)session.getAttribute("userId");
System.out.println("usrname : " + userid);
String homedir = System.getenv("HOME");
if(userid == "pipeline.jsp")
{
	//boolean success = false;
	//File directory = new File("/home/cztipoc/pipeline_upload/");
	/* String timeStamp = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss").format(new Date());
	System.out.println(timeStamp);
	String folderPath = "/home/cztipoc/pipeline_upload/" + timeStamp+"_level1";
	File theDir = new File(folderPath);
	success = theDir.mkdir();
	String path=folderPath +"ModeM0";
	//File theDir1 = new File(path);
	//success = theDir1.mkdir();
	//String path1=folderPath +"ModeSS";
	File theDir2 = new File(path1);
	success = theDir2.mkdir();
	String path2=folderPath +"ModeM9";
	File theDir3 = new File(path2);
	success = theDir2.mkdir();
    if (success) {
        System.out.printf("Successfully created new directory");
    } else {
        System.out.printf("Failed to create new directory");
    }
 */


	MultipartRequest m = new MultipartRequest(request, homedir+"/pipeline_upload/",2000000000);
    
 	System.out.print("successfully uploaded directory");
	//request.getSession().setAttribute("path", folderPath);

	

}else
{
	
	 String uname=(String) request.getSession().getAttribute("uname");
	 UUID uuid = UUID.randomUUID();
	// System.out.println("uuuuuuuuuuuuuuuuuuuuuuuuid"+uuid);
	 //String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new java.util.Date());
	String sdir = "session_"+uname+"_"+uuid;
	 boolean success = false;
	String folderPath = homedir+"/upload/" + sdir;
	File theDir = new File(folderPath);
	success = theDir.mkdir();

	 
	 
	 if (success) {
	        System.out.printf("Successfully created new directory");
	    } else {
	        System.out.printf("Failed to create new directory");
	    }
	 
	 
	 
	MultipartRequest m = new MultipartRequest(request,folderPath ,2000000000);
	
	//}
 
	/* 
	String evt=(String)request.getSession().getAttribute("evtfile");
	String bc=(String)request.getSession().getAttribute("bunchfile");
	
	System.out.println(evt);
	System.out.println(bc); */
	//Enumeration files = m.getFileNames(); 
	//System.out.println(files);
	
	/* while(files.hasMoreElements()){  
	String name = (String) files;
	File uploadedFile = m.getFile( name );
	System.out.println(uploadedFile); 
	} */
	

	
	//File[] listOfFiles= m.getFileNames();
	 /* while(enumr.hasMoreElements()){  
		
		  System.out.println( m.getFilesystemName((String)enumr.nextElement()));  
         //System.out.println(enumr.nextElement());  
    }    */       

    //File file = new File(homedir+"/upload/");
     //File[] files = file.listFiles();
    
    
    // for(File f: files){
    	// System.out.println("--------------------------------------------files"+f);
    	 //String absolutePath = f.getAbsolutePath();
 	   // System.out.println("File path : " + absolutePath);
 	    
 	  
    // }
	
     
	}
String redirectURL=null;
	//System.out.print("successfully uploaded-1");
	//String msg="File Successfully Uploaded...!-2";
	//Enumeration files = m.getFileNames();
	/*  File file = new File("/home/cztipoc/upload/");
     File[] files = file.listFiles();
     String fits
     String tct; */
     
  


     /* for(File f: files){

       //String absolutePath = f.getAbsolutePath();
 	   //System.out.println("File path : " + absolutePath);
 	   String[] parts = absolutePath.split("/");
			String lastWord = parts[parts.length - 1];
			//System.out.println(lastWord);
			if (lastWord.endsWith("level1.fits"))
			{
				fits=absolutePath;
				//System.out.println("File path : " + fits);
				request.getSession().setAttribute("names2", fits);
				 String userName = request.getParameter("sciencefile");
			   if(userName!=null && !"".equals(userName))
					   { 
			         request.getSession().setAttribute("sciencefile",userName);
			   } 
				//out.println(fits);
				
			}
			if (lastWord.endsWith("level1.tct"))
			{
				tct=absolutePath;
				System.out.println("File path : " + tct);
				request.getSession().setAttribute("names", tct);
				//out.println(tct);
				
			} 
 	   //names.add(absolutePath);
 	  
  
     }*/
     //request.setAttribute("names", names);
     
     
    
    /// request.setAttribute("names", names);
    //request.setAttribute("message", "File Successfully Uploaded...!-3");
    request.getSession().setAttribute("localClicked", "true");
    //request.getSession().setAttribute("msg", userid);
    //RequestDispatcher dispatcher = request.getRequestDispatcher("/html/ltr/cztscience2event.jsp");
	 //dispatcher.forward(request, response); 
	//request.getRequestDispatcher("/Pipeline/html/ltr/cztscience2event.jsp").forward(request, response); 
	//String localClick ="true"; 
	if(userid.equalsIgnoreCase("pipeline.jsp"))
	{
		//request.getSession().setAttribute("msg", "File Successfully Uploaded for pipeline...!");
	 redirectURL = "/Pipeline/html/ltr/pipeline.jsp";
	}
	if (userid.equalsIgnoreCase("cztscience2event.jsp"))
	{
		//request.getSession().setAttribute("msg", "File Successfully Uploaded for cztscience2event...!");
	  redirectURL = "/Pipeline/html/ltr/cztscience2event.jsp";
	}
	if (userid.equalsIgnoreCase("cztbunchclean.jsp"))
	{
		//request.getSession().setAttribute("msg", "File Successfully Uploaded for cztbunchclean...!");
	  redirectURL = "/Pipeline/html/ltr/cztbunchclean.jsp";
				//?localClick="+localClick;
	}
	
	if (userid.equalsIgnoreCase("cztpha2energy.jsp"))
	{
		//request.getSession().setAttribute("msg", "File Successfully Uploaded for cztpha2energy...!");
	  redirectURL = "/Pipeline/html/ltr/cztpha2energy.jsp";
	}
	if (userid.equalsIgnoreCase("cztigen.jsp"))
	{
		//request.getSession().setAttribute("msg", "File Successfully Uploaded for cztigen...!");
	  redirectURL = "/Pipeline/html/ltr/cztigen.jsp";
	}
	if (userid.equalsIgnoreCase("cztgaas.jsp"))
	{
		//request.getSession().setAttribute("msg", "File Successfully Uploaded for cztgaas...!");	
		redirectURL = "/Pipeline/html/ltr/cztgaas.jsp";
	}
	if (userid.equalsIgnoreCase("cztdatasel.jsp"))
	{
		//request.getSession().setAttribute("msg", "File Successfully Uploaded for cztdatasel...!");	
		redirectURL = "/Pipeline/html/ltr/cztdatasel.jsp";
	}
	if (userid.equalsIgnoreCase("cztpixclean.jsp"))
	{
		//request.getSession().setAttribute("msg", "File Successfully Uploaded for cztpixclean...!");	
		redirectURL = "/Pipeline/html/ltr/cztpixclean.jsp";
	}
	if (userid.equalsIgnoreCase("cztevtclean.jsp"))
	{
		//request.getSession().setAttribute("msg", "File Successfully Uploaded for cztevtclean...!");	
		redirectURL = "/Pipeline/html/ltr/cztevtclean.jsp";
	}
	if (userid.equalsIgnoreCase("cztdpigen.jsp"))
	{
		//request.getSession().setAttribute("msg", "File Successfully Uploaded for cztdpigen...!");	
		redirectURL = "/Pipeline/html/ltr/cztdpigen.jsp";
	}
	if (userid.equalsIgnoreCase("cztimage.jsp"))
	{
		//request.getSession().setAttribute("msg", "File Successfully Uploaded for cztimage...!");	
		redirectURL = "/Pipeline/html/ltr/cztimage.jsp";
	}
	if (userid.equalsIgnoreCase("cztbindata.jsp"))
	{
		//request.getSession().setAttribute("msg", "File Successfully Uploaded for cztbindata...!");	
		redirectURL = "/Pipeline/html/ltr/cztbindata.jsp";
	}
	if (userid.equalsIgnoreCase("cztrspigen.jsp"))
	{
		//request.getSession().setAttribute("msg", "File Successfully Uploaded for cztrspigen...!");	
		redirectURL = "/Pipeline/html/ltr/cztrspigen.jsp";
	}
	if (userid.equalsIgnoreCase("cztflagbadpix.jsp"))
	{
		//request.getSession().setAttribute("msg", "File Successfully Uploaded for cztflagbadpix...!");	
		redirectURL = "/Pipeline/html/ltr/cztflagbadpix.jsp";
	}
	System.out.println("url: " + redirectURL);
response.sendRedirect(redirectURL); 
	 
 

  
%>