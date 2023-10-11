trigger LeadTrigger4 on Lead (before delete) {
    for(Lead w: Trigger.old){
        System.debug(w.Company + ' ye sahip olan Lead silindi. ');
    }

}