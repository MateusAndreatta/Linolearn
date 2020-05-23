package Util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class HashPassword 
{
    public static String hashPassword(String password) throws NoSuchAlgorithmException
    {
        MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
        messageDigest.update(password.getBytes());
        
        String encryptedString = new String(messageDigest.digest());
        
        return encryptedString;
    }
}
