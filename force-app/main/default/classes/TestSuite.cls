public class TestSuite {
    
    //create framework for accounts and returnt to test class back
    public static List<Account> createAccounts(Integer count){
        
        List<Account> accounts = new List<Account>();
        
        for(Integer i=1; i<=count; i++){
            
           Account acc = new Account();
            acc.Name = 'Apex Testing Account '+ i;
            acc.Phone = '54654323';
            acc.Type = 'Prospect';
            acc.AccountNumber = 'ACC100'+i;
            acc.Rating = 'Cold';
            accounts.add(acc);
            
        }
        return accounts; //give the framework to test class back
        
    }
    
    
   //create framework for the cases in accounts
    
    public static List<Case> createCases(Integer count, List<Id> accountIds){
            List<Case> cases = new List<Case>();
                 for(Id accId : accountIds){
                    
                    for(Integer i=1; i<=count; i++){
                        
                        Case cs = new Case();
                        cs.Subject = 'Test Subject ' + i;
                        cs.Priority = 'Low';
                        cs.AccountId = accId;
                        cs.Status = 'New';
                        
                        cases.add(cs);
                        
                    }
                   
                }        
                
        
        
        return cases;
        }
    }