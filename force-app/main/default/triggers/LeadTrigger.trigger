trigger LeadTrigger on Lead (before insert) {
  /* example: Bir Lead kaydi olusturmadan once Lead rating i cold olarak degistiriniz
   System.debug('Hello Trigger');
    for(Lead w: Trigger.new){ //Triggeri tetikleyen Lead objectinin yeni 
        //hali List formatinda Trigger.new in icindedir.
        w.Rating= 'Cold';
        
    }*/

/*----------------------
 Yeni bir lead kaydi olusturmadan once Lead Source u kontrol edin eger bossa
'Other'olarak degistirin*/

 for (Lead ld: Trigger.new){
    if (String.isBlank(ld.LeadSource)){
        ld.LeadSource='Other';
    }
}
        }