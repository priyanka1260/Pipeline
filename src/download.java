import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/download")
public class download extends HttpServlet{
	
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		doPost(request, response);
		
		
	}
	
	
	
	
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
	
		String homedir = System.getenv("HOME");
	         String path = homedir+"/full_pipeline/";
		
		
		File directory = new File(path);
        String[] files = directory.list();
       
	     List<File> fileList = new ArrayList<File>();
	     getAllFiles(directory, fileList);
        //check if directories have files
	     
        if (files != null && files.length > 0) {
           
           
           
           
            // Sends the response back to the user / browser with zip content
            ServletOutputStream sos = response.getOutputStream();
            response.setContentType("application/zip");
            response.setHeader("Content-Disposition", "attachment; filename=\"DATA_directory.ZIP\"");
            
            //create zip stream
            //byte[] zip = zipFiles(directory, files, sos);
            
            ZipOutputStream zos = new ZipOutputStream(sos);

            for (File file : fileList) {
				if (!file.isDirectory()) { // we only zip files, not directories
					 zipFiles(directory, file, zos);
				}
			}
            
           // zipFiles(directory, files, sos);
            //sos.write(zip);
            
            zos.flush();
            zos.close();
            
            
            sos.flush();
        }
	    
 	    	
 	  
        /*request.setAttribute("DownloadMessage", "Successfully");
        request.getRequestDispatcher("DownloadZipFile.jsp").forward(request, response);*/
       
    }
	public static void getAllFiles(File dir, List<File> fileList) {
		try {
			File[] files = dir.listFiles();
			for (File file : files) {
				fileList.add(file);
				if (file.isDirectory()) {
					System.out.println("directory:" + file.getCanonicalPath());
					getAllFiles(file, fileList);
				} else {
					System.out.println("     file:" + file.getCanonicalPath());
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

   
    //private byte[] zipFiles(File directory, String[] files, ServletOutputStream sos) throws IOException {
	private void zipFiles(File directory, File file, ZipOutputStream zos) throws IOException {
        //ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ///////ZipOutputStream zos = new ZipOutputStream(sos);
        //byte bytes[] = new byte[4096];
       
       // for (File fileName : files) {
        	

            try (FileInputStream fis = new FileInputStream(file);
            		Scanner scanner = new Scanner(fis)){
            		String fileName=file.getCanonicalPath().substring(directory.getCanonicalPath().length() + 1,
            				file.getCanonicalPath().length());
                    //BufferedInputStream bis = new BufferedInputStream(fis)) {
            		System.out.println("Writing '" + fileName + "' to zip file");
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
                
        //}
        //zos.flush();
        //baos.flush();
        //zos.close();
       // baos.close();
       
        //return baos.toByteArray();
    }
}

