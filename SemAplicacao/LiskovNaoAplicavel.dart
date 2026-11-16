import 'dart:io';
import 'dart:math';
class Forma{
  Forma({required this.perimetro});
  double perimetro;
  double get raio => perimetro / (2*pi);

  void mostrarRaio(){
    print('raio do seu círculo vale: $raio');
  }
}
class Quadrado extends Forma {
  Quadrado({required double perimetro}) : super(perimetro: perimetro);
  double get cateto => perimetro/4;
  double get hipotenusa => cateto * sqrt(2);

  void dividirEmTriangulos(){
    print('se dividires teu quadrado de perimetro $perimetro em dois triangulos retangulos terás por catetos: $cateto e hipotenusa: $hipotenusa');
  }
}
void main(){
  String? acaoUsuario;

  print('qual o perimetro da sua forma? escreva: ');
  String? perimetroStr = stdin.readLineSync();

  if(perimetroStr == null || perimetroStr.isEmpty){
    print('digite um valor nao nulo.');
    return;
  }
  double perimetroForma = double.parse(perimetroStr);
  while(acaoUsuario != 'sair'){

    print('Digite qual sua forma "quadrado" ou "1" para sair: ');
    acaoUsuario = stdin.readLineSync();

    if(acaoUsuario == 'quadrado'){
      Quadrado quadrado = Quadrado(perimetro: perimetroForma);
      quadrado.dividirEmTriangulos();
      quadrado.mostrarRaio();
      acaoUsuario = 'sair';
    }
    else if(acaoUsuario == '1'){
      acaoUsuario = 'sair';
    } else {
      print('digite um comando válido. Tente novamente.');
    }
  }
}