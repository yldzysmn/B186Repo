trigger LeadInsertTrigger on Lead (after insert) {
    
    //Example
    //Chaining Queueable Jobs
    //When a new lead is inserted,
    //Create an Account with Name, Industry and Billing Addres as Lead's Cpompany, Industry and Address
    //Create a contact with FirstName, LastName, Account name as Lead's FirstName, LastName
    //and Account's name respectively.....
    if(Trigger.isAfter && Trigger.isInsert){
        
        QueueableAccount queAcc  = new QueueableAccount(Trigger.new);
        System.enqueueJob(queAcc);
    }
    
    
}