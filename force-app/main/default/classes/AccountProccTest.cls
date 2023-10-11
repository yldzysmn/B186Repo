@isTest
public class AccountProccTest {
    @testSetup
    public static void createAcc(){
    List<Account> accounts = new List<Account>();
    for(Integer i=1 ; i<11; i++){
        Account acc= new Account();
        acc.Name= 'Apex Test' + i;
        accounts.add(acc);
     }
   
    insert accounts;
        List<Contact> conList= new List<Contact>();
        for(Account acc: accounts){
        for(Integer i=1 ; i<4; i++){
            Contact con = new Contact();
            con.LastName= 'Test' + i;
            con.AccountId= acc.Id;
            conList.add(con);
        }
        }
    
        insert conList;
        
 }
    @isTest
    public static void countContactTest(){
        List<Account> accList= [Select Id From Account];
        List<ID> accIds= new List<ID>();
        for(Account acc: accList){
            accIds.add(acc.Id);
        }
        Test.startTest();
         AccountProcc.countContacts(accIds);
        Test.stopTest();
        
       List<Account> insertedAccounts= [SELECT Id, NumberOfContacts__c FROM Account];
            System.assertEquals(10,insertedAccounts.size());
            System.assertEquals(3,insertedAccounts[4].NumberOfContacts__c);
    }
    
}