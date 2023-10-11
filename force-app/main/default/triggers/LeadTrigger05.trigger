trigger LeadTrigger05 on Lead (before insert,after update) {
    If(Trigger.isBefore && Trigger.isInsert){
        for(Lead w: Trigger.new){
            If(String.isBlank(w.LeadSource)){
                w.LeadSource= 'Other';
            } 
        }
        
    }
    If(Trigger.isAfter && Trigger.isUpdate){
        List<Task> myTask= new List<Task>();
        for(Lead w: Trigger.new){
            Task ts=new Task();
            ts.Subject='The record is created' ;
            ts.WhoId= w.Id;
            myTask.add(ts);
        }
        insert myTask;
    }
    
}