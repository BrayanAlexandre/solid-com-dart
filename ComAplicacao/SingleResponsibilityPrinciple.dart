import 'dart:io';

void main() {
 ContaBancaria conta = ContaBancaria();

 Deposito deposito = Deposito(conta);
 Saque saque = Saque(conta);

 while (true) {
  print('\nDigite D para depositar, S para sacar ou X para sair:');
  String? comando = stdin.readLineSync();

  if (comando == null || comando.isEmpty) {
   print('Preencha o campo solicitado!');
   continue;
  }

  String comandoMaiusculo = comando.toUpperCase();

  if (comandoMaiusculo == 'X') {
   print('Programa encerrado!');
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
    print('Preencha o campo solicitado!');
    continue;
   }

   try {
    int valorDepositoNumerico = int.parse(valorDeposito);

    if (valorDepositoNumerico <= 0) {
     print('O valor do depósito deve ser maior que zero!');
     continue;
    }

    int saldoAtualizado =
    deposito.depositar(valorDepositoNumerico);

    print('Depósito realizado com sucesso!');
    print('Saldo atual: R\$ $saldoAtualizado');
   } catch (e) {
    print('Digite apenas números inteiros!');
   }
  }

  if (comandoMaiusculo == 'S') {
   print('Digite o valor do saque:');
   String? valorSaque = stdin.readLineSync();

   if (valorSaque == null || valorSaque.isEmpty) {
    print('Preencha o campo solicitado!');
    continue;
   }

   try {
    int valorSaqueNumerico = int.parse(valorSaque);

    if (valorSaqueNumerico <= 0) {
     print('O valor do saque deve ser maior que zero!');
     continue;
    }

    if (valorSaqueNumerico > conta.saldo) {
     print('Saldo insuficiente!');
     print('Seu saldo atual é: R\$ ${conta.saldo}');
     continue;
    }

    int saldoAtualizado = saque.sacar(valorSaqueNumerico);

    print('Saque realizado com sucesso!');
    print('Saldo atual: R\$ $saldoAtualizado');
   } catch (e) {
    print('Digite apenas números inteiros!');
   }
  }
 }
}

class ContaBancaria {
 int saldo = 0;
}

class Deposito {
Deposito(this.conta);

ContaBancaria conta;

 int depositar(int valorDepositoNumerico) {
  conta.saldo += valorDepositoNumerico;
  return conta.saldo;
 }
}

class Saque {
 Saque(this.conta);

 ContaBancaria conta;

 int sacar(int valorSaqueNumerico) {
  conta.saldo -= valorSaqueNumerico;
  return conta.saldo;
 }
}