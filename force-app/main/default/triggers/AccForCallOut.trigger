trigger AccForCallOut on Account (after insert) {
            
            //when account is inserted create a task 
            //and give me the available rooms from  medunna health system
    List<Task> taskList = new List<Task>();
    
    for(Account acc : Trigger.new){
        
        Task tsk = new Task();
        tsk.Subject = 'Follow up task for account and Room : ' + acc.Name;
        tsk.OwnerId = acc.OwnerId;
        
        taskList.add(tsk);
    }
    
    insert taskList;
    
    //get rooms from medunna
    MedunnaRoomCallOut.getRoom(5);
    
    /*
     Callout from triggers are currently not supported.
     */ 
    
}