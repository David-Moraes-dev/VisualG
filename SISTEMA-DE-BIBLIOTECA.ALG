Algoritmo "Sistema-de-biblioteca"
//  
//  
//Autor: David Medeiros de Moraes.
//Descrição: simulação de um sistema de biblioteca. O foco deste projeto é evoluir e conceituar a habilidade de lógica de programação e algoritmos.
//Funcionalidades:
//Cadastro de livros.
//Cadastro de usuários.
//Empréstimo de livros.
//Devolução.
//Pesquisa por título.
//Pesquisa por autor.

Var
   livro_errado, nome_errado, cpf_errado, livro_encontrado, cpf_encontrado, cpf_cheio, autor_encontrado: logico
   opcao, i, opcao_emprestimo, indice_cpf, indice_livro: inteiro
   livro_cadastro, nome_usuario, cpf_usuario, nome_livro, certeza_escolha, nome_autor: caractere
   livros, autor, cpf, nome_usuarios, cep, numero_usuario: vetor[1..50] de caractere
   cpf_com_livro: vetor[1..50] de inteiro
   
procedimento menu()
inicio
      escreval("============================")
      escreval("  SISTEMA DE BIBLIOTECA")
      escreval("============================")
      escreval("1 - Cadastrar livros")
      escreval("2 - Cadastrar usuário")
      escreval("3 - Empréstimo de livros")
      escreval("4 - Devolução")
      escreval("5 - Pesquisa por título")
      escreval("6 - Pesquisa por autor")
      escreval("7 - sair")
      escreval("============================")
      
fimprocedimento


procedimento cadastro_livro()
inicio
      escreva("Digite o nome do livro que você deseja cadastrar(sem acentos e letras maiúsculas): ")
      leia(livro_cadastro)
      para i <- 1 ate 50 faca
           se (livro_cadastro = "") entao
              livro_errado <- verdadeiro
              escreval("Nome inválido!")
              interrompa
           fimse
      fimpara
      para i <- 1 ate 50 faca
           se(livro_errado = falso) e(livros[i] = "") entao
               livros[i] <- livro_cadastro
               escreva("Digite o nome do autor do livro(sem acentos e letras maiúsculas): ")
               leia(autor[i])
               escreval("Livro cadastrado com sucesso!")
               interrompa
           fimse
      fimpara
      se(livros[50] <> "") entao
          escreval("Você chegou no limite de livros cadastrados!")
      fimse
      
fimprocedimento

procedimento cadastro_usuario()
inicio
      escreva("Digite o CPF do usuário: ")
      leia(cpf_usuario)
      para i <- 1 ate 50 faca
           se (cpf_usuario = "") ou (compr(cpf_usuario) <> 11) entao
              cpf_errado <- verdadeiro
              escreval("CPF inválido!")
              interrompa
           fimse
           se(cpf[i] = cpf_usuario) e (cpf[i] <> "") entao
               cpf_errado <- verdadeiro
               escreval("CPF já cadastrado!")
               interrompa
           fimse
      fimpara
      para i <- 1 ate 50 faca
           se(cpf_errado = falso) e (cpf[i] = "") entao
               escreva("Digite o nome do usuário: ")
               leia(nome_usuarios[i])
               escreva("Digite o CEP do usuário: ")
               leia(cep[i])
               se(compr(cep[i]) <> 8) entao
                   escreval("CEP inválido!")
                   interrompa
               senao
                    escreva("Digite o número para contato: ")
                    leia(numero_usuario[i])
               fimse
               se (compr(numero_usuario[i]) < 10) ou (compr(numero_usuario[i]) > 15) entao
                  escreval("Número inválido!")
                  interrompa
               senao
               cpf[i] <- cpf_usuario
               escreval("Usuário cadastrado com sucesso!")
               interrompa
               fimse
           fimse
      fimpara
      se (cpf[50] <> "") entao
         escreval("Você chegou no limite de usuários cadastrados!")
      fimse
           
      
      
fimprocedimento

procedimento emprestimo()
inicio
      escreva("Digite o nome do livro(sem acentos e letras maiúsculas): ")
      leia(nome_livro)
      para i <- 1 ate 50 faca
           se(nome_livro = livros[i]) e (nome_livro <> "") entao
               livro_encontrado <- verdadeiro
               indice_livro <- i
               interrompa
           fimse
      fimpara
      se(livro_encontrado = falso) entao
             escreval("Livro não encontrado!")
      fimse
      se (livro_encontrado = verdadeiro) entao
               escreval("Para quantos dias você deseja o empréstimo?")
               escreval("=======================")
               escreval("OPÇÕES")
               escreval("=======================")
               escreval("1 - 20 dias")
               escreval("2 - 40 dias")
               escreval("3 - 90 dias")
               escreval("=======================")
               leia(opcao_emprestimo)
               escolha opcao_emprestimo
                       caso 1
                            escreval("A multa em caso de atraso será de R$40,00.")
                            escreval()
                            escreva("Tem certeza da sua escolha? Digite[s/n]: ")
                            leia(certeza_escolha)
                            se(certeza_escolha = "s") entao
                                escreva("Digite seu CPF: ")
                                leia(cpf_usuario)
                            senao
                                 escreval("Voltando...")
                            fimse
                            se(certeza_escolha = "s") entao
                                para i <- 1 ate 50 faca
                                     se (cpf_usuario = cpf[i]) entao
                                        cpf_encontrado <- verdadeiro
                                        indice_cpf <- i
                                     fimse
                                fimpara
                            fimse
                            se(cpf_encontrado = verdadeiro)e (certeza_escolha = "s") entao
                                      se(cpf_usuario = cpf[indice_cpf]) e (cpf_com_livro[indice_cpf] < 3) e (cpf_usuario <> "") entao
                                          cpf_com_livro[indice_cpf] <- cpf_com_livro[indice_cpf] + 1
                                          escreval("Empréstimo de 20 dias feito com sucesso!")
                                          livros[indice_livro] <- ""
                                      fimse
                            fimse
                            se(cpf_encontrado = falso)e (certeza_escolha ="s") entao
                                escreval("CPF não cadastrado!")
                            fimse
                            se(cpf_com_livro[indice_cpf] > 3) e (cpf_encontrado = verdadeiro) e (certeza_escolha = "s")entao
                                escreval("Limite de empréstimos atingido!")
                            fimse
                       caso 2
                            escreval("A multa em caso de atraso será de R$70,00.")
                            escreval()
                            escreva("Tem certeza da sua escolha? Digite[s/n]: ")
                            leia(certeza_escolha)
                            se(certeza_escolha = "s") entao
                                escreva("Digite seu CPF: ")
                                leia(cpf_usuario)
                            senao
                                 escreval("Voltando...")
                            fimse
                            se(certeza_escolha = "s") entao
                                para i <- 1 ate 50 faca
                                     se (cpf_usuario = cpf[i]) entao
                                        cpf_encontrado <- verdadeiro
                                        indice_cpf <- i
                                     fimse
                                fimpara
                            fimse
                            se(cpf_encontrado = verdadeiro)e (certeza_escolha = "s") entao
                                      se(cpf_usuario = cpf[indice_cpf]) e (cpf_com_livro[indice_cpf] < 3) e (cpf_usuario <> "") entao
                                          cpf_com_livro[indice_cpf] <- cpf_com_livro[indice_cpf] + 1
                                          escreval("Empréstimo de 40 dias feito com sucesso!")
                                          livros[indice_livro] <- ""
                                      fimse
                            fimse
                            se(cpf_encontrado = falso)e (certeza_escolha ="s") entao
                                escreval("CPF não cadastrado!")
                            fimse
                            se(cpf_com_livro[indice_cpf] > 3) e (cpf_encontrado = verdadeiro) e (certeza_escolha = "s")entao
                                escreval("Limite de empréstimos atingido!")
                            fimse
                       caso 3
                            escreval("A multa em caso de atraso será de R$100,00.")
                            escreval()
                            escreva("Tem certeza da sua escolha? Digite[s/n]: ")
                            leia(certeza_escolha)
                            se(certeza_escolha = "s") entao
                                escreva("Digite seu CPF: ")
                                leia(cpf_usuario)
                            senao
                                 escreval("Voltando...")
                            fimse
                            se(certeza_escolha = "s") entao
                                para i <- 1 ate 50 faca
                                     se (cpf_usuario = cpf[i]) entao
                                        cpf_encontrado <- verdadeiro
                                        indice_cpf <- i
                                     fimse
                                fimpara
                            fimse
                            se(cpf_encontrado = verdadeiro)e (certeza_escolha = "s") entao
                                      se(cpf_usuario = cpf[indice_cpf]) e (cpf_com_livro[indice_cpf] < 3) e (cpf_usuario <> "") entao
                                          cpf_com_livro[indice_cpf] <- cpf_com_livro[indice_cpf] + 1
                                          escreval("Empréstimo de 90 dias feito com sucesso!")
                                          livros[indice_livro] <- ""
                                          se(cpf_com_livro[indice_cpf] = 3) e (cpf_encontrado = verdadeiro) e (certeza_escolha = "s")entao
                                               escreval("Limite de empréstimos atingido!")
                                          fimse
                                      fimse
                            fimse
                            se(cpf_encontrado = falso)e (certeza_escolha ="s") entao
                                escreval("CPF não cadastrado!")
                            fimse
               fimescolha
      fimse
               
fimprocedimento


procedimento devolucao()
inicio
    escreva("Digite seu CPF: ")
    leia(cpf_usuario)
    para i <- 1 ate 50 faca
         se (cpf_usuario = cpf[i]) e (cpf[i] <> "")  entao
            cpf_encontrado <- verdadeiro
            indice_cpf <- i
            se(cpf_encontrado = verdadeiro) e (cpf_com_livro[indice_cpf] = 0) entao
            escreval("Não possui nenhum livro cadastrado com este CPF!")
            fimse
            se(cpf_com_livro[indice_cpf] <> 0) entao
                escreva("Houve atraso? [s/n] ")
                leia(certeza_escolha)
            fimse
                se(certeza_escolha = "s") e (cpf_encontrado = verdadeiro) entao
                    escreval("O empréstimo foi de quantos dias? ")
                    escreval("=======================")
                    escreval("OPÇÕES")
                    escreval("=======================")
                    escreval("1 - 20 dias")
                    escreval("2 - 40 dias")
                    escreval("3 - 90 dias")
                    escreval("=======================")
                    leia(opcao_emprestimo)
                    escolha opcao_emprestimo
                        caso 1
                             escreva("Digite o nome do livro(sem acentos e letras maiúsculas): ")
                             leia(nome_livro)
                             escreval("Multa de R$40,00 pendente!")
                             cpf_com_livro[indice_cpf] <- cpf_com_livro[indice_cpf] - 1
                             para i <- 1 ate 50 faca
                                  se(livros[i] = "") entao
                                      livros[i] <- nome_livro
                                      escreval("Devolução realizada!")
                                      interrompa
                                  fimse
                             fimpara

                        caso 2
                             escreva("Digite o nome do livro(sem acentos e letras maiúsculas): ")
                             leia(nome_livro)
                             escreval("Multa de R$70,00 pendente!")
                             cpf_com_livro[indice_cpf] <- cpf_com_livro[indice_cpf] - 1
                             para i <- 1 ate 50 faca
                                  se(livros[i] = "") entao
                                      livros[i] <- nome_livro
                                      escreval("Devolução realizada!")
                                      interrompa
                                  fimse
                             fimpara
                        caso 3
                             escreva("Digite o nome do livro(sem acentos e letras maiúsculas): ")
                             leia(nome_livro)
                             cpf_com_livro[indice_cpf] <- cpf_com_livro[indice_cpf] - 1
                             escreval("Multa de R$40,00 pendente!")
                             para i <- 1 ate 50 faca
                                  se(livros[i] = "") entao
                                      livros[i] <- nome_livro
                                      escreval("Devolução realizada!")
                                      interrompa
                                  fimse
                             fimpara
                fimescolha
                fimse
            senao
                 se(cpf_encontrado = verdadeiro) e (certeza_escolha = "n") entao
                     escreva("Digite o nome do livro(sem acentos e letras maiúsculas): ")
                     leia(nome_livro)
                     para i <- 1 ate 50 faca
                         se(livros[i] = "") entao
                         livros[i] <- nome_livro
                         cpf_com_livro[indice_cpf] <- cpf_com_livro[indice_cpf] - 1
                         escreval("Devolução realizada!")
                         interrompa
                         fimse
                     fimpara
                 fimse
            fimse
    fimpara
    se(cpf_encontrado = falso) entao
        escreval("CPF não cadastrado!")
    fimse

fimprocedimento



procedimento pesquisa_titulo()
inicio
      escreva("Digite o nome do livro procurado(sem acentos e letras maiúsculas):")
      leia(nome_livro)
      para i <- 1 ate 50 faca
           se(nome_livro = livros[i]) entao
                escreval("Livro disponível!")
                escreval("Autor: ", autor[i])
                livro_encontrado <- verdadeiro
                interrompa
           fimse
      fimpara
      se(livro_encontrado = falso) entao
          escreval("Livro não encontrado!")
      fimse
fimprocedimento



procedimento pesquisa_autor
inicio
      escreva("Digite o nome do autor desejado: ")
      leia(nome_autor)
      para i <- 1 ate 50 faca
           se(nome_autor = autor[i]) entao
               escreval("Obras disponíveis: ", livros[i])
               autor_encontrado <- verdadeiro
           fimse
      fimpara
      se(autor_encontrado = falso) entao
          escreval("Autor não encontrado")
      fimse
fimprocedimento

Inicio
      repita
            livro_encontrado <- falso
            cpf_encontrado <- falso
            opcao_emprestimo <- 0
            livro_errado <- falso
            cpf_errado <- falso
            indice_cpf <- 1
            indice_livro <- 1
            cpf_cheio <- falso
            nome_errado <- falso
            autor_encontrado <- falso
            menu()
            leia(opcao)
            escolha opcao
                    caso 1
                         cadastro_livro()
                    caso 2
                         cadastro_usuario()
                    caso 3
                         emprestimo()
                    caso 4
                         devolucao()
                    caso 5
                         pesquisa_titulo()
                    caso 6
                         pesquisa_autor
                    caso 7
                         escreval("Saindo...")
                    outrocaso
                         escreval("Opção inválida!")
            fimescolha
            
      ate(opcao = 7)


Fimalgoritmo