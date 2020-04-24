//server
//note for this example only one client available
import processing.net.*;

Server myServer;
String incoming;
String outgoing;
String valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ 1234567890!@#$%^&*()_+-={}[]:;'<>,./?`~";

void setup() {
  size(300, 300);
  textAlign(CENTER, CENTER);
  textSize(20);

  incoming = ""; 
  outgoing = "";
  //port # must match client's
  myServer = new Server (this, 1234);
}

void draw() {
  background(0); 
  fill(255);
  text(outgoing, width/2, height/2);
  text(incoming, width/2, height/2+100);

  Client myClient = myServer.available(); //1st find client that's available, not how many messages waiting for you like the client
  if (myClient != null) { //if not null => recieved a message
    incoming = myClient.readString(); //we can read the message
  }
}

void keyPressed() {
  //myServer.write("HELLO"); //sends to all clients
  if (key == ENTER) {
    myServer.write(outgoing);
    outgoing = "";
  } else if (key == BACKSPACE && outgoing.length() > 0){
    outgoing = outgoing.substring(0, outgoing.length()-1);
  }else if (valid.contains(""+key)){
    outgoing = outgoing + key;
  }
}
