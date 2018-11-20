interface personajes{
  void display();
}

class azul implements personajes{
  void display(){
    imageMode(CENTER);
    image(azulito[f1],180,225);
    f1=(f1+1)%azulito.length;
  }
}

class amarillo implements personajes{
  void display(){
    imageMode(CENTER);
    image(amarillito[f2],600,225);
    f2=(f2+1)%amarillito.length;
  }
}

class azulCantor implements personajes{
  void display(){
    imageMode(CENTER);
    image(azulitoCantor[f3],180,225);
    f3=(f3+1)%azulitoCantor.length;
  }
}

class amarilloCantor implements personajes{
  void display(){
    imageMode(CENTER);
    image(amarillitoCantor[f4],600,225);
    f4=(f4+1)%amarillitoCantor.length;
  }
}

class nombre implements personajes{
  void display(){
    imageMode(CENTER);
    image(titulo[f5],400,175);
    f5=(f5+1)%titulo.length;
  }
}
