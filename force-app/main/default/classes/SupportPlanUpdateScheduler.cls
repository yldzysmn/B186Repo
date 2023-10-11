public class SupportPlanUpdateScheduler implements Schedulable {
     
    public void execute(SchedulableContext sc){
        SupportPlanBatchUpdate batch= new SupportPlanBatchUpdate();
        Database.executeBatch(batch,50);
    }
}