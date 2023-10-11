public class AccountOwnerChangeHandler {
                                //Trigger.new           Trigger.oldMap                  Trigger.newMap
    public static void updateOwner(List<Account>accList, Map<Id, Account> oldAccount, Map<Id, Account> newAccount){
        
     
           Set<ID> accIds = new Set<ID>();
        
        //iterate updated account records in new list
        for(Account acc : accList){
            
            if(acc.OwnerId != oldAccount.get(acc.Id).OwnerId){ //check new owner and old owner are different...
                
                //store ID of the accounts in SET  whose owner is changed
                accIds.add(acc.Id);
            }
        }
        //we checked if owner of account is updated and put the Ids in set accordingly
        //now go to database and call related contact of accounts and update contact owners as well
        
      List<Contact> conList  = [SELECT Id, OwnerId, AccountId FROM Contact WHERE AccountId IN: accIds];
        
        for(Contact con : conList){
            //get new Owner of parent account and put into the owner of contact 
            //new owner can be accessed in new map as a specific field....
          con.OwnerId = newAccount.get(con.AccountId).OwnerId;
            
        }
        update conList;
        
    }
}
//on admin part I chaned owner of an account record:
        //..... Trigger checks new owner and old owner of account to make sure...
        //.....if owner really changed > change account's contact owner as well
        //to be able to access Contact of updated accounts we need account IDs
        //by using ID we can call related contacts from database; thats why we store Account IDs into Set above....
        //and go parent of contact, fetch new owner from newMap and assign into Owner of Contact