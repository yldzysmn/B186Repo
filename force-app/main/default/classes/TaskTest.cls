@isTest

public class TaskTest {
    
    @isTest
    
    static void testHighPriority(){
     String priority =  Task.getTaskPriority('NY');

        System.assertEquals('High', priority );
        
        
    }
    
    @isTest
    static void testNormalPriority(){
        
         String priority =  Task.getTaskPriority('TX');
        
         System.assertEquals('Normal', priority );
    }
    
    @istest
    static void testInvalidEntry(){
        
          String messg =  Task.getTaskPriority('Texas');
        
        
         System.assertEquals('Wrong Abbreviation', messg );
    }

}