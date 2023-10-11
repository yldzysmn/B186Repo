public class Task1 {
    public static String getTaskPriority(String state){
        //validate input first
        if(String.isBlank(state) || state.length() != 2){
            return 'Wrong abbreviation';
        }
        String taskPriority;
        if(State == 'CA' || State == 'NY'){
            taskPriority = 'High';
        } else{
            taskPriority ='Normal';
        }
        return taskPriority;
    }
       //EXAMPLE 3: Based upon given State abbreviation, determine eac state's Task Priority status(return priority)
       // method will get abbreviation as an argument in parameter

}