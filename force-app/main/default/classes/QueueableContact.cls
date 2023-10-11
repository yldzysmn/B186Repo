public class QueueableContact implements Queueable {
    
    
    public Map<Lead, Account> leadWithAccts;    
    
    public QueueableContact(Map<Lead, Account> leadWithAccounts){
        
       this.leadWithAccts = leadWithAccounts;
        
    }
    
    
    public void execute(System.QueueableContext qc){
        
        List<Contact> conList = new List<Contact>();
        
        for(Lead lead : leadWithAccts.keySet()){
                     
            conList.add(new Contact(FirstName= lead.FirstName,
                                   LastName=lead.LastName,
                                   AccountId = leadWithAccts.get(lead).Id));
            
        }
        
        insert conList;
    }
    
    
}