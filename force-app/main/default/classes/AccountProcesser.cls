public class AccountProcesser {
//EXAMPLE 2: Create an Apex class and method to update Number_Contacts__c field
// enter the ID of accounts to update as an argument in method parameter...
// then create unit test for the operation
    public static void countContacts(List<Id> accIds){ //get Acc id as an argument in parameter outside of the class..
        //call accounts and childs from database whose id sent into class method externally
      List<Account> accounts= [SELECT Id, Name, NumberOfContacts__c, (SELECT Id FROM Contacts) From Account WHERE Id IN: accIds]; 
        for(Account acc: accounts){
            acc.NumberOfContacts__c = acc.Contacts.size();//calculate number of child contacts in an account and put into related field
        }
        update accounts;
    }
}