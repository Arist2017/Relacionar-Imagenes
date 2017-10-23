class Boton
{
  //atributos
  int Xposicion;
  int Yposicion;
  int ancho;
  int altura;
  color btn= color(#679FCB);
  //PImage imagen;
  int identidad;

  //constructor
  

  //metodos
  void Mostrar() {

    fill(btn);
    rect(Xposicion, Yposicion, ancho,altura,4);
    fill(0);
    text(identidad, Xposicion+5, Yposicion+5);
    
  }
  
  //limites
  boolean MouseIsOver() {

    if (mouseX>=Xposicion && mouseX<=Xposicion+ancho && mouseY>=Yposicion && mouseY<=Yposicion+altura) {
      btn=color(#0F4952);
      return true;
    } else {
      btn= color(#679FCB);
      return false;
    }
  }
}

class BotonImagen extends Boton{

  PImage imagen;
  
  BotonImagen(int Xposicion, int Yposicion, int ancho, int altura,PImage imagen,int identidad)
  { 

    this.Xposicion=Xposicion;
    this.Yposicion=Yposicion;
    this.ancho=ancho;
    this.altura=altura;
    this.imagen=imagen;
    this.identidad=identidad;
  }


  void Mostrar() {

    fill(btn);
    rect(Xposicion, Yposicion, ancho,altura,4);
    fill(0);
    text(identidad, Xposicion+5, Yposicion+10);
    image(imagen,Xposicion+9, Yposicion+9, ancho-9,altura-9);
  }
}
class BotonTexto extends Boton{

  String texto;
  
  BotonTexto(int Xposicion, int Yposicion, int ancho, int altura,String texto,int identidad)
  { 

    this.Xposicion=Xposicion;
    this.Yposicion=Yposicion;
    this.ancho=ancho;
    this.altura=altura;
    this.texto=texto;
    this.identidad=identidad;
  }


  void Mostrar() {

    fill(btn);
    rect(Xposicion, Yposicion, ancho,altura,4);
    fill(0);
    text(identidad, Xposicion+5, Yposicion+10);
    text(texto,Xposicion+5, Yposicion+5);
  }
}