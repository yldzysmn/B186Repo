@isTest
public class SignOfNumberTest {
    
    @isTest static void testToBePositive(){
        
       String signOfNumber = SignOfNumber.displaySign(13);
              
            System.assertEquals('Positive R', signOfNumber);
        //we check if expected (on the left) and actual value (on the right) are the same
        //if expected and actual are the same, test is succesful in this scenario
        
    }
    
    
   
}