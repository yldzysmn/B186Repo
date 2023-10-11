trigger AccountTrigger on Account (before update) {
    If(Trigger.isBefore && Trigger.isUpdate){
        for(Account acc: Trigger.new){
           Account oldVer= Trigger.oldMap.get(acc.Id);
            If(acc.Name != oldVer.Name){
                System.debug(acc.Name + ' - ' + oldVer.Name);
            }
            
        }
    }

}