public class accTriggerCasePriorityHandler {
    
    
    public static void afterUpdate(Map<Id, Account> newAccounts, Map<Id, Account> oldAccounts){
        Set<Id> accIds= new Set<Id>();
        for(Account acc: newAccounts.values()){
      Account oldAcc = oldAccounts.get(acc.Id);//I will get old account from value part by specifying key in get method.
            if( oldAcc.Rating != acc.Rating ){
                accIds.add(acc.Id);
               
            }
        }
         //update priority of cases in accounts as well
        if(!accIds.isEmpty()){
            updateCasePriority(accIds);
        }
         
    }
    //this method to update cases in account 0f which rating is updated and fired the trigger..
    private static void updateCasePriority(Set<Id> accountIdsForCase){
        List<Case> cases= [SELECT Id, Priority, Account.Rating FROM Case WHERE AccountId IN: accountIdsForCase];
        for(Case cs: cases){
            if(cs.Account.Rating == 'Hot'){
                cs.Priority ='High';
            } else if (cs.Account.Rating == 'Warm'){
                cs.Priority ='Medium';
            } else{
               cs.Priority = 'Low'; 
            }
    }
        update cases;

     }
  }