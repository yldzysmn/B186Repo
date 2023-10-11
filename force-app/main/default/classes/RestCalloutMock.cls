public class RestCalloutMock implements HttpCalloutMock {
    /*
    I am implementing HttpCalloutMock interface to setup my Mock callout platform for external system...
    I will write/provide a method named respond.
    This method is basically the method we will call for response...
    This method receives HttpRequest as an argument in method parameter and this respond method will have a return statement
    This respond method will return HttpResponse data type
    This respond method is also a non-static method 
    */
    public HttpResponse respond(HttpRequest request){
        
        //create response structure here...
    HttpResponse response = new HttpResponse(); //created instance of HttpResponse
        response.setStatusCode(200);
        response.setStatus('OK');
        response.setBody('{"animals":["majestic badger","fluffy bunny","scary bear","chicken"]}');
        
        return response;
    }
    
}