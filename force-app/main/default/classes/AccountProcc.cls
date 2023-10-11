public class AccountProcc {
    public static void countContacts(List<Id> accIds){
      List<Account> accounts=  [SELECT ID , NumberOfContacts__c,(SELECT Id FROM Contacts) FROM Account WHERE Id IN:accIds];
        for(Account acc: accounts){
           acc.NumberOfContacts__c= acc.Contacts.size();
            
        }
        update accounts;
    }

}