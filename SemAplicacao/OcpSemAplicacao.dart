import 'dart:io';

void main() {
  Pagamento pagamento = Pagamento();

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
        pagamento.dinheiro();
        break;

      case 2:
        pagamento.pix();
        break;

      case 3:
        pagamento.cartao();
        break;

      default:
        print("Opção inválida!");
        return;
    }
  } catch (e) {
    print("Digite apenas números: $e");
    return;
  }
}

class Pagamento {
  void dinheiro() {
    print("Pagamento em dinheiro");
  }

  void pix() {
    print("Pagamento via Pix");
  }

  void cartao() {
    print("Pagamento com cartão");
  }
}