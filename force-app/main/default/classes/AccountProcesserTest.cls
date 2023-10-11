@isTest
public class AccountProcesserTest {
    @testSetup
    public static void  setup(){
        //insert a couple of accounts
        List<Account> accList= new List<Account>();
    for(Integer i=1 ; i<11; i++){
        Account acc= new Account();
        acc.Name='Test Account - ' + i;
        acc.Phone= '98709876';
        acc.AnnualRevenue= 50000;
        accList.add(acc);
    }
        insert accList;//accounts are inserted
        
        //insert child contacts for accounts
        List<Contact> conList= new List<Contact>();
      
        for(Account acc : accList){//iterate newly inserted accounts to assign child contacts
            for(Integer i=1; i<4; i++){
                Contact con= new Contact();
                con.LastName= 'Last Name';
                con.Phone=acc.Phone;
                con.AccountId= acc.Id;
                conList.add(con);
                }// for each account 3 child contacts will be inserted
            }
            insert conList;
            System.debug(conList);
       }  //Setup is done continue with testing
        
        @isTest
        public static void countContactsTest(){
          List<Account> accList= [Select Id From Account];//call inserted account records in setup from database
            List<Id> accIds= new List<Id>();
            for(Account acc: accList){
                accIds.add(acc.Id);
            }
            //testing methods shoud be done between startTest and stopTest method for having fresh governor limits
            Test.startTest();
            AccountProcesser.countContacts(accIds);
            Test.stopTest();
            //Assertion
           List<Account> insertedAccounts= [SELECT Id, NumberOfContacts__c FROM Account];
            System.assertEquals(10, insertedAccounts.size());
            System.assertEquals(3,insertedAccounts[4].NumberOfContacts__c);
        }
 
}