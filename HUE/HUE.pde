import gab.opencv.*;
import processing.video.*;
import processing.sound.*;
import java.awt.*;

int p=0;
PFont Pixel;
PImage[] azulito = new PImage[4];
PImage[] amarillito = new PImage[4];
PImage[] azulitoCantor = new PImage[2];
PImage[] amarillitoCantor = new PImage[2];
PImage[] titulo = new PImage[4];
PImage Fondo;
int f1,f2,f3,f4,f5;
boolean play1,play2;

SoundFile primero;
SoundFile segundo;
Capture webcam;
OpenCV opencv;

personajes azul;
personajes amarillo;
personajes azulCantor;
personajes amarilloCantor;
personajes nombre;

void setup(){
  frameRate(7);
  webcam = new Capture(this,640,480);
  
  size(800,400);
  
  Fondo = loadImage("Fondo.png");
  primero = new SoundFile(this,"Melodia1.wav");
  segundo = new SoundFile(this,"Melodia2.wav");
  azul = new azul();
  amarillo = new amarillo();
  azulCantor = new azulCantor();
  amarilloCantor = new amarilloCantor();
  nombre = new nombre();
  Pixel = loadFont("Pixel.vlw");
  opencv = new OpenCV(this,640,480);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  
  webcam.start();
  
  for (int i = 0; i<azulito.length; i+=1){
    azulito[i] = loadImage((i+1)+"B.png");
  }
  
  for (int i = 0; i<amarillito.length; i+=1){
    amarillito[i] = loadImage((i+1)+"Y.png");
  }
  
  for (int i = 0; i<azulitoCantor.length; i+=1){
    azulitoCantor[i] = loadImage((i+1)+"BS.png");
  }
  
  for (int i = 0; i<amarillitoCantor.length; i+=1){
    amarillitoCantor[i] = loadImage((i+1)+"YS.png");
  }
  
  for (int i = 0; i<titulo.length; i+=1){
    titulo[i] = loadImage((i+1)+"Titulo.png");
  }
}

void draw(){
  background(255);
  opencv.loadImage(webcam);
  noFill();
  stroke(0,0,255);
  strokeWeight(3);
  
  Rectangle[] faces = opencv.detect();
  println(faces.length);
  
  if (faces.length==0){
    background(255);
    image(Fondo,400,200);
    nombre.display();
    azul.display();
    amarillo.display();
    segundo.stop();
    textFont(Pixel);
    textAlign(CENTER,BOTTOM);
    textSize(12);
    fill(0);
    text("Acerca tu rostro y el de un amigx y escucha nuestra canción",400,380);
  }
  
  if (faces.length==1){
    background(255);
    image(Fondo,400,200);
    nombre.display();
    azulCantor.display();
    amarillo.display();
    if(!play1){
      primero.play();
      play1=true;
    }
  }
  if (faces.length==2){
    background(255);
    image(Fondo,400,200);
    nombre.display();
    azulCantor.display();
    amarilloCantor.display();
    //primero.stop();
    if(!play2){
      primero.loop();
      segundo.loop();
      play1=false;
      play2=true;
    }
  }
}

void captureEvent(Capture c){
  c.read();
}
