/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package s3453;

import blezz.Poul;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sachin
 */
public class ProformaAddProduct extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           HttpSession session1 = request.getSession();
             String usercid_id=(String)session1.getAttribute("usercid_id");
          String usercid_email=(String)session1.getAttribute("usercid_email");
          String useraccountype=(String)session1.getAttribute("useraccountype");
          String usercid_name=(String)session1.getAttribute("usercid_name");
          String usercid_adminid=(String)session1.getAttribute("usercid_adminid");
             String usercid_company=(String)session1.getAttribute("usercid_company");
          String usercid_website=(String)session1.getAttribute("usercid_website"); 
            /* TODO output your page here. You may use following sample code. */
         String pagetype="",owner="",incid="";
            pagetype=request.getParameter("pagetype");
           owner=request.getParameter("owner");
          
         
           
           if(("addproduct").equals(pagetype)){
                  String invoiceid=null;  int iiil=0;
        incid=request.getParameter("incid");
      if(incid!=null || incid!=""||incid!="null"){invoiceid=incid; }
           
                java.util.Date ddate=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(ddate.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(ddate.getTime());
               
         String newcontactdbinsert=Poul.escapeHtml(request.getParameter("newcontactdbinsert"));
          String amtinwords="",amtinwordspaisa="" ;           
        String invoicedate=Poul.escapeHtml(request.getParameter("invoicedate"));
        String reversecharge=Poul.escapeHtml(request.getParameter("reversecharge"));
        String state1=Poul.escapeHtml(request.getParameter("state1"));
        String statecode1=Poul.escapeHtml(request.getParameter("statecode1"));
        String transporter=Poul.escapeHtml(request.getParameter("transporter"));
        String vehicleno=Poul.escapeHtml(request.getParameter("vehicleno"));
        String supplydate=Poul.escapeHtml(request.getParameter("supplydate"));
        String supplyplace=Poul.escapeHtml(request.getParameter("supplyplace"));
        String bname=Poul.escapeHtml(request.getParameter("bname"));
        String baddress1=Poul.escapeHtml(request.getParameter("baddress1"));
        String baddress2=Poul.escapeHtml(request.getParameter("baddress2"));
        String baddress3=Poul.escapeHtml(request.getParameter("baddress3"));
        String bcontact1=Poul.escapeHtml(request.getParameter("bcontact1"));
        String bcontact2=Poul.escapeHtml(request.getParameter("bcontact2"));
        String bdistt=Poul.escapeHtml(request.getParameter("bdistt"));
        String bgstin=Poul.escapeHtml(request.getParameter("bgstin"));
        String bstate=Poul.escapeHtml(request.getParameter("bstate"));
        String sname=Poul.escapeHtml(request.getParameter("sname"));
         String saddress1=Poul.escapeHtml(request.getParameter("saddress1"));
          String saddress2=Poul.escapeHtml(request.getParameter("saddress2"));
        String saddress3=Poul.escapeHtml(request.getParameter("saddress3"));
        String scontact1=Poul.escapeHtml(request.getParameter("scontact1"));
        String sdistt=Poul.escapeHtml(request.getParameter("sdistt"));
        String scontact2=Poul.escapeHtml(request.getParameter("scontact2"));
        String sgstin=Poul.escapeHtml(request.getParameter("sgstin"));
        String sstate=Poul.escapeHtml(request.getParameter("sstate"));
        String sabop=Poul.escapeHtml(request.getParameter("sabop"));
         String contact=Poul.escapeHtml(request.getParameter("contact"));
      
        if("true".equals(sabop)){ 
        sname=bname; 
saddress1=baddress1;
saddress2=baddress2;
saddress3=baddress3;
scontact1=bcontact1;
scontact2=bcontact2;
sdistt=bdistt;
sgstin=bgstin;
sstate=bstate;
        
        }
         String sn=Poul.escapeHtml(request.getParameter("sn"));
        
        String description1=Poul.escapeHtml(request.getParameter("description1"));
        String[] description=new String[6];
        if(description[1]==null){
         description = description1.split(":");}
        String hsncode=Poul.escapeHtml(request.getParameter("hsncode"));
        String qty=Poul.escapeHtml(request.getParameter("qty"));
        String unit=Poul.escapeHtml(request.getParameter("unit"));
        String rate=Poul.escapeHtml(request.getParameter("rate"));
        String amount=Poul.escapeHtml(request.getParameter("amount"));
        
         String pf=Poul.escapeHtml(request.getParameter("pf"));
        String cgst=Poul.escapeHtml(request.getParameter("cgst"));
        String sgst=Poul.escapeHtml(request.getParameter("sgst"));
        String igst=Poul.escapeHtml(request.getParameter("igst"));
        String discount=Poul.escapeHtml(request.getParameter("discount"));
        String discountname=Poul.escapeHtml(request.getParameter("discountname"));
         String producttotal=Poul.escapeHtml(request.getParameter("producttotal"));
         
        String totalamount=Poul.escapeHtml(request.getParameter("totalamount"));
        String netamount=Poul.escapeHtml(request.getParameter("netamount"));
      
       //updating into stock
        
           String data="";
     
        try{
        
Connection c=Poul.getConnectionCRM();


Statement st=c.createStatement();
           ResultSet rs3;
               rs3 = st.executeQuery("select  *  FROM performaproductlog  ");
    while(rs3.next())
        
          {data=rs3.getString(1);
          
          }
           int ii = Integer.parseInt( data ); 
           ++ii; 
        st.addBatch("insert into performaproductlog values('"+ii+"','"+sqlTime+"','','"+owner+"','"+description[1]+"','"+hsncode+"','','Active','','"+rate+"','"+qty+"','','','','','','','','','','','','','remove','"+incid+"','','','','','','"+usercid_adminid+"','"+usercid_id+"','"+contact+"')");
      
            
       st.executeBatch(); 
        rs3.close();
      st.close();
      c.close();
              
       
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
       String temp="null";
              
         BigDecimal  ipf= new BigDecimal( pf ); BigDecimal icgst= new BigDecimal( cgst ); BigDecimal isgst=new BigDecimal( sgst );BigDecimal iigst= new BigDecimal( igst );
        int isn= Integer.parseInt( sn );
        BigDecimal iqty= new BigDecimal( qty );
        BigDecimal irate= new BigDecimal( rate );
        BigDecimal iproducttotal= new BigDecimal( producttotal );
       BigDecimal hundred= new BigDecimal( "100" );
        BigDecimal itotalamount= new BigDecimal( totalamount );
        BigDecimal inetamount= new BigDecimal( netamount );
         BigDecimal idiscount= new BigDecimal( discount );
        BigDecimal iamount=new BigDecimal( "0" );
        iamount=iqty.multiply(irate);
        iproducttotal=iamount.add(iproducttotal);
        ipf=((iproducttotal.multiply(ipf))).divide(hundred);ipf = ipf.setScale(2, BigDecimal.ROUND_HALF_UP);
         isgst=((iproducttotal.multiply(isgst))).divide(hundred);isgst = isgst.setScale(2, BigDecimal.ROUND_HALF_UP);
       
        icgst=((iproducttotal.multiply(icgst))).divide(hundred);icgst = icgst.setScale(2, BigDecimal.ROUND_HALF_UP);
        iigst=((iproducttotal.multiply(iigst))).divide(hundred);iigst = iigst.setScale(2, BigDecimal.ROUND_HALF_UP);
        itotalamount=iproducttotal.add(ipf.add(icgst.add(isgst.add(iigst))));itotalamount = itotalamount.setScale(0, BigDecimal.ROUND_HALF_UP);
        //discount is the fright charges
        inetamount=itotalamount.add(idiscount);inetamount = inetamount.setScale(0, BigDecimal.ROUND_HALF_UP);
        amtinwords=Poul.convert(Integer.valueOf(itotalamount.intValue()));
          BigDecimal result = itotalamount.subtract(itotalamount.setScale(0, RoundingMode.FLOOR)).movePointRight(itotalamount.scale());    
        amtinwordspaisa=Poul.convert(Integer.valueOf(result.intValue()));
         
        
String sipf=ipf.toString(),siqty=iqty.toString(),sirate=irate.toString(),siproducttotal=iproducttotal.toString(),sitotalamount=itotalamount.toString();
String sidiscount=idiscount.toString(),siamount=iamount.toString(),sicgst=icgst.toString(),sisgst=isgst.toString(),siigst=iigst.toString(),  sinetamount=inetamount.toString();

        int j=isn,i=0;
    
        isn=7*(isn-1)+71;
       
        String msg="null";
     
        String SR=null;
        
        try{
        
Connection c=Poul.getConnectionCRM();


Statement st=c.createStatement();
           ResultSet rs3;
               rs3 = st.executeQuery("select  *  FROM proforma where id='"+incid+"'  ");
    ResultSetMetaData rsmd=rs3.getMetaData();
     String aa="null",ab="null",ac="null",ad="null",ae="null",af="null",ag="null",ah="null",ai="null",aj="null",ak="null",all="null",am="null",an="null",ao="null",app="null",aq="null",ar="null",as="null",at="null",au="null",av="null",aw="null",ax="null",ay="null",az="null";
      String ba="null",bb="null",bc="null",bd="null",be="null",bf="null",bg="null",bh="null",bi="null",bj="null",bk="null",bl="null",bm="null",bn="null",bo="null",bp="null",bq="null",br="null",bs="null",bt="null",bu="null",bv="null",bw="null",bx="null",by="null",bz="null";
       String cs="null",ct="null",cu="null",cv="null";
       String cw="null",cx="null",cy="null",cz="null",da="null",db="null",dc="null",dd="null",de="null",df="null",dg="null",dh="null",di="null",dj="null",dk="null",dl="null",dm="null",dn="null",dO="null",dp="null",dq="null",dr="null";
       String defa1="null",defa2="null",defa3="null",defa4="null",defa5="null",defa6="null"; 
     aa=rsmd.getColumnName(1); ab=rsmd.getColumnName(2);ac=rsmd.getColumnName(3);
             ad=rsmd.getColumnName(4);
              ae=rsmd.getColumnName(5);
               af=rsmd.getColumnName(6);
                ag=rsmd.getColumnName(7);
                 ah=rsmd.getColumnName(8);
                  ai=rsmd.getColumnName(9);
                   aj=rsmd.getColumnName(10);
                    ak=rsmd.getColumnName(11);
                     all=rsmd.getColumnName(12);
                      am=rsmd.getColumnName(13);
                       an=rsmd.getColumnName(14);
                        ao=rsmd.getColumnName(15);
                         app=rsmd.getColumnName(16);
                          aq=rsmd.getColumnName(17);
                           ar=rsmd.getColumnName(18);
                            as=rsmd.getColumnName(19);
                             at=rsmd.getColumnName(20);
                              au=rsmd.getColumnName(21);
                              av=rsmd.getColumnName(22);
                              aw=rsmd.getColumnName(23);
                              ax=rsmd.getColumnName(24);
                              ay=rsmd.getColumnName(25);
                              az=rsmd.getColumnName(26);
          ba=rsmd.getColumnName(27); bb=rsmd.getColumnName(28);bc=rsmd.getColumnName(29);
             bd=rsmd.getColumnName(30);
              be=rsmd.getColumnName(31);
               bf=rsmd.getColumnName(32);
                bg=rsmd.getColumnName(33);
                 bh=rsmd.getColumnName(34);
                  bi=rsmd.getColumnName(35);
                   bj=rsmd.getColumnName(36);
                    bk=rsmd.getColumnName(37);
                     bl=rsmd.getColumnName(38);
                      bm=rsmd.getColumnName(39);
                       bn=rsmd.getColumnName(40); bo=rsmd.getColumnName(41);  bp=rsmd.getColumnName(42); bq=rsmd.getColumnName(43); br=rsmd.getColumnName(44); bs=rsmd.getColumnName(45);bt=rsmd.getColumnName(46);bu=rsmd.getColumnName(47);bv=rsmd.getColumnName(48);bw=rsmd.getColumnName(49); bx=rsmd.getColumnName(50); by=rsmd.getColumnName(51); bz=rsmd.getColumnName(52);
        
                       
                       
                 defa1=rsmd.getColumnName(41);
                   defa2=rsmd.getColumnName(43);
                    defa3=rsmd.getColumnName(45);
                     defa4=rsmd.getColumnName(47);
                      defa5=rsmd.getColumnName(52);   
                      defa6=rsmd.getColumnName(61); 
                      String cal1="null",cal2="null",cal3="null",cal4="null",cal5="null",cal6="null",cal7="null",cal8="null";
                       
                       cal1=rsmd.getColumnName(37);
                       cal2=rsmd.getColumnName(42);
                       cal3=rsmd.getColumnName(44);
                       cal4=rsmd.getColumnName(46);
                       cal5=rsmd.getColumnName(48);
                       cal6=rsmd.getColumnName(51);
                       cal7=rsmd.getColumnName(54);
                       cal8=rsmd.getColumnName(59);
                       String clmname[]=new String[256];
         int ii=71;
         for(ii=71;ii<241;ii++)
         {clmname[ii]=rsmd.getColumnName(ii);
            
         }
  st.addBatch("update proforma set  "+cal8+"='"+newcontactdbinsert+"',"+ac+"='1',"+ae+"='"+invoicedate+"',"+af+"='"+reversecharge+"',"+ag+"='"+state1+"',"+ah+"='"+statecode1+"',"+ai+"='"+transporter+"',"+aj+"='"+vehicleno+"',"+ak+"='"+supplydate+"',"+all+"='"+supplyplace+"',"+am+"='"+bname+"',"+an+"='"+baddress1+"',"+ao+"='"+baddress2+"',"+app+"='"+baddress3+"',"+aq+"='"+bcontact1+"',"+ar+"='"+bcontact2+"',"+at+"='"+bdistt+"',"+au+"='"+bstate+"',"+aw+"='"+bgstin+"',"+ay+"='"+sname+"',"+az+"='"+saddress1+"',"+ba+"='"+saddress2+"',"
          +bb+"='"+saddress3+"',"+bc+"='"+scontact1+"',"+bd+"='"+scontact2+"',"+bf+"='"+sdistt+"',"+bg+"='"+sstate+"',"+bi+"='"+sgstin+"',"
          + ""+clmname[isn]+"='"+sn+"',"+clmname[isn+1]+"='"+description[1]+"',"+clmname[isn+2]+"='"+hsncode+"',"+clmname[isn+3]+"='"+qty+"',"+clmname[isn+4]+"='"+rate+"',"+clmname[isn+5]+"='"+unit+"',"+clmname[isn+6]+"='"+iamount+"',"+defa1+"='"+pf+"',"+defa2+"='"+cgst+"',"+defa3+"='"+sgst+"',"+defa4+"='"+igst+"',"+defa6+"='"+discountname+"',"+defa5+"='"+discount+"',"+cal1+"='"+iproducttotal +"',"+cal2+"='"+ipf +"',"+cal3+"='"+icgst +"',"+cal4+"='"+isgst +"',"+cal5+"='"+iigst +"',"+cal6+"='"+itotalamount +"',"+cal7+"='"+inetamount +"',be_='"+amtinwords +"',bf_='"+amtinwordspaisa +"'   where id='"+incid+"'");
   
            
       st.executeBatch(); 
       rs3.close();
      st.close();
      c.close();
       invoiceid=incid;
             msg="success";    
       if("success".equals(msg)){
      response.sendRedirect("proforma.jsp?incid="+incid);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
       
        
           }
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
