public class SignOfNumber {
    //Example 1: Create an Apex method to returning sign of entered Integer value by parameter...
    // enter 5 => positive;   enter -3 => negative;   enter 0 => Neuter
    public static String displaySign(Integer x){
        
        
        if(x>0){
           System.debug('Positive!'); //optional... not read by test class.. no functionality in system...
            return 'Positive R';
        
        }else if(x==0){
            
            System.debug('Neuter');
            return 'Neuter R';
            
        }else{
            
            System.debug('Negative');
            return 'Negative R';   
        }
    } 
}