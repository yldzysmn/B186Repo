public class SOQL7 {
    public static void selectRecords(Integer lmt, Integer offs){
    List<Account> accList= [SELECT Name, Rating, NumberOfEmployees 
                            FROM Account LIMIT:lmt OFFSET:offs];
   
        for(Account acc : accList){
            System.debug('Account Name ' + acc.Name);
            System.debug('Account Rating ' + acc.Rating);
            System.debug('Number of employees ' + acc.NumberOfEmployees);
            System.debug('------------------');
        }
    
    }

}