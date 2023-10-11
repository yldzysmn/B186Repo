trigger accTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    
    if(Trigger.isBefore){
        
        if(Trigger.isInsert){
            
            
            //create handler and use reference
            accHandlerTrigger.beforeInsert(Trigger.new);
            
        }
        
     
        
        if(Trigger.isUpdate){
            
        }
    }
    if(Trigger.isAfter){
        if(Trigger.isInsert){}
        if(Trigger.isUpdate){
           accTriggerCasePriorityHandler.afterUpdate(Trigger.newMap, Trigger.oldMap);
        }
    }
}