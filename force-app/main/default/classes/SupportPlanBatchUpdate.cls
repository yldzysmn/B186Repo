public class SupportPlanBatchUpdate implements Database.Batchable <sObject>, Database.Stateful {
    
    //counter we will see how many record updated but we have to use Database.stateful
    public Integer recordsProcessed = 0;
    
    
    public Database.QueryLocator start(Database.BatchableContext BC){//start method executes once
        //get case records with Support Plan field and their parent account's Customer Priority field
        //based on the value of customer priority, we will update support plan of cases..
        String query = 'SELECT Id, Support_Plan__c, Account.Customer_Priority__c FROM Case ' +
                        'WHERE Support_Plan__c = null AND Account.Customer_Priority__c != null';
                            // when we type query in String, it will return as a list again. So we keep returning list in execute method parameter...
                            // typing the query in String does not mean we keep returning data in string.
                            // string container is just for creating query code. not for returning data..
        return Database.getQueryLocator(query);
        //getQueryLocator : 50,000,000
        //Iterable: 50,000
    }
    
    
    
    //execute method
    public void execute(Database.BatchableContext BC, List<Case> cases){// execute methods dependson number of records and batch size
        //batch size 50 ; total numberof record 500=> 10 times execution for execute method
        
        for(Case cs : cases){
            
            if(cs.Account.Customer_Priority__c == 'High'){
                cs.Support_Plan__c = 'Premium';
                
            }else if(cs.Account.Customer_Priority__c == 'Medium'){
                cs.Support_Plan__c = 'Standard';
            }else{
                
                cs.Support_Plan__c = 'Basic';
                
            }
            
            recordsProcessed++;
        }        
                
        update cases;
    }
        
    //finish method // runs only once when batches are executed
    public void finish(Database.BatchableContext BC){
        //post processing logic
        System.debug('The Total Number of Records Processed: ' + recordsProcessed);
        
        AsyncApexJob myJob = [SELECT Id, Status, NumberOfErrors, TotalJobItems FROM AsyncApexJob WHERE ID =: BC.getJobId()];
        System.debug(myJob);  
        
        List<Application_Log__c> caseLogs = new List<Application_Log__c>();
        
        Application_Log__c log =  new Application_Log__c();
        
        log.Status__c = 'Success';
        log.Target_Type__c = 'Batch';
        log.Target_Name__c = 'SupportPlanUpdateBatch Class';
        log.Message__c = 'Status from Job Object : ' + myJob.Status + ' && Case records have been updated with their corresponding support plan'+
                         'Number Of Errors: ' + myJob.NumberOfErrors + ', Id of the Job: ' + myJob.Id;
        
        caseLogs.add(log);
        
        insert caseLogs;
    }
    
    
}
//EXAMPLE 6: Basen on the value in Customer Priority field of Account, update Support Plan field of all child cases
//Customer Priority         Support Plan
//      High                > Premium
//      Medium              > Standard
//      Low                 > Basic