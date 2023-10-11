public class AccountBatchClass implements Database.Batchable <sObject>, Database.Stateful {
            // Database.Stateful is used to follow number of records issued in class
    
    //EXAMPLE1: We need to display number of contacts in an account's custom field
    //All the records will be updated to display up-to-date value in "Number Of Contacs" custom field
    public Integer numOfAccountsForUpdate = 0; //counter will be increasing for each acc record by one
    
    
    //start method
    public Database.QueryLocator start(Database.BatchableContext batcon){
        
        return Database.getQueryLocator('SELECT Id, Name, NumberOfContacts__c, (SELECT Id FROM Contacts) FROM Account');
                    
    }
    
    
    //execute method
    public void execute(Database.BatchableContext batcon, List<Account> accList){ //to get query result from start method we need parameter as list
        
        for(Account acc : accList){
            
            if(acc.Contacts != null){ //acc.Contacts.size() != 0
                
                
                acc.NumberOfContacts__c = acc.Contacts.size();
                
                System.debug('Updated Account`s name!: ' +acc.Name);
                numOfAccountsForUpdate++;
            }
            
        }
    
        update accList;
        System.debug('total numbe of updated accounts: ' + numOfAccountsForUpdate); 
    
    }
    
    
    //finish method
    public void finish(Database.BatchableContext batcon){
        
        System.debug('Records are updated!');
        
    AsyncApexJob myUpdateJob  =  [SELECT Id, Status, NumberOfErrors, TotalJobItems FROM AsyncApexJob WHERE ID =: batcon.getJobId()];
        System.debug(myUpdateJob);
        
    }
}
// "start" method is authomatically connected with "execute" method 
// data sent from start is taken into execute by method parameter; that is why we create List in execute method parenthesis.