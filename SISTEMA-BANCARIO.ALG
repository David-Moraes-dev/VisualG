Algoritmo "SistemaBancario"
//
//Autor: David Medeiros de Moraes
//Descrição: programa que simula um sistema bancário. Foco em evoluir a lógica de programação.
// funcionalidades:
//Criação de contas.
//alterar entre contas
//Depósito.
//Saque.
//Transferência entre contas.
//Consulta de saldo.
//Validação de saldo insuficiente.
//Menu completo.
//Alteração de senha
//Exclusão de conta

Var
   opcao, i, indice_logada, indice_transferencia, indice_cpf: inteiro
   valor_deposito, senha_entrar, senha_criar, valor_saque, cpf_entrar, cpf_criar, cpf_transferencia, valor_transferencia: real
   saldo, cpf, senha: vetor[1..5] de real
   encontrou_cpf, cpf_valido: logico
procedimento menu()
inicio
   escreval("======================================")
   escreval("     SISTEMA BANCÁRIO  ")
   escreval("======================================")
   se (indice_logada <> 0) entao
      escreval("Você está conectado com o CPF:", cpf[indice_logada])
   senao
        escreval("Nenhuma conta conectada")
   fimse
   escreval("======================================")
   escreval("1 - criar conta")
   escreval("2 - entrar")
   escreval("3 - depositar")
   escreval("4 - sacar")
   escreval("5 - transferência entre contas")
   escreval("6 - consultar saldo")
   escreval("7 - sair da conta")
   escreval("8 - alterar senha")
   escreval("9 - excluir conta")
   escreval("10 - sair")
   escreval("======================================")
fimprocedimento

procedimento criarconta()
inicio
   escreva("Digite seu CPF: ")
   leia(cpf_criar)
   para i <- 1 ate 5 faca
         se(cpf_criar = 0) entao
         escreval("CPF inválido.")
         interrompa
         fimse
              se (cpf[1] <> 0) e (cpf[2] <> 0) e (cpf[3] <> 0) e (cpf[4] <> 0)e (cpf[5] <> 0) entao
                 escreval("Limite de contas criadas atingido!")
                 interrompa
              fimse
                   se(cpf_criar = cpf[i]) entao
                                escreval("CPF já existente!")
                                interrompa
                   fimse
                        se(cpf[i] = 0)entao
                             cpf[i] <- cpf_criar
                             cpf_valido <- verdadeiro
                             escreva("Crie sua senha(APENAS NÚMEROS): ")
                             leia(senha_criar)
                             se(senha_criar <> 0) entao
                                 senha[i] <- senha_criar
                                 escreval("Conta criada com sucesso!")
                                 interrompa
                             senao
                                  escreval("Senha e/ou CPF inválidos!")
                                  interrompa
                             fimse
                        fimse
   fimpara

fimprocedimento

procedimento entrarconta()
inicio
   escreva("Digite seu CPF: ")
   leia(cpf_entrar)
   para i <- 1 ate 5 faca
      se (cpf_entrar = CPF[i])e (cpf_entrar <> 0) entao
         encontrou_cpf <- verdadeiro
         indice_cpf <- i
         interrompa
      fimse
   fimpara
   se (encontrou_cpf = verdadeiro) entao
      escreva("Digite sua senha(APENAS NÚMEROS): ")
      leia(senha_entrar)
      se (senha_entrar = senha[indice_cpf]) e (senha_entrar <> 0) e (encontrou_cpf = verdadeiro) entao
         escreval("Você entrou na sua conta!")
         indice_logada <- indice_cpf
      senao
        escreval("Senha incorreta!")
      fimse
   fimse

   se (encontrou_cpf = falso) entao
      escreval("CPF inexistente!")
   fimse

fimprocedimento

procedimento depositar()
inicio
      se (indice_logada = 0) entao
         escreval("Você não conectou em nenhuma conta!")
      fimse
      se (indice_logada <> 0) entao
         escreva("Quanto você deseja depositar? R$")
         leia(valor_deposito)
         se (valor_deposito <= 0) entao
            escreval("Valor inválido!")
            interrompa
         fimse
         saldo[indice_logada] <- valor_deposito + saldo[indice_logada]
         escreval("Depósito realizado com sucesso!")
         escreval()
         escreval("Saldo atual: R$", saldo[indice_logada])
      fimse
fimprocedimento

procedimento saque()
inicio
      se (indice_logada = 0) entao
         escreval("Você não conectou em nenhuma conta!")
      fimse
      se (indice_logada <> 0) entao
         escreva("Quanto você deseja sacar? R$")
         leia(valor_saque)
         se (valor_saque <= 0) ou (valor_saque > saldo[indice_logada]) entao
            escreval("Valor inválido!")
         fimse
            se (valor_saque <= saldo[indice_logada]) entao
               saldo[indice_logada] <- saldo[indice_logada] - valor_saque
               escreval("Saque realizado com sucesso!")
               escreval("Saldo atual: R$", saldo[indice_logada])
            fimse
      fimse
fimprocedimento


procedimento transferencia()
inicio

      escreva("Para qual CPF você deseja transferir? ")
      leia(cpf_transferencia)
      para i <- 1 ate 5 faca
           se(cpf_transferencia = cpf[i]) e (cpf_transferencia <> 0)  e (cpf_transferencia <> cpf[indice_logada]) entao
                encontrou_cpf <- verdadeiro
                escreva("Quanto você deseja transferir? R$")
                leia(valor_transferencia)
                se (valor_transferencia > 0) e (valor_transferencia <= saldo[indice_logada])e (encontrou_cpf = verdadeiro) entao
                   saldo[i] <- valor_transferencia + saldo[i]
                   saldo[indice_logada] <- saldo[indice_logada] - valor_transferencia
                   escreval("Transferência realizada com sucesso!")
                   interrompa
                senao
                     escreval("Valor inválido!")
                     interrompa
                fimse
           fimse
      fimpara
      se (encontrou_cpf = falso) entao
         escreval("CPF não encontrado/inválido.")
      fimse


fimprocedimento



procedimento consultar_saldo()
inicio
      se (indice_logada = 0) entao
         escreval("Você não está conectado em nenhuma conta!")
      senao
           escreval("Seu saldo é de R$", saldo[indice_logada])
      fimse
fimprocedimento

procedimento sair_conta()
inicio
      se(indice_logada <> 0) entao
          indice_logada <- 0
          escreval("Saindo...")
      senao
           escreval("Você não está conectado!")
      fimse
fimprocedimento


procedimento alterar_senha()
inicio
      se (indice_logada = 0) entao
         escreval("Você não está conectado!")
      senao
           escreva("Digite sua senha atual: ")
           leia(senha_entrar)
           se(senha_entrar = senha[indice_logada]) entao
               escreva("Digite sua nova senha: ")
               leia(senha_entrar)
               senha[indice_logada] <- senha_entrar
               escreval("Senha alterada com sucesso!")
           senao
           escreval("Senha inválida")
           fimse
      fimse
fimprocedimento

procedimento excluir()
inicio
      se (indice_logada = 0) entao
         escreval("Você não está conectado!")
      senao
           se (saldo[indice_logada] > 0) entao
              escreval("Você possui saldo na conta!")
           senao
                escreva("Digite sua senha: ")
                leia(senha_entrar)
                se (senha_entrar = senha[indice_logada]) entao
                    escreval("Exclusão feita com sucesso!")
                    saldo[indice_logada] <- 0
                    cpf[indice_logada] <- 0
                    senha[indice_logada] <- 0
                    indice_logada <- 0
                senao
                     se(senha_entrar <> senha[indice_logada]) entao
                                     escreval("Senha incorreta!")
                     fimse
                fimse
           fimse
      fimse
fimprocedimento
              


Inicio
   repita
      encontrou_cpf <- falso
      valor_deposito <- 0
      valor_saque <- 0
      cpf_valido <- falso
      indice_cpf <- 0
      menu()
      leia(opcao)
      escolha opcao
      caso 1
         criarconta()
      caso 2
         entrarconta()
      caso 3
           depositar()
      caso 4
           saque()
      caso 5
           se(indice_logada <> 0) entao
               transferencia()
           senao
                escreval("Você não conectou em nenhuma conta.")
           fimse
      caso 6
           consultar_saldo()
      caso 7
           sair_conta()
      caso 8
           alterar_senha()
      caso 9
           excluir()
      outrocaso
         escreval("Opção inválida.")

      fimescolha


   ate(opcao = 10)
   limpatela
   escreval("======================================")
   escreval("   OBRIGADO PELA PREFERÊNCIA!")
   escreval("======================================")




Fimalgoritmo