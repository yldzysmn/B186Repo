trigger AccountOwnerChange on Account (after Update) {
      If(Trigger.isAfter && Trigger.isUpdate){
         AccountOwnerChangeHandler.updateOwner(Trigger.new, Trigger.oldMap,Trigger.newMap);
      }
}