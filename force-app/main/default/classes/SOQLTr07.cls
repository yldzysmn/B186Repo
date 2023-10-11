public class SOQLTr07 {
//Opportunity object olusturunuz 
//olusturdugunuz objecti siliniz
//Opportunity constructor i kabul etmedi yani parentezin icine koydugumuz verilerle 
//object olusturacaktik. kabul etmeyince tek tek ekledik.closedate date datatipinde oldugu icin date 
//formatini kabule etti.
    public static void createOpp(){
       Opportunity newOpportunity = new Opportunity();
       newOpportunity.Name = 'New Opportunity';
       newOpportunity.CloseDate = Date.newInstance(2023, 8, 31);
       newOpportunity.StageName = 'Prospecting';
       newOpportunity.Amount = 10000.00;
        Database.insert(newOpportunity);
        //Delete icin Id ye ihtiyac var
      List<Opportunity> opps=  [SELECT Id From Opportunity WHERE Name= 'New Opportunity'];
       Database.delete(opps);
    }
    
    
}