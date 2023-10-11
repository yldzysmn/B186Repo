public class SOQL0 {
    
    public void soql(){
        //call account records from database
       List<Account> accList = [SELECT Name, Phone FROM Account];
        System.debug(accList);
        
        /*if we call one single record from database with limit
       	  no need to store in collection
      Account accObj = [SELECT Name, Phone FROM Account LIMIT 1];
        */
  
        
        
        //print records in different lines
        for(Account acc : accList){
            
            System.debug('Account Name: ' + acc.Name + ' - Account Phone: ' + acc.Phone);
            
        }
        
    }
    
}