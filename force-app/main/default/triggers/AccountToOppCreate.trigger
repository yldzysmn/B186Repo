trigger AccountToOppCreate on Account (after insert, after update) {
     //Example 3: Create new Opportunity whenever an account is created or updated for Industry-Agriculture
//Opp should be set as below:
//opp for updated account:
//Stage: "Prospecting", Amount = $100, CloseDate = "90 days from Today"
//opp for created account:
//Stage: "Qualification", Amount = $150, CloseDate = "90 days from Today"
    
    if(Trigger.isAfter && Trigger.isInsert){
        
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Account acc : Trigger.new){
            
            if(acc.Industry == 'Agriculture'){
                
                Opportunity opp = new Opportunity();
                opp.Name = acc.Name + ' Opp';
                opp.StageName = 'Qualification';
                opp.Amount = 150;
                opp.CloseDate = System.today() + 90; //acc.CreatedDate +90
                opp.AccountId = acc.Id;
                oppList.add(opp);
            }
            
        }
        insert oppList;
        System.debug(oppList);
        
    }
    
    
    
    
    //opp for updated account:
    //Stage: "Prospecting", Amount = $100, CloseDate = "90 days from Today"
    if(Trigger.isAfter && Trigger.isUpdate){
        
         List<Opportunity> oppList = new List<Opportunity>();
        
        for(Account acc : Trigger.new){
            
            if(acc.Industry == 'Agriculture'){
                
                Opportunity opp = new Opportunity();
                opp.Name = acc.Name + ' Opp';
                opp.StageName = 'Prospecting'; //different for updated accounts
                opp.Amount = 100;
                opp.CloseDate = System.today() + 90; //acc.CreatedDate +90
                opp.AccountId = acc.Id;
                oppList.add(opp);
            }
            
        }
        insert oppList;
        System.debug(oppList);
        
    }
}