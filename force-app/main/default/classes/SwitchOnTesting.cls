public class SwitchOnTesting {
    
    public String getRandomLetters(){
        //first define the letter in the method structure....
    	String letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
        
          
   			//by using random() method, randomly values between 0.0 and 1.0 will be taken.  
   			//then we are extending the random value by mupltiplicating with 51. 
   			//so we are able to use the number to reach out indexes in letters container from 0-51    
        Integer index = Integer.valueOf(Math.random()*51);            
		System.debug(index);
        
        
           
                //we defined return type when we are creating the method. 
                //so the method must return string et the end....
        System.debug(letters.substring(index, index+1));
        return letters.substring(index, index+1);       
        
    }
    
    

}


    /*
         
			1) Methods should be created in Classes
			2) To create a method:
				i) Type "access modifier": There are 4 access modifiers
					a) global: it can be access even from other applications
					b) public: it can be accessed from the entire project like a public library...
					c) protected: it can be used from inner classes 
					d) private: it can be used just from inside the class the data was created. Like a driving licence
				ii)Type "return type": Data type. which the method will give you in return...(It can be apex data types or "void") 	
				iii) Type method name: a)Method name should summarize the functionality
										b)Use camelCase when you name a method
				iv) Put method parenthesis: From the parenthesis, Apex cam understand it is a method.
				v) Use { }: The part between the curly brackets is called "Method Body"
					
         */