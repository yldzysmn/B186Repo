@isTest
public class accTriggerHandlerTest {
    
    @isTest
    public static void beforeInsertPhoneTest(){
        
        Account acc = new Account();
        acc.Name='Test';
        Test.startTest();
        try{
            insert acc;
        } catch(exception e){
            System.assert(e.getMessage().contains('Please verify the Errors from the Account Trigger'));
        }
        Test.stopTest();
    }
    @isTest
    public static void beforeInsertSameName(){
        Account acc = new Account();
        acc.Name='Testing';
        acc.Phone='876987';       
        insert acc;
        
         Account a = new Account();
        a.Name='Testing';
        a.Phone='8769898'; 
        Test.startTest();
        try{
            insert a; 
        }catch(exception e){
            System.Assert(e.getMessage().contains('There is an account using this name already, change the name!'),
                'Check your assertion part of validation message');
            
        }
       Test.stopTest();
  }
}