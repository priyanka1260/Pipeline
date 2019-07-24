

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class cztgtigen
 */
@WebServlet("/cztgtigen")
public class cztgtigen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cztgtigen() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		//String mkfthreshold=request.getParameter("mkfthreshold");
		//System.out.println("mkfthreshold======"+mkfthreshold);
		/*String eventfile=request.getParameter("eventfile");		
		
		System.out.println("eventfile========"+eventfile);
		
		
		String mkffile=request.getParameter("mkffile");
		System.out.println("mkffile========"+mkffile);
		
		
		String mkfthreshold=request.getParameter("mkfthreshold");
		System.out.println("mkfthreshold======"+mkfthreshold);
		
		String gtifile=request.getParameter("gtifile");
		System.out.println("gtifile======"+gtifile);
		
		String userdefine=request.getParameter("userdefine");
		System.out.println("userdefine======"+userdefine);
		
		
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
	    File file = new File("/home/assc/upload/");
	     File[] files = file.listFiles();
	     String eventfile = null;
	     String mkffile= null;
	     String userdefine= null;
	     //ArrayList <String> names=new ArrayList<String>();

	     for(File f: files){
	    	 System.out.println("--------------------------------------------files"+f);
	    	 String absolutePath = f.getAbsolutePath();
	 	    System.out.println("File path : " + absolutePath);
	 	   String[] parts = absolutePath.split("/");
				String lastWord = parts[parts.length - 1];
				System.out.println(lastWord);
				if (lastWord.endsWith("level2_bc.evt"))
				{
					eventfile=absolutePath;
					System.out.println("eventfile========"+eventfile);
					
					/* String userName = request.getParameter("sciencefile");
				   if(userName!=null && !"".equals(userName))
						   { 
				         request.getSession().setAttribute("sciencefile",userName);
				   } */
					//out.println(fits);
					
				}
				if (lastWord.endsWith("level2.mkf"))
				{
					mkffile=absolutePath;
					System.out.println("mkffile========" + mkffile);
					
					//out.println(tct);
					
				}
				if (lastWord.endsWith("userdefine.gti"))
				{
					userdefine=absolutePath;
					System.out.println("userdefine========" + userdefine);
				}
				
	 	   //names.add(absolutePath);
				
	  
	     }
	     Cookie cookie = null;
	      Cookie[] cookies = null;
	    
	      String gtifile=null;

	      String history=null;
	      String write=null;
	   
	      
	      // Get an array of Cookies associated with this domain
	      cookies = request.getCookies();
	      
	      if( cookies != null ) {
	          //System.out.println("<h2> Found Cookies Name and Value</h2>");

	          for (int i = 0; i < cookies.length; i++) {
	             cookie = cookies[i];
	             System.out.println("Name---"+cookie.getName( ));
	             System.out.println("value---"+cookie.getValue( ));
	            

	             if (cookie.getValue( ).endsWith("level2.gti"))
	             {
	            	 gtifile=cookie.getValue( );
	            	 gtifile="/home/assc/download/4_level2M/"+gtifile; 
	            	 System.out.println("evt-----------------------------------------------------"+gtifile);
	             }
	             if (cookie.getName( ).equals("userdefine"))
	             {   if (cookie.getValue( ).equalsIgnoreCase("-"))
	                 {
	            	 userdefine=cookie.getValue( );
	            	 //userdefine="/home/assc/download/4_level2M/"+userdefine; 
	            	 System.out.println("userdefine-----------------------------------------------------"+userdefine);
	                 }
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
        	 int index = 0;
	        String status;
	        String s1=null;
	        Process p = Runtime.getRuntime().exec("cztgtigen "+eventfile+" "+mkffile+" "+"/home/assc/Downloads/czti_pipeline/CZTI/czti/paramfiles/mkfThresholds.txt"+" "+gtifile+" "+userdefine+" "+history+" "+write+"");
	        System.out.println("cztgtigen "+eventfile+" "+mkffile+" "+"/home/assc/Downloads/czti_pipeline/CZTI/czti/paramfiles/mkfThresholds.txt"+" "+gtifile+" "+userdefine+" "+history+" "+write+"");
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
     	    	
     	      System.out.println("CZTGTIGEN COMPLETED SUCCESSFULLY");
     	     buffer.append("<filepath>" +"CZTGTIGEN COMPLETED SUCCESSFULLY"+ "</filepath>\n");
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
