/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tables;

import log.Log;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 *
 * @author Awesome
 */
public class GetDaterange1 {

   
    

    public String getDateFrom(String date) {
        Log.writeLog("entered getDateFrom");
         String datefrom = "";
        String datefrom1 = date.split("\\ -")[0]; // for splitting the date var in two parts which contains full date range ,
        //this will give first part of the date range
        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
        Date date1;
        try 
        {
            date1 = (Date) new SimpleDateFormat("MM/dd/yyyy").parse(datefrom1);// for converting the string date into the date var
            datefrom = format1.format(date1);// for converting the date var into the yyyy-mm-dd which is requored in db for getting the data
        } 
        catch (ParseException e)
        {
            e.printStackTrace();
        }
        
        return datefrom;

    }
    public String getDateTo(String date) {
        Log.writeLog("entered getDateFrom");
        String dateto = "";
       String dateto1 = date.split("\\- ")[1];// for splitting the date var in two parts which contains full date range ,
        //this will give second  part of the date range

        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd ");
        Date date2;
        try {
            date2 = (Date) new SimpleDateFormat("MM/dd/yyyy").parse(dateto1);// for converting the string date into the date var

            dateto = format1.format(date2);// for converting the date var into the yyyy-mm-dd which is requored in db for getting the data
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
            
        return dateto;
        
    }

}
