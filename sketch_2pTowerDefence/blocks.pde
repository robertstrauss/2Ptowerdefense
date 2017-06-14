interface space{
  
  int blockSize = 50;

  int mapWidth = 10;

  int mapHeight = 16;
  
}

class block implements space{
  byte type;//having less thatn 255 types simplifies things going over the server
  int x;
  int y;
  int health;
  int placementLevel = 0;//0 = anywhere, 1 = anywhere but no place zone, 2 = only blocker zone
  block(){
  }
  void setPosition(int x, int y){
    this.x = x;
    this.y = y;
  }
  void setupObjectData(JSONObject data){
    type = (byte) data.getInt("type");
    health = data.getInt("health");
    placementLevel = data.getInt("placementLevel");
  }
  void display(){
    pushMatrix();
    translate(x, y, -(blockSize/2));
    box(blockSize, blockSize, blockSize/2);
  }
}

class wall extends block{
  wall(){
  }
  void display(){
    pushMatrix();
    translate(x, y, 0);
    box(blockSize, blockSize, blockSize);
  }
}

class machineGun extends block{
  machineGun(){
  }
  void display(){
    pushMatrix();
    translate(x, y, 0);
    box(blockSize, blockSize, blockSize);
  }
}
class turret extends block{
  turret(){
  }
  void display(){
    pushMatrix();
    translate(x, y, 0);
    box(blockSize, blockSize, blockSize);
  }
}
class mine extends block{
  mine(){
  }
  void display(){
    pushMatrix();
    translate(x, y, 0);
    box(blockSize, blockSize, blockSize);
  }
}