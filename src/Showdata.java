

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Showdata
 */
@WebServlet("/Showdata")
public class Showdata extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Showdata() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String str=request.getParameter("q");
		String homedir = System.getenv("HOME");
		//String lastWord=null;
		response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
	     response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		
		try
        {
			File file = new File(homedir+"/level2files/");
		     File[] files = file.listFiles();
		     //String file1[];
		     //int i=0;
		     for(File f: files){
		    	 System.out.println("--------------------------------------------files"+f);
		    	 String absolutePath = f.getAbsolutePath();
			 	    System.out.println("File path : " + absolutePath);
			 	   String[] parts = absolutePath.split("/");
			 	  String lastWord = parts[parts.length - 1];
			 	  // You want world domination, huh?
			 	 out.write(" ");
			     out.write(lastWord);
			     
			 	 // String part = lastWord.split("_");
			 	 
                //file1[i]=lastWord;
                //i++;
		     }
		     //System.out.println("------------------------tostring--------------------"+out.toString());
		     //System.out.println("--------------------------out------------------"+out.toString());
		     //response.getWriter().write(file1);
                //response.getWriter().write();

        }
        catch(Exception e)
        {

            e.printStackTrace();
        }
		finally
		{
			out.flush();
			out.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
