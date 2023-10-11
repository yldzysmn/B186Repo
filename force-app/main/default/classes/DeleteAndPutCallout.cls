public class DeleteAndPutCallout {
    public static void putRoom(){
        String roomToUpdate= '{"id":77154, "roomNumber": 818426,"roomType": "TWIN","status": true,"price": 250.00,"description": "Updated with Put method"}';
        Http http= new Http();
        HttpRequest request= new HttpRequest();
        request.setEndpoint('https://medunna.com/api/rooms');
        request.setMethod('PUT');
        request.setHeader('Authorization', 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ5aWxkaXpzZWNraW4iLCJhdXRoIjoiUk9MRV9BRE1JTiIsImV4cCI6MTY5NjE3Mzg4Nn0.MdLJ-OFVoUjDyUgdXlmXdgo-csGOH7hVGdudfawKbkJrFWFuhAqSoH-sl9bDXUyd8KphMvbIF6X4n_TucVEzew');
        request.setHeader('Content-Type', 'application/json');
        request.setBody(roomToUpdate);
        HttpResponse response= http.send(request);
        
        System.debug('Status code :' + response.getStatusCode());
        System.debug('Status:' + response.getStatus());
        System.assert(response.getStatusCode()== 200, 'Status code does not match');
    }
     public static void deleteRoom(Integer roomId){
         Http http = new Http();
        HttpRequest request= new HttpRequest();
        request.setEndpoint('https://medunna.com/api/rooms/' + roomId);// get Id by method parameter 
        request.setMethod('DELETE');
        request.setHeader('Authorization', 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ5aWxkaXpzZWNraW4iLCJhdXRoIjoiUk9MRV9BRE1JTiIsImV4cCI6MTY5NjE3Mzg4Nn0.MdLJ-OFVoUjDyUgdXlmXdgo-csGOH7hVGdudfawKbkJrFWFuhAqSoH-sl9bDXUyd8KphMvbIF6X4n_TucVEzew');
        HttpResponse response= http.send(request);
         System.debug('Status code :' + response.getStatusCode());
         System.debug('Status' +  response.getStatus());
         System.assert(response.getStatusCode() == 204 , 'Status code does not match');
    }


}