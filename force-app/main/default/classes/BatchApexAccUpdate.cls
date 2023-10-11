public class BatchApexAccUpdate implements Database.Batchable<sObject>, Schedulable  {
       
    //start method
    public Database.QueryLocator start(Database.BatchableContext BC){
        String accName = '%Iterable%';
        String query = 'SELECT Id, Name, Active__c, Description FROM Account WHERE Name LIKE:accName  ';
        
        return Database.getQueryLocator(query);
                    
    }
    
    
    //execute method
    public void execute(Database.BatchableContext BC, List<Account> accToUpdate){ //to get query result from start method we need parameter as list
        
        for(Account acc : accToUpdate){
            
            acc.Active__c = 'Yes';
            acc.Description = 'Account has updated';
                
            }
           update accToUpdate;
            
        }
    
   
    //finish method
    public void finish(Database.BatchableContext BC){
        
        System.debug('Account Records has updated!');
       
    }
    public void execute(SchedulableContext sc){
        BatchApexAccUpdate baup= new BatchApexAccUpdate();
        Database.executeBatch(baup);
    }
    
    
    
    
}