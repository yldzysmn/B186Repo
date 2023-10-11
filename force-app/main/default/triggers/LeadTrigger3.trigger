trigger LeadTrigger3 on Lead (before update) {
    //Lead guncellendiginde eski ve yeni lastname i console a yazdir
    If(Trigger.isBefore && Trigger.isUpdate){
       /* first way for(Lead w: Trigger.new){
            System.debug('Lead in yeni soy ismi :'  + w.LastName);
             System.debug('Lead in eski soy ismi :'  + Trigger.oldMap.get(w.Id).LastName);
            //Trigger.oldMap.get(w.Id) icindeki eski halin tum fieldleri vardir.
            //get() icine key yani Id yi yazdik. O da bize Lead yani value yi komple verdi
        } */
        /* 2.way
        for(Lead w: Trigger.new){
      List<Lead> ld= [SELECT LastName FROM Lead WHERE ID IN: Trigger.old];
            System.debug(w.LastName);
            System.debug(ld);
            //id siz sadece lastname i almak icin
            for(Lead k: ld){
                System.debug(k.LastName);
            }
        } */
        //3.way old icin ayri for acilir
        for(Lead l: Trigger.new){
            System.debug('Yeni soyisim :' + l.LastName);           
        }
        for(Lead ld: Trigger.old){
            System.debug('Eski soyisim :' + ld.LastName);           
        }
        
    }
      

}
//Trigger.new icinden Trigger.old a erismek icin SOQL kullanilir