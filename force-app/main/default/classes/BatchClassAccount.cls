public class BatchClassAccount implements Database.Batchable <sObject> {
////Example 4: If an Account's Billing Country is USA,
//Billing City and Billing State should be assigned Mailing City
// and Mailing State of child Contact
    public Database.QueryLocator start(Database.BatchableContext bca){
      return Database.getQueryLocator('SELECT ID, Name, BillingCountry,BillingCity,BillingState, (SELECT Id, Name, MailingCountry, MailingCity,MailingState FROM Contacts) From Account WHERE BillingCountry=\'USA\'');
    }
    public void execute (Database.BatchableContext bca, List<Account> myList){
       List<Contact> cont = new List<Contact> (); 
        for(Account w: myList){
            for(Contact con: w.Contacts){
            //If(w.BillingCountry == 'USA'){
                con.MailingCity =  w.BillingCity ;
                 con.MailingState = w.BillingState  ;
                cont.add(con);
                System.debug('Account name:' + w.Name);
           }// }
        }
        update myList;
    }
    public void finish (Database.BatchableContext bca){
        System.debug('Records are updated!');
        
    AsyncApexJob myUpdateJob  =  [SELECT Id, Status, NumberOfErrors, TotalJobItems FROM AsyncApexJob WHERE ID =: bca.getJobId()];
        System.debug(myUpdateJob);
        
    }
}