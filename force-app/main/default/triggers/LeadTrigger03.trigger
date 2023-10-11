trigger LeadTrigger03 on Lead (after update){
    If(Trigger.isAfter && Trigger.isUpdate){
        List<Account> accList= new List<Account> ();
        for(Lead w: Trigger.new){
            Account acc= new Account();
            acc.Name= w.company;
            accList.add(acc);
        }
        insert accList;
    }
}