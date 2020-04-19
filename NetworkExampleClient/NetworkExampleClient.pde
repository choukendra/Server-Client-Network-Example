//client
import processing.net.*;

Client myClient;
String incoming;

void setup() {
  size(300, 300);
  textAlign(CENTER, CENTER);
  textSize(20);

  incoming = ""; 
                      //sketch, ip address, port #
  myClient = new Client (this, "127.0.0.1", 1234);
}

void draw() {
  background(255);
  fill(0);
  text(incoming, width/2, height/2-100);
  
  if (myClient.available() > 0){ //check message & how many available 
   incoming = myClient.readString(); //read in message   
  }
}

void mousePressed() {
 myClient.write("HELLO!"); //send message
}
