public class QueueableApexWithParams implements Queueable {
    //USING PARAMETER IN QUEUEABLE
//Example 2: Enter an account list to the parameter of method as an argument
//and update number_of_contacs field of accounts
//use queueable classss

    public List<Account> listOfAcc;
    public QueueableApexWithParams(List<Account> accToUpdate){
        
      this.listOfAcc = accToUpdate;
    }
    
    
    public void execute(QueueableContext context){
        
        for(Account acc : listOfAcc){
            
            if(acc.Contacts != null){
                
                acc.NumberOfContacts__c = acc.Contacts.size();
                
            }
            
        }
        update listOfAcc;
       
        for(Account a : listOfAcc){
            System.debug(a + ' and ' + a.NumberOfContacts__c); //updated accounts
        }
        
         //chain another class into this class
        //when this primary class is executed, following chained will be in queue as well        
        ChainedQueueableContact chainedQue = new ChainedQueueableContact();
        System.enqueueJob(chainedQue);
    }
    
}


//in queueable class; to be able to get data from outside as an argument in parameter:
// 1) We create a method different from execute method with same name of the class
// 2) SO class constructor and method constructor become same.
// 3) in outside of the class data can be sent in that method's parameter
// 4) but the data coming in this method is not accesible by execute method
// 5) because of that; we assign the data to another container global for whole class
// 6) finally we can work with data coming outside of the class by method parameter