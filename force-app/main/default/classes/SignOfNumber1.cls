public class SignOfNumber1 {
    public static String displaySign(Integer x){
        if(x>0){
            return 'positive';
        } else if(x==0){
            return 'neuter';
        } else{
            return 'negative';
        }
    }

}