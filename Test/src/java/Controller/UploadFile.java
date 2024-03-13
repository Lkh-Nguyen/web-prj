
package Controller;
import java.io.File;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/UploadFileServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, 
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 50) 
public class UploadFile extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            fileName = new File(fileName).getName();
            File imagesDir = new File(getServletContext().getRealPath("/nameFile"));
                if (!imagesDir.exists()) {
                imagesDir.mkdirs();
            }
           
            String uploadPath = getServletContext().getRealPath("/nameFile") + File.separator + fileName;

            part.write(uploadPath);
            request.setAttribute("uploadedFilePath", fileName);
            break;
        }
        if(request.getParameter("check").equals("1")){
            getServletContext().getRequestDispatcher("/full_admin_service.jsp").forward(request, response);
        }else{
            getServletContext().getRequestDispatcher("/full_admin_film.jsp").forward(request, response);
        }
    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
