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
public class Contact {
       public static String statusLeadColor(String colortype){
    String color="";
    
    if("Open".equalsIgnoreCase(colortype)){return "info";}
    if("Attempted Contact".equalsIgnoreCase(colortype)){return "warning";}
    if("Not Engaged".equalsIgnoreCase(colortype)){return "default";}
    if("Needs Follow Up".equalsIgnoreCase(colortype)){return "warning";}
    if("Working".equalsIgnoreCase(colortype)){return "primary";}
    if("New Oppurtunity".equalsIgnoreCase(colortype)){return "info";}
    if("Qualified".equalsIgnoreCase(colortype)){return "success";}
    if("Disqualified".equalsIgnoreCase(colortype)){return "danger";}
    if("Customer".equalsIgnoreCase(colortype)){return "success";}
    if("Lead".equalsIgnoreCase(colortype)){return "info";}
    if("New".equalsIgnoreCase(colortype)){return "primary";}
     if("Active".equalsIgnoreCase(colortype)){return "info";}
    if("InActive".equalsIgnoreCase(colortype)){return "primary";}
    else { return "";}
    }
       
         
}
