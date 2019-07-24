package upload;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class level1download
 */
@WebServlet("/level1download")
public class level1download extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String UPLOAD_DIR = "/home/assc/level1files";

    /**
     * @see HttpServlet#HttpServlet()
     */
    public level1download() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fileName = request.getParameter("fileName");
		//String applicationPath = getServletContext().getRealPath("");
		String uploadPath = UPLOAD_DIR;
		String filePath = uploadPath + File.separator + fileName;
		File file = new File(filePath);
		FileInputStream inputStream = null;
		if (file.exists()) {
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition","attachment;filename="+fileName);
			try {
				inputStream = new FileInputStream(file);
				byte[] buffer = new byte[1024 * 100];
				while (inputStream.read(buffer) != -1) {
					response.getOutputStream().write(buffer);
				}
				response.getOutputStream().close();
			} finally {
				if (inputStream != null) {
					inputStream.close();
				}
			}
		}else{
			response.setContentType("text/html");
			response.getWriter().write("<h3>File "+fileName+" is not present</h3>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
