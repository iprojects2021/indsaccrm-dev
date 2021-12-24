/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package menu;

import java.util.Locale;

/**
 *
 * @author Dell
 */
public class File {
    public static String getCorrectFileSize(long filesize){
        String size="";
    if(filesize>1024 && filesize<(1024*1024) ){filesize=filesize/1024; size=filesize +" KB";return size;}
   if(filesize>(1024*1024) && filesize<(1024*1024*1024) ){filesize=filesize/(1024*1024); size=filesize +" MB";return size;}
    if(filesize>(1024*1024*1024) && filesize<(1024*1024*1024*1024) ){filesize=filesize/(1024*1024*1024); size=filesize +" GB";return size;}
   
    return size;}
    
    public static String getFileExtensionFA(String filename){
        String size="";filename=filename.toLowerCase(Locale.US);
  if( filename.endsWith(".xlsx") || filename.endsWith(".xlsm") || filename.endsWith(".xlsb") || filename.endsWith(".xltx") || filename.endsWith(".xltm"))
  {return "-excel-o";}
 if(filename.endsWith(".pdf") )
  {return "-pdf-o";}
  if( filename.endsWith(".doc") || filename.endsWith(".dot") || filename.endsWith(".wbk") || filename.endsWith(".docx") || filename.endsWith(".docm")|| filename.endsWith(".dotx") || filename.endsWith(".dotm") || filename.endsWith(".docb"))
  {return "-word-o";}
  
   if( filename.endsWith(".jpeg") || filename.endsWith(".jpg") || filename.endsWith(".gif") || filename.endsWith(".tiff") || filename.endsWith(".psd")|| filename.endsWith(".eps") || filename.endsWith(".raw") || filename.endsWith(".png"))
  {return "-image-o";}
   
      if( filename.endsWith(".txt") || filename.endsWith(".text") )
  {return "-text";}
         if( filename.endsWith(".zip") || filename.endsWith(".war") )
  {return "-zip-o";}
    return size;}
}
