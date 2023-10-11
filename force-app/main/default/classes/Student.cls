public class Student {

    //encapsulate all the data by "private" access modifier
    private String name = 'Brad Pitt';
    private Integer age = 53;
    private String stdID = 'BP987654B';
    //all encapsulated....
    
    //How to allow reading hidden data
    
    //create a getter method to read name
    public String getName(){
        
        return name;
    }
    
    public Integer getAge(){
        
        return age;
    }
    
    public String getStdId(){
        
        return stdID;
    }
    //create setter to update hidden data
     public void setName(String name){
    this.name= name;
    
    }    
    
    public void setAge(Integer age){
    this.age= age;
    
    }    
    
    
    
    
    
}