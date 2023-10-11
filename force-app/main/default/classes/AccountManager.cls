public class AccountManager {
    public static void updateTypeField(String fieldValue){
    List<Account> accList= [SELECT Id, Name, Type FROM Account WHERE Type =: fieldValue];
        for(Account acc: accList){
            acc.Type='Other';
            accList.add(acc);
        }
        update accList;
        System.debug(accList);
    }

}