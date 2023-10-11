public class TaskClass {
//Example 1: Query the opportunities of which close date is passed and is closed checkbox is unchecked...
    //assign a Task to the Opp Owner that is stating "Update the opportunitites bcs close date is passed!"
    //and this class must work on weekdays 8 AM...
    public static void createTaskForOpp(List<Opportunity> oppList){
        List<Task> taskList= new List<Task>();
        for(Opportunity opp: oppList){
            Task newTask= new Task();
            newTask.Subject= opp.Name + 'Close date is  passed';
            newTask.OwnerId= opp.OwnerId;
            newTask.WhatId= opp.Id;
            taskList.add(newTask);
            
        }
        Insert taskList;
    }
}