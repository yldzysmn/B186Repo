public class SOQL10 {
    
    //Example:    
//Create a new record with name, rating and phone fields...
//add rating later to object structure....
//Create 4 records additional in a list and use partial success...
//Enter account names with parameter...
	
    public static void workWithData(String accName){
        
        Account acc1 = new Account(Name='1. ' + accName, Phone= '+904442220020');
        acc1.Rating = 'Cold';
        Database.insert(acc1);// 1dml
        
        //create 4 additional records...
        Account acc2 = new Account(Name= '2. ' + accName);
        Account acc3 = new Account(Name= '3. ' + accName);
        Account acc4 = new Account(Name= '4. ' + accName);
        Account acc5 = new Account(Description= '5. ' + accName);
        
        List<Account> myAccList = new List<Account>{acc2, acc3, acc4, acc5};
            Database.insert(myAccList,false); // 1 dml
        
        System.debug(myAccList);
        
    }
    
    
}