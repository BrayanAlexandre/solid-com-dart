import 'dart:io';

abstract class CalculadoraMedia {
  double calcular(double nota1, double nota2);
}

class MediaAritmetica implements CalculadoraMedia {
  @override
  double calcular(double nota1, double nota2) => (nota1 + nota2) / 2;
}
class BoletimService {
  final CalculadoraMedia calculadora;

  BoletimService(this.calculadora);

  String avaliar(double nota1, double nota2) {
    final resultado = calculadora.calcular(nota1, nota2);
    final situacao = resultado >= 7 ? 'Aprovado!' : 'Reprovado!';
    return 'Resultado: $resultado\n$situacao';
  }
}
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
    final n1 = double.parse(nota1);
    final n2 = double.parse(nota2);
    final service = BoletimService(MediaAritmetica());

    print(service.avaliar(n1, n2));
  } catch (e) {
    print('Digite uma nota valida!');
  }
}