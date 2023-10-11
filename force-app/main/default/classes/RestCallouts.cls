public class RestCallouts {
    //Example: Get the animal data from Heroku App
    
    public static HttpResponse getAnimals(){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode() == 200){
            
           String jsonString = response.getBody();
            System.debug('The response is: ' + jsonString);
            System.debug(response.getStatusCode() + ' -' + response.getStatus());
        
        }else{
            System.debug(response.getStatusCode() + ' - '+ response.getStatus());
        }
        return response;
        
    }
    
}