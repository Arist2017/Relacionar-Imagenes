//minijuego 
//2*4 imagenes en una matriz?
Boton[] botonimg, botonsom;
int comparador=10;
int comparador2=10;
int puntos;
PImage[] imag;
PImage[] somb;
int waitingImage=10;
int waitingSombras=10;
int[][] estadosBoton = new int [5][2]; 

int i=0, i2=0, cantidad=5, rango=5;
int[] arr= new int [cantidad];
int[] arr2= new int [cantidad];


void setup() {

  imag =new PImage[5];
  imag[0] = loadImage("paz.png");
  imag[1] = loadImage("gaitan.png");
  imag[2] = loadImage("La_pola.png");
  imag[3] =  loadImage("simon_bolivar.png");
  imag[4] = loadImage("puente.png");
  somb =new PImage[5];
  somb[0] = loadImage("paz2.png");
  somb[1] = loadImage("gaitan2.png");
  somb[2] = loadImage("La_pola2.png");
  somb[3] =loadImage("simon_bolivar2.png");
  somb[4] = loadImage("puente2.png");

  int j=0;
  float rin=random(0, rango);
  j=floor(rin);
  arr[i]=j;

  for ( i=1; i<cantidad; i++) {
    j=0;
    rin=random(0, rango);
    j=floor(rin);
    arr[i]=j;
    for (int y=0; y<i; y++) {
      if (arr[i]==arr[y]) {
        i--;
      }
    }
  }

  int j2=0;
  float rin2=random(0, rango);
  j2=floor(rin2);
  arr2[i2]=j2;

  for ( i2=1; i2<cantidad; i2++) {
    j2=0;
    rin2=random(0, rango);
    j2=floor(rin2);
    arr2[i2]=j2;
    for (int y=0; y<i2; y++) {
      if (arr2[i2]==arr2[y]) {
        i2--;
      }
    }
  }

  botonimg = new Boton[5];
  botonsom= new Boton[5];
  for (int i=0; i<botonimg.length; i++) {
    botonimg[i] = new BotonImagen(12+i*170, 20, 160, 160, imag[arr[i]], arr[i]);
    botonsom[i] = new BotonImagen(12+i*170, 400, 160, 160, somb[arr2[i]], arr2[i]);

    estadosBoton[i][0]=1;
    estadosBoton[i][1]=1;
  }

  size(900, 620);
  background(#7ED9E8);
}
void draw() {
  background(#7ED9E8);

  fill(0);
  text("puntos"+puntos, width/2, height/2);

  for (int i=0; i<botonimg.length; i++)
  {
    botonimg[i].Mostrar();
    botonsom[i].Mostrar();
  }

  //mantiene el color de los botones
  OutputResultado(0, 1);
  OutputResultado(1, 0);
  OutputResultado(2, 3);
  OutputResultado(3, 4);
  OutputResultado(4, 2);

//si un boton fue selecionado  
  for (int i=0; i<botonimg.length; i++) {
    if (estadosBoton[i][0]==4) {
      estadosBoton[i][0]=1;
    }
    if (i==waitingImage) {
      fill(#0F4952, 180);//azul gisoso
      rect(botonimg[i].Xposicion, botonimg[i].Yposicion, botonimg[i].ancho, botonimg[i].altura, 4);
    }  
  }

  for (int i=0; i<botonimg.length; i++) {

    if (estadosBoton[i][1]==4) {
      estadosBoton[i][1]=1;
    }
    if (i==waitingSombras) {
      fill(#0F4952, 180);//azul gisoso
      rect(botonsom[i].Xposicion, botonsom[i].Yposicion, botonsom[i].ancho, botonsom[i].altura, 4);
    }
  }

  println("img "+comparador+" som "+comparador2);

}
void Comparar(int a, int b) {
  if (botonimg[a].identidad==comparador && botonsom[b].identidad==comparador2 ) {
    estadosBoton[a][0]=3;
    estadosBoton[b][1]=3;
  }
}
void OutputResultado(int a, int b) {
  //cambia de clor el boton

  if (estadosBoton[a][0]==3) {
    fill(2, 24, 213, 200);//blue
    rect(botonimg[a].Xposicion, botonimg[a].Yposicion, botonimg[a].ancho, botonimg[a].altura, 6);
  } 
  if (estadosBoton[b][1]==3) {
    fill(2, 24, 213, 200);//blue
    rect(botonsom[b].Xposicion, botonsom[b].Yposicion, botonsom[b].ancho, botonsom[b].altura, 6);
  }
  if (estadosBoton[a][0]==2) {

    fill(219, 95, 95, 200);//red
    rect(botonimg[a].Xposicion, botonimg[a].Yposicion, botonimg[a].ancho, botonimg[a].altura, 6);
  }
  if (estadosBoton[b][1]==2) {
    fill(219, 95, 95, 200);//red
    rect(botonsom[b].Xposicion, botonsom[b].Yposicion, botonsom[b].ancho, botonsom[b].altura, 6);
  }
}

void keyPressed() {

  if (key==' ') {
    waitingImage=10;
    waitingSombras=10;
    if (comparador<10 && comparador2<10 ) {
      //me compara y cambia el estado de los botones(si es verdadera la respuestas)
      if (comparador==comparador2) {

        for (int i=0; i<botonimg.length; i++) {
          for (int j=0; j<botonimg.length; j++) {

            if (comparador==botonimg[i].identidad && comparador2==botonsom[j].identidad) {
              Comparar(i, j);
              OutputResultado(i, j);
            }
          }
        }
      }
      //compara y cambia el estado de los botones(si es falsa la respuestas)
      if (comparador!=comparador2) {
        for (int i=0; i<botonimg.length; i++) {
          //println("paso");
          if (botonimg[i].identidad==comparador) {
            estadosBoton[i][0]=2;
          }
        }
        for (int j=0; j<botonsom.length; j++) {

          if (botonsom[j].identidad==comparador2 ) {
            estadosBoton[j][1]=2;
          }
        }
      }
      // suma o resta los puntos
      if (comparador==comparador2) {
        puntos+=5;
        //estos cambios son para que oblige al jugador a seguir,buscar otra respuesta
        comparador=10;
        comparador2=10;
      } else {
        puntos-=5;
        comparador=10;
        comparador2=10;
      }
    }

  }
 

}

void mousePressed() {

  //botones imagenes over
  for (int i=0; i<botonsom.length; i++) {
    if (botonimg[i].MouseIsOver() && estadosBoton[i][0]==1) {
      comparador=botonimg[i].identidad;
      waitingImage=i;
    }
  }

  //botones sombras over
  for (int i=0; i<botonsom.length; i++) {
    if (botonsom[i].MouseIsOver() && estadosBoton[i][1]==1) {
      comparador2=botonsom[i].identidad;
      waitingSombras=i;
    }
  }
}