@isTest
public class SupportPlanUpdateBatchTest {
    @testSetup
    public static void testSetup(){
        
   List<Account> accounts  =  TestSuite.createAccounts(3);
        accounts[0].Customer_Priority__c = 'High';
        accounts[1].Customer_Priority__c = 'Medium';
        accounts[2].Customer_Priority__c = 'Low';
        
        insert accounts;
        
        //do assertion for inserted accounts
        Assert.areEqual(3, [Select count() FROM Account]);
        
        //create cases
        //collect account Ids in a list; use in method parameter to create cases...
            List<ID> accIds = new List<ID>();
            for(Account acc : accounts){
                accIds.add(acc.Id);    
            }
        
      List<Case> cases = TestSuite.createCases(3, accIds);
        insert cases;
        
                System.assertEquals(9, [SELECT count() FROM Case]);
                System.debug(cases.size()); //9 expected
       
                    for(Case cs : cases){
                        
                        System.assertEquals(null, cs.Support_Plan__c);
                    }
        
        
    }
    
    
    //now test batch 
   @isTest
    public static void testSupportPlanUpdateBatch(){
        
                Test.startTest();
                SupportPlanBatchUpdate batchable = new SupportPlanBatchUpdate();
                Database.executeBatch(batchable, 50);
                Test.stopTest();
        //call the cases from temporary(dummy) database
       List<Case> cases = [SELECT Support_Plan__c, Account.Customer_Priority__c FROM Case];
        
            for(Case cs : cases){
                
                if(cs.Account.Customer_Priority__c == 'High'){
                    Assert.areEqual('Premium', cs.Support_Plan__c);
                    System.debug(cs.Support_Plan__c);
                    
                }else if(cs.Account.Customer_Priority__c == 'Medium'){
                    Assert.areEqual('Standard', cs.Support_Plan__c);
                    System.debug(cs.Support_Plan__c);
                    
                }else{ //if it is 'Low'
                    Assert.areEqual('Basic', cs.Support_Plan__c);
                    System.debug(cs.Support_Plan__c);
                }
                
            }
        
    }
    
    @isTest
    public static void testSupportPlanUpdateScheduler(){
        Test.startTest();
        String jobScheduleName = 'Support Plan Update Job';
        String cronExp = '0 0 22 1 * ? 2023-2024';
        SupportPlanUpdateScheduler scheduleSupportPlan = new SupportPlanUpdateScheduler();
        String jobId = System.schedule(jobScheduleName, cronExp, scheduleSupportPlan);
        
      CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE Id =: jobId];
        
        System.assertNotEquals(null, jobId);
        System.assertEquals(cronExp, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered); 
        Test.stopTest();
        
        
        //you can assertion either of the assertions above for scheduler.
        //System.assertEquals(0, ct.TimesTriggered); ==> Expected TimesTriggered will be 0 bcs we scheduled for future time and it is not triggered yet.
        //System.assertNotEquals(null, jobId); ==> jobId will not equal to null in dummy database...
    }
}