trigger LeadTrigger1 on Lead (before update,after update) {

    //Example8: Go to the lead record, when name is being updated
    //print new lastname and old lastname of the lead record on the console...
     for (Lead w: Trigger.new) {
        Lead oldLead = Trigger.oldMap.get(w.Id);
        
        if(w.Name != oldLead.Name) {
           
            System.debug('Old Lead Name ==>' + oldLead.Name  + ' - ' + w.Name);
            
        }    
    }
}
//for old name: you can use oldMap...