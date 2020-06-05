package Controller;

import DAO.CourseDAO;
import Model.Course;
import Model.User;
import Util.Constants;
import Util.Global;
import Util.HashPassword;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Mateus Andreatta
 */
public class CadastroCursoController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        if (isMultipart) {

            User user = Global.getUser(request, response);
            if (Global.checkPermission(user, Constants.Role.PROFESSOR)) {
                Course course = new Course();
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                course.setOwner(user.getId());
                try {
                    // Parse the request
                    List items = upload.parseRequest(request);
                    Iterator iterator = items.iterator();
                    while (iterator.hasNext()) {
                        FileItem item = (FileItem) iterator.next();
                        if (!item.isFormField()) {
                            String fileName = item.getName();
                            fileName = System.currentTimeMillis() + fileName;
                            String root = getServletContext().getRealPath("/");
                            root = root.replace("\\build", "");// Retira ele da pasta build
                            File path = new File(root + "imgs/uploads");
                            if (!path.exists()) {
                                boolean status = path.mkdirs();
                            }
                            File uploadedFile = new File(path + "/" + fileName);
                            System.out.println(uploadedFile.getAbsolutePath());
                            item.write(uploadedFile);
                            course.setImagePath(fileName);
                        } else {
                            switch (item.getFieldName()) {
                                case "nome":
                                    System.out.println(item.getString());
                                    course.setName(item.getString());
                                    break;
                                case "descricao":
                                    System.out.println(item.getString());
                                    course.setDescription(item.getString());
                                    break;
                                case "preco":
                                    System.out.println(item.getString());
                                    course.setPrice(Float.parseFloat(item.getString()));
                                    break;
                                case "porcentagem":
                                    System.out.println(item.getString());
                                    course.setCashbackPercentage(Integer.parseInt(item.getString()));
                                    break;
                            }
                        }
                    }
                } catch (FileUploadException e) {
                    e.printStackTrace();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                //TODO o curso ja vem todo preenchido, basta apenas mandar ele na DAO para inserir no banco 
                try{
                    CourseDAO courseDao = new CourseDAO();
                    courseDao.create(course);
                }catch(Exception ex){
                    response.sendRedirect("Pages/erro.jsp");
                }
                
                response.sendRedirect("Pages/meusCursos.jsp");
            } else {
                response.sendRedirect("Pages/home.jsp");
            }

//            request.setCharacterEncoding("UTF-8");
        } else {
            response.sendRedirect("Pages/home.jsp");
        }

    }
}
