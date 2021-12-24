/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package menu;

/**
 *
 * @author Dell
 */
public class Invoice {
        public static String statusInvoiceSettingCityColor(String colortype){
    String color="";
    
     if("Active".equalsIgnoreCase(colortype)){return "success";}
       if("InActive".equalsIgnoreCase(colortype)){return "danger";}
    else { return "";}
    }
    
}
