public class MedunnaRoomPostCall {
    public static void postRoom(){
         //use Room wrapper class and fill out the data
        Room room = new Room();
        room.description =  'Created a room with wrapper class';
        room.price = 123;
        room.roomNumber= 555587790;
        room.roomType = 'DELUXE';
        room.status = true;
        
       String apexToJson = JSON.serialize(room); //apex to json: serialize
        
        Http http= new Http();
        HttpRequest request= new HttpRequest();
        request.setEndpoint('https://medunna.com/api/rooms'); 
        request.setMethod('POST');
        request.setHeader('Authorization', 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ5aWxkaXpzZWNraW4iLCJhdXRoIjoiUk9MRV9BRE1JTiIsImV4cCI6MTY5NjE3Mzg4Nn0.MdLJ-OFVoUjDyUgdXlmXdgo-csGOH7hVGdudfawKbkJrFWFuhAqSoH-sl9bDXUyd8KphMvbIF6X4n_TucVEzew');
        request.setHeader('Content-Type', 'application/json');
        HttpResponse response= http.send(request);
        System.debug('Status code :' + response.getStatusCode());
        System.debug('Status:' + response.getStatus());
        System.assert(response.getStatusCode() == 200,  'Status code does not match');
                          }
    public class Room{
        public String description;
        public Integer price;
        public Integer roomNumber;
        public string roomType;
        public Boolean status;
        
    }
    public static void RoomPostRequest2(){
        
        String data = '{"roomNumber": 516678888, "roomType": "DELUXE", "status": true, "price": 779.99, "description": "Second Way"}';
        
         Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://medunna.com/api/rooms');
        request.setMethod('POST');
        request.setHeader('Authorization', 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ5aWxkaXpzZWNraW4iLCJhdXRoIjoiUk9MRV9BRE1JTiIsImV4cCI6MTY5NjE3Mzg4Nn0.MdLJ-OFVoUjDyUgdXlmXdgo-csGOH7hVGdudfawKbkJrFWFuhAqSoH-sl9bDXUyd8KphMvbIF6X4n_TucVEzew');
        request.setHeader('Content-Type', 'application/json'); //body type 
        request.setBody(data); //body is defined by using wrapper class
        
       HttpResponse response = http.send(request);
       
        System.debug('Status code :' + response.getStatusCode());
        System.debug('Status: ' + response.getStatus());
        
        System.assert(response.getStatusCode() ==201, 'Status code does not match!');
        
    }
}