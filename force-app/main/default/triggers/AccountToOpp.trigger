trigger AccountToOpp on Account (after insert) {
    If(Trigger.isAfter && Trigger.isInsert) {
        createOppHandler.createOpp(Trigger.new);
    }  
    If(Trigger.isAfter && Trigger.isUpdate) {
        createOppHandler.createOpp(Trigger.new);
    }  
    
}