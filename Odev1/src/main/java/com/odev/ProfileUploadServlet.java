package com.odev;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import com.odev.entities.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@SuppressWarnings("serial")
@WebServlet("/ProfileUploadServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class ProfileUploadServlet extends HttpServlet {
    String UPLOAD_DIR = "Uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;

        String id = request.getParameter("id");
        if (id == null || id.isEmpty()) {
            throw new ServletException("Kullanıcı ID'si geçersiz.");
        }

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            if (!uploadDir.mkdir()) {
                throw new ServletException("Yükleme klasörü oluşturulamadı: " + uploadPath);
            }
        }

        boolean isFileUploaded = false;
        try {
            for (Part part : request.getParts()) {
                String fileName = part.getSubmittedFileName();
                if (fileName != null && !fileName.trim().isEmpty()) {
                    String sanitizedFileName = Paths.get(fileName).getFileName().toString(); // Temiz bir dosya adı al
                    String filePath = uploadPath + File.separator + sanitizedFileName;

                    part.write(filePath);
                    isFileUploaded = true;

                    String picturePath = UPLOAD_DIR + "/" + sanitizedFileName;

                    UserAppService userAppService = new UserAppService();
                    boolean isSave = userAppService.updateProfilePicture(id, picturePath);

                    if (!isSave) {
                        throw new ServletException("Profil resmi veritabanına kaydedilemedi.");
                    }

                    HttpSession mySession = request.getSession();

                    Object sessionUser = mySession.getAttribute("user");
                    if (sessionUser instanceof User) {
                    	((User) sessionUser).setPicture(picturePath);;
                    }
                }
            }
        } catch (IOException | ServletException e) {
            throw new ServletException("Dosya yükleme işlemi sırasında hata oluştu.", e);
        }


        if (!isFileUploaded) {
            throw new ServletException("Dosya yüklenemedi, lütfen bir dosya seçin.");
        }

        response.sendRedirect("Profile.jsp");
    }

}
