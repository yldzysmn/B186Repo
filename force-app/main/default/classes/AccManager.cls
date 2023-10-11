public class AccManager {
    public static void updateTypeField(String fieldValue){
        
        List<Account> accList =  [SELECT Id, Name, Type FROM Account WHERE Type =:fieldValue ];
        
        System.debug(accList);
        for(Account acc : accList){
            acc.Type = 'Technology Partner';
        }
        
        update accList;
    	System.debug(accList);
    }

}