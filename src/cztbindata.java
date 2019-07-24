

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.GregorianCalendar;
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

import org.apache.commons.io.FileUtils;

/**
 * Servlet implementation class cztbindata
 */
@WebServlet("/cztbindata")
public class cztbindata extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cztbindata() {
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

		/*tring eventfile=request.getParameter("eventfile");				
		System.out.println("eventfile========"+eventfile);		
		
		String attitudemkffile=request.getParameter("attitudemkffile");
		System.out.println("attitudemkffile========"+attitudemkffile);		
		
		String badpixfile=request.getParameter("badpixfile");
		System.out.println("badpixfile======"+badpixfile);
		
		String livetimefile=request.getParameter("livetimefile");
		System.out.println("livetimefile======"+livetimefile);
		
		String outputfile=request.getParameter("outputfile");
		System.out.println("outputfile======"+outputfile);
		
		String maskweightfile=request.getParameter("maskweightfile");
		System.out.println("quadrant======"+maskweightfile);
		
		String weight=request.getParameter("weight");
		System.out.println("weight======"+weight);
		
		String RA=request.getParameter("RA");
		System.out.println("RA======"+RA);
		
		String DEC=request.getParameter("DEC");
		System.out.println("DEC======"+DEC);
		
		String badthreshold=request.getParameter("badthreshold");
		System.out.println("badthreshold======"+badthreshold);
		
		String type=request.getParameter("type");
		System.out.println("type======"+type);
		
		String timebin=request.getParameter("timebin");
		System.out.println("timebin======"+timebin);
		
		String energyrange=request.getParameter("energyrange");
		System.out.println("energyrange======"+energyrange);
		
		
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
	     String attitudemkffile= null;
	     String badpixfile= null;
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
				if (lastWord.endsWith("level2_quad_clean.evt"))
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
				if (lastWord.endsWith("level2.mkf"))
				{
					attitudemkffile=absolutePath;
					System.out.println("attitudemkffile========" + attitudemkffile);

					//out.println(tct);

				}
				if (lastWord.endsWith("level2_quad_badpix.fits"))
				{
					badpixfile=absolutePath;
					System.out.println("badpixfile========" + badpixfile);

					//out.println(tct);

				}
				if (lastWord.endsWith("level2_quad_livetime.fits"))
				{
					livetimefile=absolutePath;
					System.out.println("livetimefile========" + livetimefile);

					//out.println(tct);

				}


	 		 }


	 	   //names.add(absolutePath);

	 	  }

	    }
	    		}
	     else if (serverClicked.equalsIgnoreCase("true"))
	     {

	    	 System.out.println("---------------inside SERVER------------------------------------------------");
	    	 File file2 = new File(homedir+"/level2files/");
		     File[] files2 = file2.listFiles();

		     for(File f2: files2){
		    	 System.out.println("--------------files-----------------"+f2);
		    	 String absolutePath2 = f2.getAbsolutePath();
		 	    //System.out.println("File path : " + absolutePath);
		 	   String[] parts2 = absolutePath2.split("/");
		 	  String lastWord2 = parts2[parts2.length - 1];
		 	  //String[] part = lastWord.split("_");

		 	  System.out.println("--------------part----------"+lastWord2);
		 	if (lastWord2.endsWith("level2_quad_clean.evt"))
				{

					eventfile=absolutePath2;

					System.out.println("eventfile========"+eventfile);

					 String userName = request.getParameter("sciencefile");
				   if(userName!=null && !"".equals(userName))
						   {
				         request.getSession().setAttribute("sciencefile",userName);
				   }
					//out.println(fits);

				}
				if (lastWord2.endsWith("level2.mkf"))
				{
					attitudemkffile=absolutePath2;
					System.out.println("attitudemkffile========" + attitudemkffile);

					//out.println(tct);

				}
				if (lastWord2.endsWith("level2_quad_badpix.fits"))
				{
					badpixfile=absolutePath2;
					System.out.println("badpixfile========" + badpixfile);

					//out.println(tct);

				}
				if (lastWord2.endsWith("level2_quad_livetime.fits"))
				{
					livetimefile=absolutePath2;
					System.out.println("livetimefile========" + livetimefile);

					//out.println(tct);

				}




		     }


	     }

	     //ArrayList <String> names=new ArrayList<String>();

	     /*for(File f: files){
	    	 System.out.println("--------------------------------------------files"+f);
	    	 String absolutePath = f.getAbsolutePath();
	 	    System.out.println("File path : " + absolutePath);
	 	   String[] parts = absolutePath.split("/");
				String lastWord = parts[parts.length - 1];
				System.out.println(lastWord);
				if (lastWord.endsWith("level2_quad_clean.evt"))
				{
					eventfile=absolutePath;
					System.out.println("eventfile========"+eventfile);
					
					/* String userName = request.getParameter("sciencefile");
				   if(userName!=null && !"".equals(userName))
						   { 
				         request.getSession().setAttribute("sciencefile",userName);
				   } 
					//out.println(fits);
					
				}
				if (lastWord.endsWith("level2.mkf"))
				{
					attitudemkffile=absolutePath;
					System.out.println("attitudemkffile========" + attitudemkffile);
					
					//out.println(tct);
					
				}
				if (lastWord.endsWith("level2_quad_badpix.fits"))
				{
					badpixfile=absolutePath;
					System.out.println("badpixfile========" + badpixfile);
					
					//out.println(tct);
					
				}
				if (lastWord.endsWith("level2_quad_livetime.fits"))
				{
					livetimefile=absolutePath;
					System.out.println("livetimefile========" + livetimefile);
					
					//out.println(tct);
					
				}
	 	   //names.add(absolutePath);
				
	  
	     }*/
	     Cookie cookie = null;
	      Cookie[] cookies = null;

	      String outputfile=null;
	      String maskweightfile=null;
	      String weight=null;
	      String RA=null;
	      String DEC=null;
	      String badthreshold=null;
	      String type=null;
	      String timebin=null;
	      String energyrange=null;
	      String history=null;
	      String write=null;
	      
	      // Get an array of Cookies associated with this domain
	      cookies = request.getCookies();
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


	             if (cookie.getValue( ).endsWith("level2_quad_clean"))
	             {
	            	 outputfile=cookie.getValue( );
	            	outputfile=path1+outputfile;
	            	 System.out.println("evt-----------------------------------------------------"+outputfile);
	             }
	             if (cookie.getValue( ).endsWith("level2_quad_clean_weight.evt"))
	             {
	            	 maskweightfile=cookie.getValue( );
	            	 maskweightfile=path1+maskweightfile;
	            	 System.out.println("evt-----------------------------------------------------"+maskweightfile);
	             }
	             if (cookie.getName( ).equals("weight"))
	             {
	            	 weight=cookie.getValue( );
	            	
	            	 System.out.println("evt-----------------------------------------------------"+weight);
	             }
	             if (cookie.getName( ).equals("RA"))
	             {
	            	 RA=cookie.getValue( );
	            	
	            	 System.out.println("evt-----------------------------------------------------"+RA);
	             }
	             if (cookie.getName( ).equals("DEC"))
	             {
	            	 DEC=cookie.getValue( );
	            	
	            	 System.out.println("evt-----------------------------------------------------"+DEC);
	             }
	             if (cookie.getName( ).equals("badthreshold"))
	             {
	            	 badthreshold=cookie.getValue( );
	            	
	            	 System.out.println("evt-----------------------------------------------------"+badthreshold);
	             }
	             if (cookie.getName( ).equals("type"))
	             {
	            	 type=cookie.getValue( );
	            	
	            	 System.out.println("evt-----------------------------------------------------"+type);
	             }
	             if (cookie.getName( ).equals("timebin"))
	             {
	            	 timebin=cookie.getValue( );
	            	
	            	 System.out.println("evt-----------------------------------------------------"+timebin);
	             }
	             if (cookie.getName( ).equals("energyrange"))
	             {
	            	 energyrange=cookie.getValue( );
	            	
	            	 System.out.println("evt-----------------------------------------------------"+energyrange);
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
	        System.out.println("cztbindata "+"inevtfile="+eventfile+" "+"mkffile="+attitudemkffile+" "+"badpixfile="+badpixfile+" "+"livetimefile="+livetimefile+" "+"outfile="+outputfile+" "+"outevtfile="+maskweightfile+" "+"maskWeight="+weight+" "+"rasrc="+RA+" "+"decsrc="+DEC+" "+"badpixThreshold="+badthreshold+" "+"outputtype="+type+" "+"timebinsize="+timebin+" "+"energyrange="+energyrange+" "+"history="+history+" "+"clobber="+write+"");
	        Process p = Runtime.getRuntime().exec("cztbindata "+"inevtfile="+eventfile+" "+"mkffile="+attitudemkffile+" "+"badpixfile="+badpixfile+" "+"livetimefile="+livetimefile+" "+"outfile="+outputfile+" "+"outevtfile="+maskweightfile+" "+"maskWeight="+weight+" "+"rasrc="+RA+" "+"decsrc="+DEC+" "+"badpixThreshold="+badthreshold+" "+"outputtype="+type+" "+"timebinsize="+timebin+" "+"energyrange="+energyrange+" "+"history="+history+" "+"clobber="+write+"");
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
				if (status.contains("CZTBUNCHCLEAN COMPLETED SUCCESSFULLY"))
				{
					flag=1;
					String pathformove="cp "+outputfile+" "+livetimefile+" "+homedir+"/level2files/";
					Process p1=Runtime.getRuntime().exec(pathformove);


				

				//System.out.println("OutputstringBuffer\n"+s1);

					
				}
				 index++;
				}

				if (flag == 1)
				{
					try {
			   	           MimeMessage message = new MimeMessage(mailSession);
			   	           message.setFrom(new InternetAddress(from));
			   	           message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
			   	           message.setSubject("cztbunchclean COMPLETED SUCCESSFULLY");
			   	           message.setText("CZTBUNCHCLEAN COMPLETED SUCCESSFULLY");
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
     	    	
     	      System.out.println("CZTBINDATA COMPLETED SUCCESSFULLY");
     	     buffer.append("<filepath>" +"CZTBINDATA COMPLETED SUCCESSFULLY"+ "</filepath>\n");
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

