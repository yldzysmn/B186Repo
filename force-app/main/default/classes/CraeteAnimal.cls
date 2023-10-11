public class CraeteAnimal {
    public static void postAnimal(){
        Http http= new Http();
        HttpRequest request= new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json; charset=utf-8');
        request.setBody('{"name" : "snake"}');
        HttpResponse response= http.send(request);
        If(response.getStatusCode()==201){
            System.debug(response.getBody());
        } else{
            System.debug('There is unexpected issue' + response.getStatus() + '-' + response.getStatusCode());
        }
    }

}