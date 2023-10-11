public class SOQLTr06 {
  //Database  ebir tane Lead object i insert ediniz.
  //Insert ettiginiz Lead Objesinin Lastname ini 'xyz'yapiniz
    public static void createLead(){
       // Lead led= new Lead (LastName='Yavuz', Company='Google', Status='Open-Not Contacted');
        //insert led;
    }
    public static void updateLead(){
       //update delete ve undelete operasyonlari Id olmadan yapilamaz.
       //query lerde sonucun ne oldugunu bilmedigimiz icin List kullaniyoruz.
       //list 0 i da kabul eder coklu data yi da kabul eder
      List<Lead> ld = [SELECT Id FROM Lead WHERE LastName ='Yavuz' AND Company='Google'];
       for(Lead w: ld){
            w.LastName='xyz';
        }
         update ld; 
 
    }
  }