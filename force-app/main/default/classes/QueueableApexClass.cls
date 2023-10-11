public class QueueableApexClass implements Queueable {
    public void execute(QueueableContext contex){
        List<Account> accList = new List<Account>();
        for(Integer i= 1 ; i<101 ; i++){
            Account acc= new Account();
            acc.Name='Test for Queueable ' + i;
            accList.add(acc);
        }
        insert accList;
        for(Account ac : accList){
            System.debug(ac); //display on the console after records are inserted..
        }
    }

}