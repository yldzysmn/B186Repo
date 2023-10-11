public class createOppHandler {
    public static void createOpp(List<Account> accList){
        List<Opportunity> oppList= new List<Opportunity>();
        for(Account acc: accList){
            If(acc.Industry == 'Agriculture'){
            Opportunity opp= new Opportunity();
            opp.Name=acc.Name + 'Opp';
            opp.CloseDate=Date.today()+90;
            opp.StageName='Qualification';
            opp.Amount= 150;
            opp.AccountId=acc.Id;
            oppList.add(opp);
        }
        insert oppList;
    }

}
    }