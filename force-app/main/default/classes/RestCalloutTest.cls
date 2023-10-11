@isTest
public class RestCalloutTest {
     
    @isTest
    public static void getAnimalsTest(){
        RestCalloutMock mock= new RestCalloutMock();
        
        Test.setMock(HttpCalloutMock.class, mock);
        
        Test.startTest();
        HttpResponse response = RestCallouts.getAnimals();        
        System.assertEquals(200, response.getStatusCode());
        System.assertEquals('OK', response.getStatus());
        System.assertEquals('{"animals":["majestic badger","fluffy bunny","scary bear","chicken"]}', response.getBody());
        Test.stopTest();
    }
}