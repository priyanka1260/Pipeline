

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
 * Servlet implementation class cztpixclean
 */
@WebServlet("/cztpixclean")
public class cztpixclean extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cztpixclean() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
	
        String localClicked=request.getParameter("localClicked");		
		
		System.out.println("localClicked========"+localClicked);
		
		String serverClicked=request.getParameter("serverClick");		
		
		System.out.println("serverClicked========"+serverClicked);
		/*String eventfile=request.getParameter("eventfile");				
		System.out.println("eventfile========"+eventfile);
		
		
		String livetimefile=request.getParameter("livetimefile");
		System.out.println("livetimefile========"+livetimefile);
		
		
		String singleevtfile=request.getParameter("singleevtfile");
		System.out.println("singleevtfile======"+singleevtfile);
		
		String outlivetime=request.getParameter("outlivetime");
		System.out.println("outlivetime======"+outlivetime);
		
		String outputbadpixel=request.getParameter("outputbadpixel");
		System.out.println("outputbadpixel======"+outputbadpixel);
		
		String bindetector=request.getParameter("bindetector");
		System.out.println("bindetector======"+bindetector);
		
		String binpixel=request.getParameter("binpixel");
		System.out.println("binpixel======"+binpixel);
		
		String thresholddetector=request.getParameter("thresholddetector");
		System.out.println("thresholddetector======"+thresholddetector);
		
		String thresholdpixel=request.getParameter("thresholdpixel");
		System.out.println("thresholdpixel======"+thresholdpixel);
		
		String history=request.getParameter("history");
		System.out.println("output file======"+history);

		String write=request.getParameter("write");
		System.out.println("output file======"+write);*/
		

	     StringBuffer buffer=new StringBuffer("");
	     response.setContentType("text/xml;charset=UTF-8");

	     
	        
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
	    
	    String eventfile = null;
	    String livetimefile= null;
	    
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
				if( (lastWord1.endsWith("level2_quad_bc_ds.evt"))||(lastWord1.endsWith("level2_common_bc_ds.evt")))
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
				if (lastWord1.endsWith("level2_bc_livetime.fits"))
				{
					livetimefile=absolutePath1;
					System.out.println("bunchfile========" + livetimefile);
					
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
		 	 if( (lastWord.endsWith("level2_quad_bc_ds.evt"))||(lastWord.endsWith("level2_common_bc_ds.evt")))
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
				if (lastWord.endsWith("level2_bc_livetime.fits"))
				{
					livetimefile=absolutePath;
					System.out.println("bunchfile========" + livetimefile);
					
					//out.println(tct);
					
				}
		 	  
	
					
		  
		     }
		     
	    	 
	     }
	    /*File file = new File("/home/assc/upload/");
	     File[] files = file.listFiles();
	     String eventfile = null;
	     String livetimefile= null;
	     //ArrayList <String> names=new ArrayList<String>();

	     for(File f: files){
	    	 System.out.println("--------------------------------------------files"+f);
	    	 String absolutePath = f.getAbsolutePath();
	 	    System.out.println("File path : " + absolutePath);
	 	   String[] parts = absolutePath.split("/");
				String lastWord = parts[parts.length - 1];
				System.out.println(lastWord);
				if( (lastWord.endsWith("level2_quad_bc_ds.evt"))||(lastWord.endsWith("level2_common_bc_ds.evt")))
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
				if (lastWord.endsWith("level2_bc_livetime.fits"))
				{
					livetimefile=absolutePath;
					System.out.println("livetimefile========" + livetimefile);
					
					//out.println(tct);
					
				}
	 	   //names.add(absolutePath);
				
	  
	     }*/
	     Cookie cookie = null;
	      Cookie[] cookies = null;

	      String singleevtfile=null;
	      String outlivetime=null;
	      String outputbadpixel=null;
	      String bindetector=null;
	      String binpixel=null;
	      String thresholddetector=null;
	      String thresholdpixel=null;
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


	             if ((cookie.getValue( ).endsWith("level2_quad_bc_ds_pc.evt"))||(cookie.getValue( ).endsWith("level2_common_bc_ds_pc.evt")))
	             {
	            	 singleevtfile=cookie.getValue( );
	            	 singleevtfile=path1+singleevtfile;  
	            	 System.out.println("evt-----------------------------------------------------"+singleevtfile);
	             }
	             if ((cookie.getValue( ).endsWith("level2_quad_livetime.fits"))||(cookie.getValue( ).endsWith("level2_common_livetime.fits")))
	             {
	            	 outlivetime=cookie.getValue( );
	            	 outlivetime=path1+outlivetime;  
	            	 System.out.println("evt-----------------------------------------------------"+outlivetime);
	             }
	             if ((cookie.getValue( ).endsWith("level2_quad_badpix.fits"))||(cookie.getValue( ).endsWith("level2_common_badpix.fits")))
	             {
	            	 outputbadpixel=cookie.getValue( );
	            	 outputbadpixel=path1+outputbadpixel;  
	            	 System.out.println("evt-----------------------------------------------------"+outputbadpixel);
	             }
	             if (cookie.getName( ).equals("bindetector"))
	             {
	            	 bindetector=cookie.getValue( );
	            	
	            	 System.out.println("evt-----------------------------------------------------"+bindetector);
	             }
	             if (cookie.getName( ).equals("binpixel"))
	             {
	            	 binpixel=cookie.getValue( );
	            	
	            	 System.out.println("evt-----------------------------------------------------"+binpixel);
	             }
	             if (cookie.getName( ).equals("thresholddetector"))
	             {
	            	 thresholddetector=cookie.getValue( );
	            	
	            	 System.out.println("evt-----------------------------------------------------"+thresholddetector);
	             }
	             if (cookie.getName( ).equals("thresholdpixel"))
	             {
	            	 thresholdpixel=cookie.getValue( );
	            	
	            	 System.out.println("evt-----------------------------------------------------"+thresholdpixel);
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
	        String s1=null;
	        Process p = Runtime.getRuntime().exec("cztpixclean "+"par_infile="+eventfile+" "+"par_inlivetimefile="+livetimefile+" "+"par_outfile1="+singleevtfile+" "+"par_outlivetimefile="+outlivetime+" "+"par_badpixfile="+outputbadpixel+" "+"par_det_tbinsize="+bindetector+" "+"par_pix_tbinsize="+binpixel+" "+"par_det_count_thresh="+thresholddetector+" "+"par_pix_count_thresh="+thresholdpixel);
	       //Process p = Runtime.getRuntime().exec("python2 uvit9pt.py "+TARGET+" "+RA+" "+DEC+"");
 			p.waitFor();			
 			 BufferedReader stdInput = new BufferedReader(new 
 	                 InputStreamReader(p.getInputStream()));

 	        	    BufferedReader stdError = new BufferedReader(new 
 	                 InputStreamReader(p.getErrorStream()));
			
 	        	    
 	        	   String to = "spriyanka@iucaa.in";     
	 	   	        String from = "spriyanka@iucaa.in";
	 	   	        String host = "daakghar.iucaa.in";
	 	   	        Properties properties = System.getProperties();
	 	   	        properties.setProperty("mail.smtp.host", host);
	 	   	        Session mailSession = Session.getDefaultInstance(properties);
	 	   	        
	 	   	        
	 	   	    while ((status = stdError.readLine()) != null)
				{
					// buffer.append("<filepath>" + status + "</filepath>\n");
			//	fileWriter1.write(status);			
				System.out.println("===="+status);
				buffer.append("<filepath>" +"\n"+status+ "</filepath>\n");
				buffer.append(status); 
				//s1=buffer.toString();
				buffer.append(System.getProperty("line.separator"));
				if (status.contains("CZTPIXCLEAN COMPLETED SUCCESSFULLY"))
				{
					flag=1;
					String pathformove="cp "+singleevtfile+" "+outlivetime+" "+outputbadpixel+""+homedir+"/level2files/";
					Process p1=Runtime.getRuntime().exec(pathformove);
			       
					
				}
				
				//System.out.println("OutputstringBuffer\n"+s1);
				
					 index++;
				}
				
				if (flag == 1)
				{
					try {	   	          
			   	           MimeMessage message = new MimeMessage(mailSession);	   	           	   	           
			   	           message.setFrom(new InternetAddress(from));	   	           	   	           
			   	           message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));	   	         
			   	           message.setSubject("CZTPIXCLEAN COMPLETED SUCCESSFULLY"); 	          
			   	           message.setText("CZTPIXCLEAN COMPLETED SUCCESSFULLY");       
			   	           Transport.send(message);	   	        
			   	          // result = "Sent message successfully....";
			   	        }
			   	        catch (MessagingException mex) {
			   	            mex.printStackTrace();
			   	           // result = "Error: unable to send message....";
			   	         }
					
					
				}
			//FileWriter fileWriter1 = new FileWriter(file1);
			//fileWriter1.write("\n");
			/*while ((status = stdError.readLine()) != null)
			{
				// buffer.append("<filepath>" + status + "</filepath>\n");
		//	fileWriter1.write(status);			
			System.out.println("===="+status);
			buffer.append(status); 
			s1=buffer.toString();
			buffer.append(System.getProperty("line.separator"));
			System.out.println("OutputstringBuffer\n"+s1);
			
				 index++;
			}
			 String lines[] = s1.split("\n"); 
        	 		
     		//System.out.println(output.contains("COMPLETED SUCCESSFULLY"));
     		 for (String finaloutput:lines) 
     		 {  	
     		
     		 System.out.println("harshad sawant========="+finaloutput);
     		
     		 Pattern pat = Pattern.compile("COMPLETED SUCCESSFULLY");   // the pattern to search for
     	    Matcher m = pat.matcher(finaloutput);
     	    
     	    // now try to find at least one match
     	    if (m.find())
     	    {
     	    	
     	      System.out.println("CZTPIXCLEAN COMPLETED SUCCESSFULLY");
     	     buffer.append("<filepath>" +"CZTPIXCLEAN COMPLETED SUCCESSFULLY"+ "</filepath>\n");
     	    for(File f: files){
     	    	if (!f.isDirectory())
     	           f.delete();
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
    	      buffer.append("<filepath>" + finaloutput + "</filepath>\n");
    	      for(File f: files){
	     	    	if (!f.isDirectory())
	     	           f.delete();
	     	    }
    	    }
    	    else {
    	      //System.out.println("Did not find a match");
    	    }
       
    }*/
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
