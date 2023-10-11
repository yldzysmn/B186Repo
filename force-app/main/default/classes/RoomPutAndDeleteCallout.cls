public class RoomPutAndDeleteCallout {
    public static void updateRoom(){
        String roomToUpdate = '{"id":77040, "roomNumber": 616678888, "roomType": "TWIN", "status": true, "price": 779.99, "description": "Second Way"}';
        
         Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://medunna.com/api/rooms');
        request.setMethod('PUT');
        request.setHeader('Authorization', 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ5aWxkaXpzZWNraW4iLCJhdXRoIjoiUk9MRV9BRE1JTiIsImV4cCI6MTY5NjE3Mzg4Nn0.MdLJ-OFVoUjDyUgdXlmXdgo-csGOH7hVGdudfawKbkJrFWFuhAqSoH-sl9bDXUyd8KphMvbIF6X4n_TucVEzew');
        request.setHeader('Content-Type', 'application/json'); //body type 
        request.setBody(roomToUpdate); //body is defined by using wrapper class
        
       HttpResponse response = http.send(request);
        System.debug('Status code :' + response.getStatusCode());
        System.debug('Status: ' + response.getStatus());
        System.assert(response.getStatusCode() ==200, 'Status code does not match!');
    }
    public static void deleteRoom(Integer roomId){
         Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://medunna.com/api/rooms/' + roomId);
        request.setMethod('DELETE');
        request.setHeader('Authorization', 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ5aWxkaXpzZWNraW4iLCJhdXRoIjoiUk9MRV9BRE1JTiIsImV4cCI6MTY5NjE3Mzg4Nn0.MdLJ-OFVoUjDyUgdXlmXdgo-csGOH7hVGdudfawKbkJrFWFuhAqSoH-sl9bDXUyd8KphMvbIF6X4n_TucVEzew');
        request.setHeader('Content-Type', 'application/json'); //body type 
       
        
       HttpResponse response = http.send(request);
       
        System.debug('Status code :' + response.getStatusCode());
        System.debug('Status: ' + response.getStatus());
        
        System.assert(response.getStatusCode() ==204, 'Status code does not match!');
        
    }

}