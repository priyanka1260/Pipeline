
import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Scanner;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

@WebServlet("/download1")
public class download1 extends HttpServlet{
	
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		doPost(request, response);
		
		
	}
	
	
	
	
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		String userid = (String) request.getSession().getAttribute("userId");
		String r = request.getParameter("button");
		System.out.println("usename : " + userid);
		 String path=null;
		 String homedir = System.getenv("HOME");
		// boolean success = false;
		 String uname=(String) request.getSession().getAttribute("uname");
		 
	
		 File file1 = new File(homedir+"/download/");
	     File[] files1 = file1.listFiles();

		  for(File f: files1){
		    	 System.out.println("--------------------------------------------files"+f);
		    	 String absolutePath = f.getAbsolutePath();
		 	    System.out.println("File path : " + absolutePath);
		 	   String[] parts = absolutePath.split("/");
		 	  String lastWord = parts[parts.length - 1];
		 	  String[] part = lastWord.split("_");
		 	  
		 	  System.out.println(part[1]);
		 	  
		 	  if (uname.equals(part[1]))
		 	  {
		 		  path=absolutePath;
		 	  }
		 	  
		  }
		 //String filename="session_"+uname;
		 ///path=homedir+"/download/"+filename;
		/* File theDir = new File(path);
			success = theDir.mkdir();
			
			if (success) {
		        System.out.printf("Successfully created new directory");
		    } else {
		        System.out.printf("Failed to create new directory");
		    }*/
		    
		
		/*if (userid.equalsIgnoreCase("cztscience2event.jsp"))
		{
			path = homedir+"/download/1_level2M/";
		}
		else if (userid.equalsIgnoreCase("cztbunchclean.jsp"))
		{
			path = homedir+"/download/2_level2M/";
		}
		else if (userid.equalsIgnoreCase("cztpha2energy.jsp"))
		{
			path =homedir+ "/download/3_level2M/";
		}
		else if (userid.equalsIgnoreCase("cztigen.jsp"))
		{
			path = homedir+"/download/4_level2M/";
		}
		else if (userid.equalsIgnoreCase("cztgaas.jsp"))
		{
			path = homedir+"/download/5_level2M/";
		}
		else if (userid.equalsIgnoreCase("cztdatasel.jsp"))
		{
			path = homedir+"/download/6_level2M/";
		}
		else if (userid.equalsIgnoreCase("cztpixclean.jsp"))
		{
			path = homedir+"/download/7_level2M/";
		}
		else if (userid.equalsIgnoreCase("cztevtclean.jsp"))
		{
			path = homedir+"/download/8_level2M/";
		}
		else if (userid.equalsIgnoreCase("cztdpigen.jsp"))
		{
			path = homedir+"/download/9_level2M/";
		}
		else if (userid.equalsIgnoreCase("cztimage.jsp"))
		{
			path = homedir+"/download/10_level2M/";
		}
		else if (userid.equalsIgnoreCase("cztbindata.jsp"))
		{
			path = homedir+"/download/11_level2M/";
		}
		else if (userid.equalsIgnoreCase("cztrspigen.jsp"))
		{
			path = homedir+"/download/12_level2M/";
		}
		else if (userid.equalsIgnoreCase("cztflagbadpix.jsp"))
		{
			path = homedir+"/download/13_level2M/";
		}*/
	    System.out.println(path);
		File directory = new File(path);
        String[] files = directory.list();
        //System.out.println();
        //File file = new File(path);
	     //File[] files2 = file.listFiles();
        //check if directories have files
        if (files != null && files.length > 0) {
           
           
           
           
            // Sends the response back to the user / browser with zip content
            ServletOutputStream sos = response.getOutputStream();
            response.setContentType("application/zip");
            response.setHeader("Content-Disposition", "attachment; filename=\"OUTPUT_DATA.ZIP\"");
            
            //create zip stream
            //byte[] zip = zipFiles(directory, files, sos);

            
            
            zipFiles(directory, files, sos);
            //sos.write(zip);
            System.out.println("upload directory SUCCESSFULLY DELETED");
            File f = new File(path);
    		if(f.exists())
    		{
    			 FileUtils.deleteDirectory(f); 
    			  System.out.println("upload directory SUCCESSFULLY DELETED");
    		
    		}
    		sos.flush();
            
        }
        System.out.println("upload directory SUCCESSFULLY DELETED======================");
       // for(File f: files1){
			//String absolutePath =f.getAbsolutePath();
			
		//}
        //for(File f: files1){
 	    	//if (!f.isDirectory())
 	          // f.delete();
 	   // }
        /*request.setAttribute("DownloadMessage", "Successfully");
        request.getRequestDispatcher("DownloadZipFile.jsp").forward(request, response);*/
       
    }
   
    //private byte[] zipFiles(File directory, String[] files, ServletOutputStream sos) throws IOException {
	private void zipFiles(File directory, String[] files, ServletOutputStream sos) throws IOException {
        //ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ZipOutputStream zos = new ZipOutputStream(sos);
        //byte bytes[] = new byte[4096];
       
        for (String fileName : files) {
        	

            try (FileInputStream fis = new FileInputStream(directory.getPath() + "/" + fileName);
            		Scanner scanner = new Scanner(fis)){
            		
                    //BufferedInputStream bis = new BufferedInputStream(fis)) {
               
                		zos.putNextEntry(new ZipEntry(fileName));
               
               /* int bytesRead;
                while ((bytesRead = bis.read(bytes)) != -1) {
                    zos.write(bytes, 0, bytesRead);
                }*/
            		
            		while(scanner.hasNext()){
            			zos.write(scanner.next().getBytes());
            			
            		}
            		
            		zos.closeEntry();
            		zos.flush();
            		//sos.write(b)
        			//baos.flush();
            //}
                
                
            }         
                
        }
        zos.flush();
        //baos.flush();
        zos.close();
       
       // baos.close();
       
        //return baos.toByteArray();
    }
}

