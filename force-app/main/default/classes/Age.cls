public class Age {
    
    //I will create an appplication...
    //in my application we will gather student ages..
    //and student ages cannot be less than 0
    public static void printOurAge(Integer ourAge){
        //exception scenario
        if(ourAge<0){
            throw new AgeException('Ages cannot be negative');
        }
        //Print the value of entered age on the console
        System.debug('Entered age is :' + ourAge);
    }
}

//in else{} part you can save ages into database in a Student custom object...
/*
 Assignmet: Create Sudent object; age and name fields.. 
in else part do insertion..
 Student__c stu = new Student__c(Age__c = ourAge, Name__c= 'xyz');
insert stu;
*/