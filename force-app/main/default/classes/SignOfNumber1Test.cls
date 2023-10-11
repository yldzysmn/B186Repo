@isTest
public class SignOfNumber1Test {
    @isTest
    static void testToBePositive(){
      String signOfResult=SignOfNumber1.displaySign(13);
        System.assertEquals('positive', signOfResult);
    }
    @isTest
    static void testToBeNeuter(){
       String signOfNeuter = SignOfNumber1.displaySign(0);
        System.assertEquals('neuter', signOfNeuter);
    }
    @isTest
    static void testToBeNegative(){
        String signOfNegative= SignOfNumber1.displaySign(-25);
        System.assertEquals('negative', signOfNegative);
    }
    

}