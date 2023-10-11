trigger LeadTrigger2 on Lead (before insert, before update, before delete) {
    If((Trigger.isBefore && Trigger.isInsert) || (Trigger.isBefore && Trigger.isUpdate)){
    for(Lead w: Trigger.new){
        If(String.isBlank(w.Industry)){
            w.Industry.addError('Industry cannot be empty');
        }
    }
  }
    If (Trigger.isBefore && Trigger.isDelete){
        for(Lead ld: Trigger.old){
            If(ld.Industry=='Education'){
                ld.Industry.addError('You cannot delete it');
            }
        }
    }
}