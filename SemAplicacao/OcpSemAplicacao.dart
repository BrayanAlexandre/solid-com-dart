import 'dart:io';

void main() {
  print("Escolha a forma de pagamento:");
  print("1 - Dinheiro");
  print("2 - Pix");
  print("3 - Cartão");

  String? opcao = stdin.readLineSync();

  if (opcao == null || opcao.isEmpty) {
    print("Nenhuma opção foi digitada!");
    return;
  }

  try {
    int escolha = int.parse(opcao);

    switch (escolha) {
      case 1:
        print("Pagamento em dinheiro");
        break;

      case 2:
        print("Pagamento via Pix");
        break;

      case 3:
        print("Pagamento com cartão");
        break;

      default:
        print("Opção inválida!");
        return;
    }
  } catch (e) {
    print("Erro: $e");
    return;
  }
}