public class PostCallSecondWay {
    public static void postCall(){
        String data='{"roomNumber": 543765435, "roomType": "DELUXE", "status": true, "price": 750, "description": "Last day of the week"}';
        
        Http http = new Http();
        HttpRequest request= new HttpRequest();
        request.setEndpoint('https://medunna.com/api/rooms');
        request.setMethod('POST');
        request.setHeader('Authorization', 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ5aWxkaXpzZWNraW4iLCJhdXRoIjoiUk9MRV9BRE1JTiIsImV4cCI6MTY5NjE3Mzg4Nn0.MdLJ-OFVoUjDyUgdXlmXdgo-csGOH7hVGdudfawKbkJrFWFuhAqSoH-sl9bDXUyd8KphMvbIF6X4n_TucVEzew');
        request.setHeader('Content-Type', 'application/json');
        request.setBody(data);
        HttpResponse response= http.send(request);
        System.debug('status code:' + response.getStatusCode());
        System.debug('data' + response.getBody());
    }
   
}