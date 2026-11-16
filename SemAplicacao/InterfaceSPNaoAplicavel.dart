abstract class Animal {
  void comer();
  void voar();
  void nadar();
}
class Cachorro implements Animal {
  void comer() {
    print('Comendo');
  }
  void voar() {
    throw Exception('Cachorro não voa');
  }
  void nadar() {
    throw Exception('Cachorro não nada');
  }
}
void main(){
  Cachorro cachorro = Cachorro();
  cachorro.voar();
  cachorro.comer();
  cachorro.nadar();
}