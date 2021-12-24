/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 *//*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package simulator;

import blezz.Nd;
import java.io.IOException;

/**
 *
 * @author Dell
 */
public class TestEncDec {
    public static void main(String args[])throws IOException{
    String plainstringkey="tid";
    String plainstringvalue="lead";
    String encryptplainstringkey=Nd.Encrypt(plainstringkey);
     String encryptplainstringvalue=Nd.Encrypt(plainstringvalue);
   
    System.out.println("Key Plain String:  "+plainstringkey);
    System.out.println("Key Encrypted:  "+encryptplainstringkey);
    System.out.println("Decrypted Key Plain String:  "+Nd.Decrypt(encryptplainstringkey));
    
    System.out.println();
     System.out.println("Value Plain String:  "+plainstringvalue);
    System.out.println("Value Encrypted:  "+encryptplainstringvalue);
    System.out.println("Decrypted Value Plain String:  "+Nd.Decrypt(encryptplainstringvalue));
    System.out.println();
    
    //Enter Encrypted code 
    // System.out.println("Decrypted  Plain String:  "+Nd.Decrypt("esfhrttrfhardersg"));
   
    
    }
    
}
