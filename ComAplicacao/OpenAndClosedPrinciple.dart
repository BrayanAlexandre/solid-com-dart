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

    Pagamento pagamento;

    switch (escolha) {
      case 1:
        pagamento = Dinheiro();
        pagamento.pagar();
        break;

      case 2:
        pagamento = Pix();
        pagamento.pagar();
        break;

      case 3:
        pagamento = Cartao();
        pagamento.pagar();
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

abstract class Pagamento {
   void pagar();
}

class Dinheiro implements Pagamento {
  void pagar() {
    print("Pagamento em dinheiro");
  }
}

class Pix implements Pagamento {
  void pagar() {
    print("Pagamento via Pix");
  }
}

class Cartao implements Pagamento {
  void pagar() {
    print("Pagamento com cartão");
  }
}