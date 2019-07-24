

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
 * Servlet implementation class cztflagpic
 */
@WebServlet("/cztflagpic")
public class cztflagpic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cztflagpic() {
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

		/*String number_of_badpix=request.getParameter("number_of_badpix");				
		System.out.println("no of pix========="+number_of_badpix);
				
		String input_badpix=request.getParameter("input_badpix");
		System.out.println("input file========"+input_badpix);
				
		String output_badpix=request.getParameter("output_badpix");
		System.out.println("output file======"+output_badpix);
		
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
        ServletContext servletContext = getServletContext();
		String contextPath = servletContext.getRealPath("/");
	    System.out.println("contextPath....."+contextPath);
	   
	     Cookie cookie = null;
	      Cookie[] cookies = null;

	      String number_of_badpix=null;
	      String output_badpix=null;
	     
	      String history=null;
	      String write=null;
	      
	      // Get an array of Cookies associated with this domain
	      cookies = request.getCookies();
	      
	      if( cookies != null ) {
	          //System.out.println("<h2> Found Cookies Name and Value</h2>");

	          for (int i = 0; i < cookies.length; i++) {
	             cookie = cookies[i];
	             System.out.println("Name---"+cookie.getName( ));
	             //System.out.println("value---"+cookie.getValue( ));

	             if (cookie.getName( ).equals("number_of_badpix"))
	             {
	            	 number_of_badpix=cookie.getValue( );
	            	
	            	 System.out.println("evt-----------------------------------------------------"+number_of_badpix);
	             }
	             if ((cookie.getValue( ).endsWith("level2_quad_badpix.fits_"))||(cookie.getValue( ).endsWith("level2_common_badpix.fits_")))
	             {
	            	 output_badpix=cookie.getValue( );
	            	 output_badpix="/home/assc/download/13_level2M/"+output_badpix; 
	            	 System.out.println("evt-----------------------------------------------------"+output_badpix);
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
	      File file = new File("/home/assc/upload/");
		     File[] files = file.listFiles();
		     String input_badpix = null;
		     //String tctfile= null;
		     //ArrayList <String> names=new ArrayList<String>();
		     int result = Integer.parseInt(number_of_badpix);	
		     for(File f: files){
		    	 System.out.println("--------------------------------------------files"+f);
		    	 String absolutePath = f.getAbsolutePath();
		 	    System.out.println("File path : " + absolutePath);
		 	   String[] parts = absolutePath.split("/");
					String lastWord = parts[parts.length - 1];
					System.out.println(lastWord);
					int i;
					
					for(i=0;i< result;i++)
					{
						String str1 = "level2_quad_badpix_"+i+".fits";
						String str2 = "level2_common_badpix_"+i+".fits";
						
					if ((lastWord.endsWith(str1))||(lastWord.endsWith(str2)))
					{
						if (i==0)
						{
							input_badpix=absolutePath;
						}
						else{
						input_badpix=absolutePath+","+input_badpix;
						}
						System.out.println("input_badpix========"+input_badpix);
						
						
						
					}
					}
					
		 	   //names.add(absolutePath);
					
		  
		     }
	           
        try
		{		
        	 int index = 0;
	        String status;
	        String s1=null;
	        Process p = Runtime.getRuntime().exec("cztflagbadpix "+number_of_badpix+" "+input_badpix+" "+output_badpix+" "+history+" "+write+"");
	        System.out.println("cztflagbadpix "+number_of_badpix+" "+input_badpix+" "+output_badpix+" "+history+" "+write+"");
	       //Process p = Runtime.getRuntime().exec("python2 uvit9pt.py "+TARGET+" "+RA+" "+DEC+"");
 			p.waitFor();			
 			 BufferedReader stdInput = new BufferedReader(new 
 	                 InputStreamReader(p.getInputStream()));

 	        	    BufferedReader stdError = new BufferedReader(new 
 	                 InputStreamReader(p.getErrorStream()));
			
			//FileWriter fileWriter1 = new FileWriter(file1);
			//fileWriter1.write("\n");
			while ((status = stdError.readLine()) != null)
			{
				// buffer.append("<filepath>" + status + "</filepath>\n");
		//	fileWriter1.write(status);			
			System.out.println(status);
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
     	    	
     	      System.out.println("CZTFLAGBADPIX COMPLETED SUCCESSFULLY");
     	     buffer.append("<filepath>" +"CZTFLAGBADPIX COMPLETED SUCCESSFULLY"+ "</filepath>\n");
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
			
		}
        catch (NullPointerException exception)
        {
       
        } catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       // request.getReques
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
