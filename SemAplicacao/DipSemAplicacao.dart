import 'dart:io';

void main() {
  print('Digite a primeira nota:');
  String? nota1 = stdin.readLineSync();

  print('Digite a segunda nota:');
  String? nota2 = stdin.readLineSync();

  if (nota1 == null || nota1.isEmpty || nota2 == null || nota2.isEmpty) {
    print('Digite apenas numeros');
    return;
  }

  try {
    double nota01 = double.parse(nota1);
    double nota02 = double.parse(nota2);

    Media media = Media();
    double resultado = media.calcular(nota01, nota02);

    print('Resultado: $resultado');

    if (resultado >= 7) {
      print('Aprovado!');
    } else {
      print('Reprovado!');
    }
  } catch (e) {
    print('Digite uma nota valida!');
  }
}

class Media {
  double calcular(double nota1, double nota2) {
    return (nota1 + nota2) / 2;
  }
}