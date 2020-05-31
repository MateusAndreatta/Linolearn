package Util;

import Model.User;
import java.io.IOException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mateus Andreatta
 */
public class Global {
    
    public static User getUser(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        if(session == null){
            try {
                response.sendRedirect("../index.html");
                return null;
            } catch (IOException ex) {
                Logger.getLogger(Global.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        User user = (User) session.getAttribute("user");
        if (user == null) {
            try {
                session.invalidate();
                response.sendRedirect("../index.html");
            } catch (IOException ex) {
                Logger.getLogger(Global.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return user;
    }
    
    public static boolean checkPermission(User user, int level){
        if(user == null){
            return false;
        }
        
        return user.getRole() >= level;
    }
    
    public static void printRequestParameters(HttpServletRequest request){
        Map<String, String[]> parameterMap = request.getParameterMap();
        for(String key : parameterMap.keySet()) {
            System.out.print(key);
            for(String value : parameterMap.get(key)){
                System.out.print(" - " + value);
            }
            System.out.print("\n");
        }}   
}
