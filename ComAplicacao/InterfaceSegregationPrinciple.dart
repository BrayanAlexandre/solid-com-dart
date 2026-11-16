abstract class Animal {
  void comer();
}
abstract class Voador {
  void voar();
}
abstract class Nadador {
  void nadar();
}

class Cachorro implements Animal {
  void comer() {
    print('Comendo');
  }
}

class Aguia implements Animal, Voador {

  void comer() {
    print('Comendo');
  }
  void voar() {
    print('Voando');
  }
}
void main(){
  Cachorro cachorro = Cachorro();
  cachorro.comer();
  Aguia aguia = Aguia();
  aguia.comer();
  aguia.voar();
}