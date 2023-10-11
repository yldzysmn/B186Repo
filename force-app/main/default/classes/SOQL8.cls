public class SOQL8 {
//Example: Call account records whose name containing "Batch 186-187"
//and update the records' name and phone fields.....
    public static void updateTheRecord(){
        //call newly created records from database with a search term in string
        String accName = '%B186%';
        
      List<Account> accList = [SELECT Name, Phone FROM Account WHERE Name LIKE:accName];
        
        
        Integer counter = 101;
        //update the records called by query..
        for(Account acc : accList){
            
            acc.Name = counter + '. B186-Updated';
            acc.Phone = '999666333';
            counter++;
            
        }
        
        
        update accList;
        //Database.update(accList);
        //Database.update(accList, true);
        //Database.update(accList, false);
        //
       
        for(Account w : accList){ //read updated records on the console in different lines...
            
             System.debug(w);
        }  
        
    }
}