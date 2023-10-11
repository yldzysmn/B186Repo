trigger AccountToContact on Account (after insert) {
       If(Trigger.isAfter && Trigger.isInsert){
           
          /* List<Contact> conList= new List<Contact>();
               for(Account acc: Trigger.new){
                   Contact con = new Contact(LastName= acc.Name + 'Contact' , AccountId= acc.Id);
                   conList.add(con);
               }
           insert conList;
       }
}          
*/

        
        List<Task> taskList = new List<Task>();
        
        
        for(Account w : Trigger.new){
            
             Task taskObj = new Task();
            taskObj.Subject = 'New Account Record is Created!';
            taskObj.WhatId =w.Id; //we connected newly created lead and task with ID's
            
            taskList.add(taskObj);
            
        }
        
      insert taskList;
    }
}