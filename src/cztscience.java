

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.nio.file.Path;
/**
 * Servlet implementation class cztscience
 */
@WebServlet("/cztscience")
public class cztscience extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cztscience() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// TODO Auto-generated method stub
		 synchronized (this) {
		PrintWriter out = response.getWriter();
		
		
        String localClicked=request.getParameter("localClicked");		
		
		System.out.println("localClicked========"+localClicked);
		
		String serverClicked=request.getParameter("serverClicked");		
		
		System.out.println("serverClicked========"+serverClicked);

		/*String sciencefile=request.getParameter("sciencefile");		
		
		System.out.println("sciencefile========"+sciencefile);
		
		
		String tctfile=request.getParameter("tctfile");
		//System.out.println("tctfile========"+tctfile);

		String eventfile=request.getParameter("eventfile");
		System.out.println("eventfile======"+eventfile);
		
		/*String headerfile=request.getParameter("headerfile");
		System.out.println("headerfile======"+headerfile);
		
		String bunchfile=request.getParameter("bunchfile");
		System.out.println("bunchfile======"+bunchfile);
		
		String numbuffer=request.getParameter("numbuffer");
		System.out.println("bunchfile======"+numbuffer);
		
	
		String history=request.getParameter("history");
		System.out.println("output file======"+history);

		String write=request.getParameter("write");
		System.out.println("output file======"+write);*/
		

	     StringBuffer buffer=new StringBuffer("");
	     response.setContentType("text/xml;charset=UTF-8");
         
	     
	     /*String eventfile =session.getAttribute("date");
	     System.out.println("eventfile======"+eventfile);*/
	     
	
	    /* String evt=(String)request.getSession().getAttribute("evt");
	     System.out.println("fits file****************"+evt);*/
	     /*     HttpSession session = request.getSession();
	      * String fits=(String)session.getAttribute("fits");
	     String tct=(String)session.getAttribute("tct"); 
	     System.out.println("fits file****************"+fits);
	     System.out.println("tct file****************"+tct);*/
	   /*  out.print("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n");
	     out.print("<?xml-stylesheet  href=\"style.css\"?>");
	     out.print("<response>\n");
	     out.print("<files>\n");*/
	     
	

	     
	        
	        buffer.append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n");
	        //  buffer.append("<?xml-stylesheet  href=\"style.css\"?>");
	        buffer.append("<response>\n");
	        buffer.append("<files>\n");
	        //buffer.append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n");
	        //  buffer.append("<?xml-stylesheet  href=\"style.css\"?>");
	        //buffer.append("<response>\n");
	       // buffer.append("<files>\n");
	    //response.setContentType("text/html");
		//StringBuffer buffy=new StringBuffer();
	        
	        String homedir = System.getenv("HOME");
	        
	        ServletContext servletContext = getServletContext();
			String contextPath = servletContext.getRealPath("/");
		    System.out.println("contextPath....."+contextPath);
	        
		    String sciencefile = null;
		     String tctfile= null;
		  
			   //File newestFile;
		     String uname=(String) request.getSession().getAttribute("uname");
		 
		    if( localClicked.equalsIgnoreCase("true") )
		    		{
		    	
		    	
		    	File file = new File(homedir+"/upload/");
			     File[] files = file.listFiles();
		     for(File f: files){
		    	 System.out.println("--------------------------------------------files"+f);
		    	 String absolutePath = f.getAbsolutePath();
		 	    System.out.println("File path : " + absolutePath);
		 	   String[] parts = absolutePath.split("/");
		 	  String lastWord = parts[parts.length - 1];
		 	  String[] part = lastWord.split("_");
		 	  
		 	  System.out.println(part[1]);
		 	  
		 	  if (uname.equals(part[1]))
		 	  {
		 		  File file1=new File(absolutePath);
		 		 File[] files1 = file1.listFiles();
		 		 for(File f1: files1){
		 			String absolutePath1 = f1.getAbsolutePath();
		 		   	String[] parts1 = absolutePath1.split("/");
					String lastWord1 = parts1[parts1.length - 1];
					System.out.println(lastWord1);
					if (lastWord1.endsWith("level1.fits"))
					{
						
						sciencefile=absolutePath1;

						System.out.println("eventfile========"+sciencefile);
						
						 String userName = request.getParameter("sciencefile");
					   if(userName!=null && !"".equals(userName))
							   { 
					         request.getSession().setAttribute("sciencefile",userName);
					   } 
						//out.println(fits);
						
					}
					if (lastWord1.endsWith("level1.tct"))
					{
						tctfile=absolutePath1;
						System.out.println("bunchfile========" + tctfile);
						
						//out.println(tct);
						
					}
		 		   	 
		 			 
		 		 }
		 		  
		 	  }
		 	   //names.add(absolutePath);
					
		  
		     }
		    }
		     else if (serverClicked.equalsIgnoreCase("true"))
		     {
		    	 
		    	 System.out.println("---------------inside SERVER------------------------------------------------");
		    	 File file = new File(homedir+"/level2files/");
			     File[] files = file.listFiles();
			     
			     for(File f: files){
			    	 System.out.println("--------------files-----------------"+f);
			    	 String absolutePath = f.getAbsolutePath();
			 	    //System.out.println("File path : " + absolutePath);
			 	   String[] parts = absolutePath.split("/");
			 	  String lastWord = parts[parts.length - 1];
			 	  //String[] part = lastWord.split("_");
			 	  
			 	  System.out.println("--------------part----------"+lastWord);
			 	 if (lastWord.endsWith("level1.fits"))
					{
						
			 		sciencefile=absolutePath;

						System.out.println("eventfile========"+sciencefile);
						
						 String userName = request.getParameter("sciencefile");
					   if(userName!=null && !"".equals(userName))
							   { 
					         request.getSession().setAttribute("sciencefile",userName);
					   } 
						//out.println(fits);
						
					}
					if (lastWord.endsWith("level1.tct"))
					{
						tctfile=absolutePath;
						System.out.println("bunchfile========" + tctfile);
						
						//out.println(tct);
						
					}
			 	  
		
						
			  
			     }
			     
		    	 
		     }	    	
		    	
		    	
		    
		    	/* File file = new File(homedir+"/upload/");
			     File[] files = file.listFiles();
	     
	     //ArrayList <String> names=new ArrayList<String>();

	     for(File f: files){
	    	 System.out.println("--------------------------------------------files"+f);
	    	 String absolutePath = f.getAbsolutePath();
	 	    System.out.println("File path : " + absolutePath);
	 	   String[] parts = absolutePath.split("/");
				String lastWord = parts[parts.length - 1];
				System.out.println(lastWord);
				if (lastWord.endsWith("level1.fits"))
				{
					sciencefile=absolutePath;
					System.out.println("sciencefile========"+sciencefile);
					
					 String userName = request.getParameter("sciencefile");
				   if(userName!=null && !"".equals(userName))
						   { 
				         request.getSession().setAttribute("sciencefile",userName);
				   } 
					//out.println(fits);
					
				}
				if (lastWord.endsWith("level1.tct"))
				{
					tctfile=absolutePath;
					System.out.println("tctfile========" + tctfile);
					
					//out.println(tct);
					
				}
	 	   //names.add(absolutePath);
				
	  
	     }*/
	     
		    		
	     Cookie cookie = null;
	      Cookie[] cookies = null;

	      String eventfile=null;
	      String headerfile=null;
	      String bunchfile=null;
	      String history=null;
	      String write=null;
	      
	      // Get an array of Cookies associated with this domain
	      cookies = request.getCookies();
	      boolean success = false;
	  	
			 String filename="session_"+uname+"/";
			 String path1=homedir+"/download/"+filename;
			 File theDir = new File(path1);
				success = theDir.mkdir();
	      
	      if( cookies != null ) {
	          //System.out.println("<h2> Found Cookies Name and Value</h2>");

	          for (int i = 0; i < cookies.length; i++) {
	             cookie = cookies[i];
	             System.out.println("Name---"+cookie.getName( ));
	             //System.out.println("value---"+cookie.getValue( ));


	             if (cookie.getValue( ).endsWith("level2.fits"))
	             {
	            	 eventfile=cookie.getValue( );
	            	 eventfile=path1+eventfile; 
	            	 System.out.println("evt-----------------------------------------------------"+eventfile);
	             }
	             if (cookie.getValue( ).endsWith("level2.hdr"))
	             {
	            	 headerfile=cookie.getValue( );
	            	 headerfile=path1+headerfile; 
	            	 System.out.println("evt-----------------------------------------------------"+headerfile);
	             }
	             if (cookie.getValue( ).endsWith("level2_bunch.fits"))
	             {
	            	 bunchfile=cookie.getValue( );
	            	 bunchfile=path1+bunchfile; 
	            	 System.out.println("evt-----------------------------------------------------"+bunchfile);
	             }
	             if (cookie.getName( ).equals("history"))
	             {
	            	 history=cookie.getValue( );
	            	
	            	 System.out.println("evt-----------------------------------------------------"+history);
	             }
	             if (cookie.getName( ).equals("write"))
	             {
	            	 write=cookie.getValue( );
	            	
	            	 System.out.println("evt-----------------------------------------------------"+write);
	             }
	          }
	       }
	        
        try
		{		
        
        	int index = 0,flag=0;
	        String status;
	        String s1=null,s2=null;
	        System.out.println("cztscience2event  "+sciencefile+" "+tctfile+" "+eventfile+" "+headerfile+" "+bunchfile+" 100000 "+history+" "+write+" NO ");
	        Process p = Runtime.getRuntime().exec("cztscience2event "+sciencefile+" "+tctfile+" "+eventfile+" "+headerfile+" "+bunchfile+" 100000 "+history+" "+write+" NO ");
	       //Process p = Runtime.getRuntime().exec("python2 uvit9pt.py "+TARGET+" "+RA+" "+DEC+"");
 			p.waitFor();			
 			 BufferedReader stdInput = new BufferedReader(new 
 	                 InputStreamReader(p.getInputStream()));

 	        	    BufferedReader stdError = new BufferedReader(new 
 	                 InputStreamReader(p.getErrorStream()));
 	        	 
 	        	   //sending mail 
 	   	        String to = "spriyanka@iucaa.in";     
 	   	        String from = "spriyanka@iucaa.in";
 	   	        String host = "daakghar.iucaa.in";
 	   	        Properties properties = System.getProperties();
 	   	        properties.setProperty("mail.smtp.host", host);
 	   	        Session mailSession = Session.getDefaultInstance(properties);
 	   	        //end mail

 	   	       
			while ((status = stdError.readLine()) != null)
			{
				

				// buffer.append("<filepath>" + status + "</filepath>\n");
		//	fileWriter1.write(status);			
			System.out.println("===="+status);
			buffer.append("<filepath>" +"\n"+status+ "</filepath>\n");
			buffer.append(status); 
			//s1=buffer.toString();
			buffer.append(System.getProperty("line.separator"));
			if (status.contains("CZTSCIENCE2EVENT COMPLETED SUCCESSFULLY"))
			{
				flag=1;
				String pathformove="cp "+eventfile+" "+headerfile+" "+bunchfile+" "+homedir+"/level2files/";
				Process p1=Runtime.getRuntime().exec(pathformove);
		       
				
			}
			
			//System.out.println("OutputstringBuffer\n"+s1);
			
				 index++;
			
				
				// buffer.append("<filepath>" + status + "</filepath>\n");
		//	fileWriter1.write(status);			
			/*System.out.println("===="+status);
			buffer.append(status); 
			s1=buffer.toString();
			buffer.append(System.getProperty("line.separator"));
			System.out.println("OutputstringBuffer\n"+s1);
			
				 index++;*/
			}
			
			
			if (flag == 1)
			{
				try {	   	          
		   	           MimeMessage message = new MimeMessage(mailSession);	   	           	   	           
		   	           message.setFrom(new InternetAddress(from));	   	           	   	           
		   	           message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));	   	         
		   	           message.setSubject("CZTSCIENCE2EVENT COMPLETED SUCCESSFULLY"); 	          
		   	           message.setText("CZTSCIENCE2EVENT COMPLETED SUCCESSFULLY");       
		   	           Transport.send(message);	   	        
		   	          // result = "Sent message successfully....";
		   	        }
		   	        catch (MessagingException mex) {
		   	            mex.printStackTrace();
		   	           // result = "Error: unable to send message....";
		   	         }
				
				
			}
			
			buffer.append("</files>\n");
			 buffer.append("<filecount>" + index + "</filecount>");
		        buffer.append("</response>\n");

		       out.println(buffer);

		        //out.println(count);
		        out.close();
			//fileWriter1.close();
			stdError.close();
			p.destroy();	
			
			
			 /*String lines[] = s1.split("\n"); 
        	 		
     		//System.out.println(output.contains("COMPLETED SUCCESSFULLY"));
     		 for (String finaloutput:lines) 
     		 {  	
     		
     		 System.out.println("harshad sawant========="+finaloutput);
     		
     		 Pattern pat = Pattern.compile("COMPLETED SUCCESSFULLY");   // the pattern to search for
     	    Matcher m = pat.matcher(finaloutput);
     	   out.print("<filepath>" +finaloutput+ "</filepath>\n");
     	    
     	    // now try to find at least one match
     	    if (m.find())
     	    {
     	      System.out.println("CZTSCIENCE2EVENT COMPLETED SUCCESSFULLY");
     	     //out.print("<filepath>" +"CZTSCIENCE2EVENT COMPLETED SUCCESSFULLY"+ "</filepath>\n");
     	    for(File f: files){
     	    	if (!f.isDirectory())
     	           f.delete();
     	    }
     	     //buffer.append("<filepath>" +"CZTSCIENCE2EVENT COMPLETED SUCCESSFULLY"+ "</filepath>\n");
     	    try {	   	          
	   	           MimeMessage message = new MimeMessage(mailSession);	   	           	   	           
	   	           message.setFrom(new InternetAddress(from));	   	           	   	           
	   	           message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));	   	         
	   	           message.setSubject("CZTSCIENCE2EVENT COMPLETED SUCCESSFULLY"); 	          
	   	           message.setText(finaloutput);       
	   	           Transport.send(message);	   	        
	   	          // result = "Sent message successfully....";
	   	        }
	   	        catch (MessagingException mex) {
	   	            mex.printStackTrace();
	   	           // result = "Error: unable to send message....";
	   	         }
     	    }
     	    else {
     	      System.out.println("Did not find a match");
     	    }
     	   Pattern pat1 = Pattern.compile("Error");   // the pattern to search for
    	    Matcher m1 = pat1.matcher(finaloutput);
    	    
    	    // now try to find at least one match
    	    if (m1.find())
    	    {
    	    	
    	      System.out.println("Error ==========="+finaloutput);
    	      out.print("<filepath>" + finaloutput + "</filepath>\n");
    	      for(File f: files){
       	    	if (!f.isDirectory())
       	           f.delete();
       	    }
    	    }
    	    else {
    	      System.out.println("Did not find a match");
    	    }
	           
    }
     		out.print("</files>\n");
     		out.print("<filecount>" + index + "</filecount>\n");
     		out.print("</response>\n");
		      
		        
		        //out.println(buffer);

		        //out.println(count);
		        out.close();
			//fileWriter1.close();
			stdError.close();
			p.destroy();	*/
			
		}
        catch (NullPointerException exception)
        {
       
        } catch (InterruptedException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		 }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
