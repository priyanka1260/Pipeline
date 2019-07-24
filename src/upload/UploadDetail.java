package upload;


import java.io.Serializable;
import java.text.NumberFormat;
import java.util.Date;
import java.util.Locale;

/*public class UploadDetail implements Serializable {

	*//**
	 * 
	 *//*
	private static final long serialVersionUID = 1L;

	private String fileName;
	private long fileSize;
	private String uploadStatus;

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getUploadStatus() {
		return uploadStatus;
	}

	public void setUploadStatus(String uploadStatus) {
		this.uploadStatus = uploadStatus;
	}

	
}*/
public class UploadDetail implements Serializable {


	private static final long serialVersionUID = 1L;

	private String fileName;
	private String filePath;
	private long fileSize;
	String strSize = ""; 
	private String date;
	

	public String getName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String length() {
		return strSize;
	}
	public void setFileSize(long fileSize) {
		
		/*long fileSizeInKB = fileSize / 1024;
		// Convert the KB to MegaBytes (1 MB = 1024 KBytes)
		long fileSizeInMB = fileSizeInKB / 1024;*/
		//this.fileSize = fileSizeInMB;
	    long kb = 1024; // Kilobyte  
	    long mb = 1024 * kb; // Megabyte  
	    long gb = 1024 * mb; // Gigabyte  
	  
	    Locale currentLocale = Locale.getDefault();  
	    NumberFormat formatter = NumberFormat.getNumberInstance(currentLocale);  
	    formatter.setMaximumFractionDigits(2);  
	    formatter.setMinimumFractionDigits(2);  
	  
	    if (fileSize < kb) {  
	        strSize = fileSize + " bytes";  
	    } else if (fileSize < mb) {  
	        strSize = formatter.format(fileSize / kb) + " KB";  
	    } else if (fileSize < gb){  
	        strSize = formatter.format(fileSize / mb) + " MB";  
	    } else {  
	        strSize = formatter.format(fileSize / gb) + " GB";  
	    }  
	  
	    //return strSize;  
	    this.strSize = strSize;
		//
		
	}

	public String getAbsolutePath() {
		return filePath;
	}
	public void setAbsolutePath(String filePath) {
		
		this.filePath = filePath;
	}
	public String lastdate() {
		return date;
	}
	public void setlastdate(String date) {
		this.date = date;
	}
	
	
}