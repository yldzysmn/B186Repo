public class GetOpportunitiesSchedulable implements Schedulable{
    public void execute(SchedulableContext context){
       List<Opportunity> oppList =[SELECT Id, Name, isClosed__c, CloseDate FROM Opportunity WHERE isClosed__c = false AND CloseDate<Today ];
        TaskClass.createTaskForOpp(oppList);
    }

}