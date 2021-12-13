package semi.gaip.util.sh;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Utility {
	public static String encoding(String str){

	       String encodingString = "";

	       try{
	          MessageDigest sh = MessageDigest.getInstance("SHA-256");
	          sh.update(str.getBytes());
	          byte byteData[] = sh.digest();
	          StringBuffer sb = new StringBuffer();
	          for(int i = 0 ; i < byteData.length ; i++){
	              sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
	          }

	          encodingString = sb.toString();

	      }catch(NoSuchAlgorithmException e){
	         
	          System.out.println("Error");
	          encodingString = null;
	      }

	      return encodingString;
	    } 
	 }

