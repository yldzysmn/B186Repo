public class BatchApexAcc implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc){
        
        return Database.getQueryLocator('SELECT Id, Name, NumOfContacts__c , (SELECT Id  FROM Contacts) FROM Account');
        
        
    }
    public void execute(Database.BatchableContext bc, List<Account> accList){
        for(Account w: accList){
            if(w.Contacts != null){ //Account un herhangi bir contact i varsa contact bos degilse icine girecek
                w.NumOfContacts__c = w.Contacts.size();
                System.debug('Account name:' + w.Name);
            }
        }
        update accList;
    }
    public void finish(Database.BatchableContext bc){
        AsyncApexJob myJob = [SELECT Id,NumberOfErrors, TotalJobItems,Status  FROM AsyncApexJob WHERE Id=: bc.getJobId()];
        System.debug(myJob);
    }

}