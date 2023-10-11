public class QueueableAccount implements Queueable {
    
    
    public List<Lead> myLeads; //thii can be used in execute method
    
    public QueueableAccount(List<Lead> leadList){
        
        this.myLeads = leadList; //trigger.new is assigned into global list in class
        
        
    }
    
    //to insert accounts by using lead information
    public void execute(System.QueueableContext qc){
        
        Map<Lead, Account> leadWithAccounts = new Map<Lead, Account>();
        //to keep lead info with account in collection I create Map
        //bcs I will need lead info in the next class as well
        
        for(Lead lead : myLeads){
            
            Account newAcc = new Account();
            newAcc.Name = lead.Company;
            newAcc.Industry = lead.Industry;
            newAcc.BillingCountry = lead.Country;
            newAcc.BillingState = lead.State;
            newAcc.BillingCity = lead.City;
            
            leadWithAccounts.put(lead, newAcc);
            
        }
        
        insert leadWithAccounts.values(); //insert value part of the map; accounts...
        
           QueueableContact queCont = new QueueableContact(leadWithAccounts);
            //send the data in map to other class in parameter
            System.enqueueJob(queCont);
    }
    
 
}