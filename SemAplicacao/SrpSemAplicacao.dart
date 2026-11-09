import 'dart:io';

void main() {
  Cliente cliente = Cliente();

  while (true) {
    print('\nDigite D para depositar, S para sacar ou X para sair:');
    String? comando = stdin.readLineSync();

    if (comando == null || comando.isEmpty) {
      print('Preencha o campo solicitado!');
      continue;
    }

    String comandoMaiusculo = comando.toUpperCase();

    if (comandoMaiusculo == 'X') {
      print('Sistema encerrado!');
      break;
    }

    if (comandoMaiusculo != 'D' && comandoMaiusculo != 'S') {
      print('Digite apenas D, S ou X!');
      continue;
    }

    if (comandoMaiusculo == 'D') {
      print('Digite o valor do depósito:');
      String? valorDeposito = stdin.readLineSync();

      if (valorDeposito == null || valorDeposito.isEmpty) {
        print('Preencha o campo com o valor do depósito!');
        continue;
      }

      try {
        int valorDepositoNumerico = int.parse(valorDeposito);

        if (valorDepositoNumerico <= 0) {
          print('O valor do depósito deve ser maior que zero!');
          continue;
        }

        int saldoAtualizado = cliente.depositar(valorDepositoNumerico);

        print('Depósito realizado com sucesso!');
        print('Saldo atualizado: R\$ $saldoAtualizado');
      } catch (erro) {
        print('Digite um valor numérico válido!');
      }
    }

    if (comandoMaiusculo == 'S') {
      print('Digite o valor do saque:');
      String? valorSaque = stdin.readLineSync();

      if (valorSaque == null || valorSaque.isEmpty) {
        print('Preencha o campo com o valor do saque!');
        continue;
      }

      try {
        int valorSaqueNumerico = int.parse(valorSaque);

        if (valorSaqueNumerico <= 0) {
          print('O valor do saque deve ser maior que zero!');
          continue;
        }

        if (valorSaqueNumerico > cliente.exibirSaldo()) {
          print('Saldo insuficiente!');
          print('Seu saldo atual é: R\$ ${cliente.exibirSaldo()}');
          continue;
        }

        int saldoAtualizado = cliente.sacar(valorSaqueNumerico);

        print('Saque realizado com sucesso!');
        print('Saldo atualizado: R\$ $saldoAtualizado');
      } catch (erro) {
       print('Digite um valor numérico válido!');
    }
   }
  }
}

class Cliente {
  int saldo = 0;

  int depositar(int valorDepositoNumerico) {
    saldo += valorDepositoNumerico;
    return saldo;
  }

  int sacar(int valorSaqueNumerico) {
    saldo -= valorSaqueNumerico;
    return saldo;
  }

  int exibirSaldo() {
    return saldo;
  }
}