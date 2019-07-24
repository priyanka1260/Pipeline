

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
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

/**
 * Servlet implementation class cztpha2energy
 */
@WebServlet("/cztpha2energy")
public class cztpha2energy extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cztpha2energy() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				PrintWriter out = response.getWriter();
				
				
				String localClicked=request.getParameter("localClicked");		
				
				System.out.println("localClicked========"+localClicked);
				
				String serverClicked=request.getParameter("serverClick");		
				
				System.out.println("serverClicked========"+serverClicked);

				/*String eventfile=request.getParameter("eventfile");		
				
				System.out.println("eventfile========"+eventfile);
				
				
				String temperature=request.getParameter("temperature");
				System.out.println("temperature========"+temperature);
				
				
				String outputfile=request.getParameter("outputfile");
				System.out.println("outputfile======"+outputfile);
				
			
				
			
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
			    /* out.print("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n");
			     out.print("<?xml-stylesheet  href=\"style.css\"?>");
			     out.print("<response>\n");
			     out.print("<files>\n");*/
			     
			     
			     
			     
			     buffer.append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n");
			        //  buffer.append("<?xml-stylesheet  href=\"style.css\"?>");
			        buffer.append("<response>\n");
			        buffer.append("<files>\n");
			    //response.setContentType("text/html");
				//StringBuffer buffy=new StringBuffer();
			        String homedir = System.getenv("HOME");
			        
		        ServletContext servletContext = getServletContext();
				String contextPath = servletContext.getRealPath("/");
			    System.out.println("contextPath....."+contextPath);
			        //buffer.append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n");
			        //  buffer.append("<?xml-stylesheet  href=\"style.css\"?>");
			        //buffer.append("<response>\n");
			        //buffer.append("<files>\n");
			    //response.setContentType("text/html");
				//StringBuffer buffy=new StringBuffer();
		       
			   
			     String eventfile = null;
			     String temperature= null;
			     //ArrayList <String> names=new ArrayList<String>();
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
							if (lastWord1.endsWith("level2_bc.fits"))
							{
								
								eventfile=absolutePath1;

								System.out.println("eventfile========"+eventfile);
								
								 String userName = request.getParameter("sciencefile");
							   if(userName!=null && !"".equals(userName))
									   { 
							         request.getSession().setAttribute("sciencefile",userName);
							   } 
								//out.println(fits);
								
							}
							if (lastWord1.endsWith("SS_level2.fits"))
							{
								temperature=absolutePath1;
								System.out.println("bunchfile========" + temperature);
								
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
					 	 if (lastWord.endsWith("level2_bc.fits"))
							{
								
								eventfile=absolutePath;

								System.out.println("eventfile========"+eventfile);
								
								 String userName = request.getParameter("sciencefile");
							   if(userName!=null && !"".equals(userName))
									   { 
							         request.getSession().setAttribute("sciencefile",userName);
							   } 
								//out.println(fits);
								
							}
							if (lastWord.endsWith("SS_level2.fits"))
							{
								temperature=absolutePath;
								System.out.println("bunchfile========" + temperature);
								
								//out.println(tct);
								
							}
					 	  
				
								
					  
					     }
					     
				    	 
				     }
			    /* for(File f: files){
			    	 System.out.println("--------------------------------------------files"+f);
			    	 String absolutePath = f.getAbsolutePath();
			 	    System.out.println("File path : " + absolutePath);
			 	   String[] parts = absolutePath.split("/");
						String lastWord = parts[parts.length - 1];
						System.out.println(lastWord);
						if (lastWord.endsWith("level2_bc.fits"))
						{
							eventfile = absolutePath;
							System.out.println("eventfile========"+eventfile);
							
							 String userName = request.getParameter("sciencefile");
						   if(userName!=null && !"".equals(userName))
								   { 
						         request.getSession().setAttribute("sciencefile",userName);
						   } 
							//out.println(fits);
							
						}
						if (lastWord.endsWith("SS_level2.fits"))
						{
							temperature=absolutePath;
							System.out.println("temperature========" + temperature);
							
							//out.println(tct);
							
						}
			 	   //names.add(absolutePath);
						
			  
			     }*/
			     Cookie cookie = null;
			      Cookie[] cookies = null;

			      String outputfile=null;
			   
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


			             if (cookie.getValue( ).endsWith("level2_bc.evt"))
			             {
			            	 outputfile=cookie.getValue( );
			            	 outputfile=path1+outputfile; 
			            	 System.out.println("evt-----------------------------------------------------"+outputfile);
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
		        	 int index = 0,flag=0;;
			        String status;
			        String s1=null;
			        System.out.println("cztpha2energy "+"par_infile="+eventfile+" "+"par_tempextfile="+temperature+" "+"par_outfile="+outputfile+" "+"par_history="+history+" "+"par_clobber="+write+" ");
			        Process p = Runtime.getRuntime().exec("cztpha2energy "+"par_infile="+eventfile+" "+"par_tempextfile="+temperature+" "+"par_outfile="+outputfile+" "+"par_history="+history+" "+"par_clobber="+write+" ");
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
					
					
					System.out.println("===="+status);
					buffer.append("<filepath>" +"\n"+status+ "</filepath>\n");
					buffer.append(status); 
					//s1=buffer.toString();
					buffer.append(System.getProperty("line.separator"));
					if (status.contains("CZTPHA2ENERGY COMPLETED SUCCESSFULLY"))
					{
						flag=1;
						String pathformove="cp "+outputfile+" "+homedir+"/level2files/";
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
			   	           message.setSubject("CZTPHA2ENERGY COMPLETED SUCCESSFULLY"); 	          
			   	           message.setText("CZTPHA2ENERGY COMPLETED SUCCESSFULLY");       
			   	           Transport.send(message);	   	        
			   	          // result = "Sent message successfully....";
			   	        }
			   	        catch (MessagingException mex) {
			   	            mex.printStackTrace();
			   	           // result = "Error: unable to send message....";
			   	         }
					
					
				}
				
				
				 /*String lines[] = s1.split("\n"); 
	        	 		
	     		//System.out.println(output.contains("COMPLETED SUCCESSFULLY"));
	     		 for (String finaloutput:lines) 
	     		 {  	
	     		
	     		 System.out.println("harshad sawant========="+finaloutput);
	     		
	     		 Pattern pat = Pattern.compile("COMPLETED SUCCESSFULLY");   // the pattern to search for
	     	    Matcher m = pat.matcher(finaloutput);
	     	    
	     	    // now try to find at least one match
	     	    if (m.find())
	     	    {
	     	    	
	     	      System.out.println("CZTPHA2ENERGY COMPLETED SUCCESSFULLY");
	     	     //buffer.append("<filepath>" +"CZTPHA2ENERGY COMPLETED SUCCESSFULLY"+ "</filepath>\n");
	     	     out.print("<filepath>" +"CZTPHA2ENERGY COMPLETED SUCCESSFULLY"+ "</filepath>\n");
	     	    for(File f: files){
	     	    	if (!f.isDirectory())
	     	           f.delete();
	     	    }
	     	  
	     	    try {	   	          
		   	           MimeMessage message = new MimeMessage(mailSession);	   	           	   	           
		   	           message.setFrom(new InternetAddress(from));	   	           	   	           
		   	           message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));	   	         
		   	           message.setSubject("CZTPHA2ENERGY COMPLETED SUCCESSFULLY"); 	          
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
	     	      //System.out.println("Did not find a match");
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
	    	      //buffer.append("<filepath>" + finaloutput + "</filepath>\n");
	    	      
					 
	    	    }
	    	    else {
	    	      //System.out.println("Did not find a match");
	    	    }
		           
	    }
				 
	     		 out.print("</files>\n");
	      		out.print("<filecount>" + index + "</filecount>\n");
	      		out.print("</response>\n");
			       

			        //out.println(count);
			        out.close();
				//fileWriter1.close();
				stdError.close();
				p.destroy();	*/
				
				buffer.append("</files>\n");
				 buffer.append("<filecount>" + index + "</filecount>");
			        buffer.append("</response>\n");

			       out.println(buffer);

			        //out.println(count);
			        out.close();
				//fileWriter1.close();
				stdError.close();
				p.destroy();
				
			}
	        catch (NullPointerException exception)
	        {
	             System.out.println("catched---------------------------------------");
	        } catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		       }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
