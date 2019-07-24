

import java.io.BufferedReader;
import java.io.File;
import java.io.FileFilter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
 * Servlet implementation class pipeline
 */
@WebServlet("/pipeline")
public class pipeline extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public pipeline() {
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

		/*String level1path=request.getParameter("level1path");		
		
		System.out.println("no of pix========="+level1path);
		
		
		String level2path=request.getParameter("level2path");
		System.out.println("input file========"+level2path);
		
		
		String start=request.getParameter("start");
		System.out.println("output file======"+start);
		
		String end=request.getParameter("end");
		System.out.println("output file======"+end);
		
		String ra=request.getParameter("ra");
		System.out.println("output file======"+ra);
		
		String dec=request.getParameter("dec");
		System.out.println("output file======"+dec);
		
		String history=request.getParameter("history");
		System.out.println("output file======"+history);

		String write=request.getParameter("write");
		System.out.println("output file======"+write);*/
		
		   StringBuffer buffer=new StringBuffer("");
		     response.setContentType("text/xml;charset=UTF-8");

		    // out.print("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n");
		     //out.print("<?xml-stylesheet  href=\"style.css\"?>");
		     //out.print("<response>\n");
		     //out.print("<files>\n");
	    //buffer.append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n");
	        //  buffer.append("<?xml-stylesheet  href=\"style.css\"?>");
	    //buffer.append("<response>\n");
	    //buffer.append("<files>\n");
	    //response.setContentType("text/html");
		//StringBuffer buffy=new StringBuffer();
		String homedir = System.getenv("HOME");
        ServletContext servletContext = getServletContext();
		String contextPath = servletContext.getRealPath("/");
	    System.out.println("contextPath....."+contextPath);
	    File file = new File(homedir+"/pipeline_upload/");
	    File[] files = file.listFiles();
	    String dir=homedir+"/pipeline_upload/";
	    File newestFile;
	    boolean success = false;
	    newestFile = lastFileModified(dir);
	    System.out.println("new file:"+newestFile);
	    String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new java.util.Date());
		System.out.println(timeStamp);
		String folderPath = homedir+"/pipeline_upload/" + timeStamp;
		File theDir = new File(folderPath);
		success = theDir.mkdir();
		 String level1Path = null ;
		 
		 
		 if (success) {
		        System.out.printf("Successfully created new directory");
		    } else {
		        System.out.printf("Failed to create new directory");
		    }
		    
		    String b="unzip"+" "+newestFile+" "+"-d"+folderPath;
		    
		   
		    //int returnValue = -1;
		    try {
		    	 Process p1=Runtime.getRuntime().exec(b, null, new File(homedir+"/pipeline_upload/"));
		        p1.waitFor();
		        //returnValue = p1.exitValue();
		        //Thread.sleep(8000);
		    } catch (InterruptedException e) {
		        e.printStackTrace();
		    }
		   // System.out.println("returnvalue---"+returnValue);
		    File dir1 = new File(homedir+"/pipeline_upload/");
		    File max = null;
		    for (File file1 : dir1.listFiles()) {
		        if (file1.isDirectory() && (max == null || max.lastModified() < file1.lastModified())) {
		            max = file1;
		        }
		    }
		    System.out.println("newest dir:"+max);

		    
		    
		    File dir4 = new File(folderPath);
		    
		    System.out.println("dir4:"+dir4.getAbsolutePath());
		      File[] files4 = dir4.listFiles(); 
		      
		      while( files4.length == 0 ){
		    	  
		    	  files4 = dir4.listFiles();
		      }
		    	
		      try{
		    	  
		    	  Thread.sleep(800);
		      }catch(InterruptedException e){
		    	  
		      }
		      
		      
		      
		      
		      System.out.println("length"+files4.length);
		      
		      System.out.println("dir"+files4[0].isDirectory());
		      
		    FileFilter fileFilter = new FileFilter() {
		         public boolean accept(File file) {
		            return file.isDirectory();
		         }
		      };
		      files4 = dir4.listFiles(fileFilter);
		      System.out.println(files4.length);
		      
		      if (files4.length == 0) {
		         System.out.println("Either dir does not exist or is not a directory");
		      } else {
		         for (int i = 0; i< files4.length; i++) {
		            File filename = files4[i];
		            level1Path=filename.toString();
		            System.out.println(filename.toString());
		         }
		      }
		    
		   
		    
		    
		    
	        
		      System.out.println("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh:"+level1Path);
		    Cookie cookie = null;
		      Cookie[] cookies = null;

		      String start=null;
		      String end=null;
		      String RA=null;
		      String DEC=null;
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

		             if (cookie.getName( ).equals("start"))
		             {
		            	 start=cookie.getValue( );
		            	
		            	 System.out.println("evt-----------------------------------------------------"+start);
		             }
		             if (cookie.getName( ).equals("end"))
		             {
		            	 end=cookie.getValue( );
		            	
		            	 System.out.println("evt-----------------------------------------------------"+end);
		             }
		             if (cookie.getName( ).equals("ra"))
		             {
		            	 RA=cookie.getValue( );
		            	
		            	 System.out.println("evt-----------------------------------------------------"+RA);
		             }
		             if (cookie.getName( ).equals("dec"))
		             {
		            	 DEC=cookie.getValue( );
		            	
		            	 System.out.println("evt-----------------------------------------------------"+DEC);
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
	        
	        System.out.println("cztpipeline "+"l1dir="+level1Path+" "+"l2dir="+homedir+"/download/full_pipeline/"+" "+"entrystage="+start+" "+"exitstage="+end+" "+"rasrc="+RA+" "+"decsrc="+DEC+" "+"history="+history+" "+"clobber="+write);
	        Process p = Runtime.getRuntime().exec("cztpipeline "+"l1dir="+level1Path+" "+"l2dir="+homedir+"/full_pipeline/"+" "+"entrystage="+start+" "+"exitstage="+end+" "+"rasrc="+RA+" "+"decsrc="+DEC+" "+"history="+history+" "+"clobber="+write);
	       //Process p = Runtime.getRuntime().exec("python2 uvit9pt.py "+TARGET+" "+RA+" "+DEC+"");
 			
 			//p.waitForProcessOutput()
 			// BufferedReader stdInput = new BufferedReader(new 
 	                 //InputStreamReader(p.getInputStream()));

 	        	    BufferedReader stdError = new BufferedReader(new 
 	                 InputStreamReader(p.getErrorStream()));
			
			//FileWriter fileWriter1 = new FileWriter(file1);
			//fileWriter1.write("\n");
			while ((status = stdError.readLine()) != null)
			{
				// buffer.append("<filepath>" + status + "</filepath>\n");
		//	fileWriter1.write(status);			
			System.out.println(status);
			Pattern pat1 = Pattern.compile("CZTSCIENCE2EVENT COMPLETED SUCCESSFULLY");
			Matcher m = pat1.matcher(status);
			if (m.find() )
     	    {
     	    	System.out.println("mmmmmmmmmmmmmmmmmmmINSIDEmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
     	    	//request.getSession(false).setAttribute("status", "SUCCESSFULLY");
     	    	
     	    	out.print("science2event success");
     	    	/*FileOutputStream fos = new FileOutputStream(new File("/home/assc/filecheck/status2222"));
     	    	fos.write("success".getBytes());  
     	    	fos.close();*/
     	    	//out.print("<filepath>" +"CZTPIPELINE COMPLETED SUCCESSFULLY"+ "</filepath>\n");
     	    	//out.print("</files>\n");
	      		//out.print("<filecount>" + index + "</filecount>\n");
	      		///out.print("</response>\n");
     	    	out.flush();
     	      // out.close();
     	    	
     	    	//flag=1;
     	    }
			Pattern pat2= Pattern.compile("CZTBUNCHCLEAN COMPLETED SUCCESSFULLY");
			Matcher m1= pat2.matcher(status);
			if (m1.find() )
     	    {
     	    	System.out.println("mmmmmmmmmmmmmmmmmmmINSIDEmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
     	    	//request.getSession(false).setAttribute("status", "SUCCESSFULLY");
     	    	out.print("cztbunchclean success");
    
     	    	out.flush();
     	       //out.close();
     	    	
     	    	//flag=1;
     	    }
			Pattern pat3 = Pattern.compile("CZTPHA2ENERGY COMPLETED SUCCESSFULLY");
			Matcher m2 = pat3.matcher(status);
			if (m2.find() )
     	    {
     	    	System.out.println("mmmmmmmmmmmmmmmmmmmINSIDEmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
     	    	//request.getSession(false).setAttribute("status", "SUCCESSFULLY");
     	    	out.print("cztpha2energey success");
  
     	    	out.flush();
     	       //out.close();
     	    	
     	    	//flag=1;
     	    }
			Pattern pat4 = Pattern.compile("CZTGTIGEN COMPLETED SUCCESSFULLY");
			Matcher m3 = pat4.matcher(status);
			if (m3.find() )
     	    {
     	    	System.out.println("mmmmmmmmmmmmmmmmmmmINSIDEmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
     	    	//request.getSession(false).setAttribute("status", "SUCCESSFULLY");
     	    	out.print("cztgtigen success");

     	    	out.flush();
     	      //out.close();
     	    	
     	    	//flag=1;
     	    }
			Pattern pat5 = Pattern.compile("CZTGAAS COMPLETED SUCCESSFULLY");
			Matcher m4 = pat5.matcher(status);
			if (m4.find() )
     	    {
     	    	System.out.println("mmmmmmmmmmmmmmmmmmmINSIDEmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
     	    	//request.getSession(false).setAttribute("status", "SUCCESSFULLY");
     	    	out.print("cztgaas success");
     	
     	    	out.flush();
     	       //out.close();
     	    	
     	    	//flag=1;
     	    }
			Pattern pat6 = Pattern.compile("CZTDATASEL COMPLETED SUCCESSFULLY");
			Matcher m5 = pat6.matcher(status);
			if (m5.find() )
     	    {
     	    	System.out.println("mmmmmmmmmmmmmmmmmmmINSIDEmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
     	    	//request.getSession(false).setAttribute("status", "SUCCESSFULLY");
     	    	out.print("cztdatasel success");
     	    
     	    	out.flush();
     	       //out.close();
     	    	
     	    	//flag=1;
     	    }
			Pattern pat7 = Pattern.compile("CZTPIXCLEAN COMPLETED SUCCESSFULLY");
			Matcher m6 = pat7.matcher(status);
			if (m6.find() )
     	    {
     	    	System.out.println("mmmmmmmmmmmmmmmmmmmINSIDEmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
   
     	    	out.print("cztpixclean success");
     	    
     	    	out.flush();
     	     //out.close();
     	    	
     	 
     	    }
			Pattern pat8 = Pattern.compile("CZTFLAGBADPIX COMPLETED SUCCESSFULLY");
			Matcher m7 = pat8.matcher(status);
			if (m7.find() )
     	    {
     	    	System.out.println("mmmmmmmmmmmmmmmmmmmINSIDEmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
   
     	    	out.print("cztflagbadpix success");
     	    
     	    	out.flush();
     	    	//out.close();
     
     	    	
     	 
     	    }
			Pattern pat9 = Pattern.compile("CZTEVTCLEAN COMPLETED SUCCESSFULLY");
			Matcher m8 = pat9.matcher(status);
			if (m8.find() )
     	    {
     	    	System.out.println("mmmmmmmmmmmmmmmmmmmINSIDEmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
   
     	    	out.print("cztevtclean success");
     	    
     	    	out.flush();
     	    	//out.close();
     
     	    	
     	 
     	    }
			Pattern pat10 = Pattern.compile("CZTDPIGEN COMPLETED SUCCESSFULLY");
			Matcher m9 = pat10.matcher(status);
			if (m9.find() )
     	    {
     	    	System.out.println("mmmmmmmmmmmmmmmmmmmINSIDEmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
   
     	    	out.print("cztdpigen success");
     	    
     	    	out.flush();
     	    	//out.close();
     
     	    	
     	 
     	    }
			Pattern pat11 = Pattern.compile("CZTIMAGE COMPLETED SUCCESSFULLY");
			Matcher m10 = pat11.matcher(status);
			if (m10.find() )
     	    {
     	    	System.out.println("mmmmmmmmmmmmmmmmmmmINSIDEmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
   
     	    	out.print("cztimage success");
     	    
     	    	out.flush();
     	    	//out.close();
     
     	    	
     	 
     	    }
			Pattern pat12 = Pattern.compile("CZTBINDATA COMPLETED SUCCESSFULLY");
			Matcher m11 = pat12.matcher(status);
			if (m11.find() )
     	    {
     	    	System.out.println("mmmmmmmmmmmmmmmmmmmINSIDEmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
   
     	    	out.print("cztbindata success");
     	    
     	    	out.flush();
     	    	//out.close();
     
     	    	
     	 
     	    }
			Pattern pat13 = Pattern.compile("CZTRSPGEN COMPLETED SUCCESSFULLY");
			Matcher m12 = pat13.matcher(status);
			if (m12.find() )
     	    {
     	    	System.out.println("mmmmmmmmmmmmmmmmmmmINSIDEmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
   
     	    	out.print("cztrspgen success");
     	    
     	    	out.flush();
     	    	//out.close();
     
     	    	
     	 
     	    }
			/*buffer.append(status); 
			s1=buffer.toString();
			buffer.append(System.getProperty("line.separator"));
			System.out.println("OutputstringBuffer\n"+s1);*/
			
				 index++;
			}
			
	        p.waitFor();
	        
			 /*String lines[] = s1.split("\n"); 
			 int flag = 0;	
     		//System.out.println(output.contains("COMPLETED SUCCESSFULLY"));
     		 for (String finaloutput:lines) 
     		 {  	
     		
     		 System.out.println(finaloutput);
     		
     		 Pattern pat1 = Pattern.compile("COMPLETED SUCCESSFULLY");   
     		 Pattern pat = Pattern.compile("Processing quadrant 3"); // the pattern to search for
     	    Matcher m = pat.matcher(finaloutput);
     	   Matcher m1 = pat1.matcher(finaloutput);
     	  
     	 
     	 

     	   //System.out.println("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm"+m);
     	 // System.out.println("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm1"+m1);
     	    // now try to find at least one match
     	    if (m.find() )
     	    {
     	    	System.out.println("mmmmmmmmmmmmmmmmmmmINSIDEmmmmmmmmmmmmmmmmmmmmmmm");
     	    	out.print("<filepath>" +"CZTPIPELINE COMPLETED SUCCESSFULLY"+ "</filepath>\n");
     	    	
     	    	//flag=1;
     	    }
     	    	if ((m1.find()) && (flag ==1))
     	    	{
     	      System.out.println("CZTPIPELINE COMPLETED SUCCESSFULLY");
     	     out.print("<filepath>" +"CZTPIPELINE COMPLETED SUCCESSFULLY"+ "</filepath>\n");
     	     //buffer.append("<filepath>" +"CZTPIPELINE COMPLETED SUCCESSFULLY"+ "</filepath>\n");
     	    	}
     	    else {
     	      System.out.println("Did not find a match");
     	    }
     
       
    }*/
     		 
     	
		      
		        //out.println(buffer);
		        
		        
				//fileWriter1.close();
				//stdError.close();
		        //p.waitFor();
		        //out.println(buffer);
		        //out.println(count);
		        out.close();
		        //System.out.println(buffer);
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
        
				/*if (lastWord.endsWith("level2_bc.evt"))
				{
					eventfile=absolutePath;
					System.out.println("eventfile========"+eventfile);
					
					 String userName = request.getParameter("sciencefile");
				   if(userName!=null && !"".equals(userName))
						   { 
				         request.getSession().setAttribute("sciencefile",userName);
				   } 
					//out.println(fits);
					
				}*/
				
	 	   //names.add(absolutePath);
				
	  
        
        
	}
	public static File lastFileModified(String dir) {
	    File fl = new File(dir);
	    File[] files = fl.listFiles(new FileFilter() {          
	        public boolean accept(File file) {
	            return file.isFile();
	        }
	    });
	    long lastMod = Long.MIN_VALUE;
	    File choice = null;
	    for (File file : files) {
	        if (file.lastModified() > lastMod) {
	            choice = file;
	            lastMod = file.lastModified();
	        }
	    }
	    return choice;
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet( request,  response);
	}

}
