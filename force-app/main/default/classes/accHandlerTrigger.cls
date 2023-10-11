public class accHandlerTrigger {
      
    public static void beforeInsert(List<Account> newAccList){
        
        Map<String, Account> nameAccMap = new Map<String, Account>();
        
        
        
        for(Account acc : newAccList){
            
            nameAccMap.put(acc.Name, acc); //keep name of accounts and accounts in map
            
            if(acc.Phone == null){
                
                acc.addError('Please verify the Errors from the Account Trigger');
                acc.Phone.addError('Phone must not be blank!');
            }
        }
        
        if(nameAccMap.keySet().size()>0){
            
	List<Account> accounts = [SELECT Id, Name FROM Account WHERE Name IN: nameAccMap.keyset()];       
            
            for(Account acc : accounts){
                
              Account insertedAcc = nameAccMap.get(acc.Name);
                
                if(insertedAcc != null){
                    
                    insertedAcc.addError('There is an account using this name already, change the name!');
                }
 
            }  
            
        }
        
    }
    
}