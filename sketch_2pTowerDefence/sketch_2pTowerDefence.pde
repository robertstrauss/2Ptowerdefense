import processing.net.*;

Map myMap;

Map enenmyMap;

block[] blockTypes = {
  new block(),
  new wall(),
  new machineGun(),
  new turret(),
  new mine()
};//special order

String blockDataFolder = "blocks/";

JSONObject[] blockData;

PShape[] models;


void setup(){
  myMap = new Map();
  enenmyMap = new Map();
  int w = space.mapWidth*20;
  int h = space.mapHeight*20;
  size(100, 100, P3D);
  surface.setResizable(true);
  surface.setSize(w, h);
  JSONObject[] blockData = {
    loadJSONObject(blockDataFolder+"ground/ground.json)"),
    loadJSONObject(blockDataFolder+"wall/wall.json)"),
    loadJSONObject(blockDataFolder+"machinegun/machinegun.json)"),
    loadJSONObject(blockDataFolder+"turret/turret.json)"),
    loadJSONObject(blockDataFolder+"mine/mine.json)")
  };
  this.blockData = blockData;
  models = new PShape[blockData.length];
  for (int i = 0;i<models.length;i++){
    models[i] = loadShape(blockData[i].getString("model"));
  }
}

void draw(){
  
}

class Map implements space{
  
  byte[] simpleMap;
  
  block[][] blocks;
  
  Map(){
    
    blocks = new block[mapWidth][mapHeight];
    
  }
  
  void setupMap(byte[] type){
    for (int i = 0;i<mapHeight;i++){
      for (int j = 0;j<mapWidth;j++){
        blocks[i][j] = blockTypes[type[i*mapWidth+j]];
        blocks[i][j].setPosition(j, i);
        blocks[i][j].setupObjectData(blockData[type[i*mapWidth+j]]);
      }
    }
  }
  
  byte[] mapSetup(){//will be ran once, then sent to opposing player
    for (int i = 0;i<mapHeight;i++){
      for (int j = 0;j<mapWidth;j++){
        simpleMap[i*mapWidth+j] = blocks[i][j].type;
      }
    }
    return(simpleMap);
  }
  
  void display(){
    for (int i = 0;i<mapHeight;i++){
      for (int j = 0;j<mapWidth;j++){
        blocks[i][j].display();
      }
    }
  }
}