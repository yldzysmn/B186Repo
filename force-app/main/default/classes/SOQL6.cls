public class SOQL6 {
    //Example 12: Fetch Name, Phone, Rating for given account names 
// 'Gene Point' , 'GenePoint', 'Burlington Textiles Corp of America', 'sForce', 'Dickenson plc' 
        
    public static void queryMethod(){
        
        //1.way:
        List<Account> r1 = [SELECT Name, Phone, Rating FROM Account WHERE Name = 'Gene Point' 
                                                    OR Name='Burlington Textiles Corp of America' 
                                                    OR Name= 'sForce' 
                                                    OR Name='Dickenson plc' ];
        
        for(Account w: r1){
            System.debug('1st Way: ' + w);
        }
        
        //2. Way: use IN - BETTER WAY
        List<Account> r2 = [SELECT Name, Phone, Rating FROM Account WHERE Name IN('Gene Point',
                                                                                  'Burlington Textiles Corp of America', 
                                                                                  'sForce',
                                                                                  'Dickenson plc') ];
        
        for(Account w: r2){
            System.debug('2nd Way: ' + w);
        }
        
        //3. Way: The best way is using "data binding" to bind variables...
            // ":" is used for "binding variables"
        List<String> accNames = new List<String>{'Gene Point', 'Burlington Textiles Corp of America', 'sForce', 'Dickenson plc'};
        
       List<Account> r3 = [SELECT Name, Phone, Rating FROM Account WHERE Name IN:accNames]; //binded the variable into the query
        
        System.debug('3rd Way: ' + r3);
    }
}