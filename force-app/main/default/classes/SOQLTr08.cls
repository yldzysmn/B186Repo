public class SOQLTr08 {
//
    public static void undeleteOpp(){
     List<Opportunity>  opp= [SELECT Id FROM Opportunity WHERE isDeleted= true ALL ROWS];
        Database.undelete(opp);
        
    }
}