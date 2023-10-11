@isTest 
public with sharing class TrialAccPracticeTest {
 
//try to create test class......
//create setup data and run method with ıd of setup data then check the result with assertion
@TestSetup
static void setupData(){
    List<Account> accList = new List<Account>();
    for(Integer i=1; i<4; i++){
        Account acc = new Account();
        acc.Name = 'Test '+ i;
        acc.Phone = '987987987';
        acc.Active__c = 'Yes'; //they will be active initially...
        
            accList.add(acc);
    }
            insert accList; //insert fake data. now I have my data to update...
           
}
@isTest static void testAccStatus(){
List<Account> accList = [SELECT ID FROM Account]; // call the fake data from database and fetch Ids
List<Id> accIds = new List<Id>();
for(Account acc : accList){
 accIds.add(acc.Id);//collecting acc ids in list to send into parameter
}
Test.startTest();
TrialAccPractice.accStatusChange(accIds); //will update fake data in setup and deactivate
Test.stopTest();
List<Account> accounts = [SELECT Id, Active__c FROM Account];
for(Account acc : accounts){
    System.assertEquals('No', acc.Active__c, 'Check the values!');
}
}
}