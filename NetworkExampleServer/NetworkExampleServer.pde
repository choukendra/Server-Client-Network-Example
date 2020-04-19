//server
//note for this example only one client available
import processing.net.*;

Server myServer;
String incoming;

void setup() {
  size(300, 300);
  textAlign(CENTER, CENTER);
  textSize(20);

  incoming = ""; 
//port # must match client's
  myServer = new Server (this, 1234);
}

void draw() {
  background(0); 
  fill(255);
  text(incoming, width/2, height/2+100);
  
  Client myClient = myServer.available(); //1st find client that's available, not how many messages waiting for you like the client
  if (myClient != null){ //if not null => recieved a message
   incoming = myClient.readString(); //we can read the message
  }
}

void mousePressed() {
  myServer.write("HELLO"); //sends to all clients
}
