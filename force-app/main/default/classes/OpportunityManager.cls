public with sharing class OpportunityManager {
    /* Create  an apex class and method  to call opportunity records with a filteration on stagename
     by using the data taken from the method parameter as an argument*/

     public static List<Opportunity> OppMan(String stageName){

        List<Opportunity> oppList = [SELECT Id, StageName, CloseDate  From Opportunity Where StageName =: stageName];

        return oppList;




     }
}