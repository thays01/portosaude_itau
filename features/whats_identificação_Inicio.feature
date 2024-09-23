# language: pt
# encode: UTF-8

@inicio_whats
Funcionalidade: Testar o fluxo de indentificação de inicio para o bot Saude Itau


    @inicio_whats1
    Cenario: Acessar o bot whats saude itau com massa invalida
    Dado que iniciei atendimento no bot whats seguindo ate o fluxo "Massa invalida" informando "massa_invalida_whats"
    Entao valido que fui direcionado ao fluxo whats "Massa invalida"

    @inicio_whats2
    Cenario: Acessar o bot whats itau com cliente não identificado
    Dado que iniciei atendimento no bot whats seguindo ate o fluxo "Cliente nao identificado" informando "massa_nao_identificado"
    Entao valido que fui direcionado ao fluxo whats "Encerramento"

    @inicio_whats3
    Esquema do Cenario: Acessar o bot whats saude itau com massa valida com um unico plano
    Dado que iniciei atendimento no bot whats seguindo ate o fluxo "Nome social" informando "massa_valida"
    Quando escolho a opcao <opcao> no menu "Unico plano"
    Entao valido que fui direcionado ao fluxo whats <fluxo>
    Exemplos:
    |opcao                  |fluxo         |
    |'Carteirinha'          |'Carteirinha'|
    |'Reembolso'            |'Reembolso'|
    |'Autorização'          |'Autorização'|
    |'Outros assuntos'      |'Outros assuntos'|
    |'Voltar'               |'Voltar'|
    |'Abacaxi'              |'Else Menu inicial'|
    |'Sair'                 |'Encerramento'|

    @inicio_whats4
    Esquema do Cenario: Acessar o bot whats saude itau com massa valida com mais de um plano e selecionar um plano
    Dado que iniciei atendimento no bot whats seguindo ate o fluxo "Nome social" informando "massa_dois_planos_whats"
    Quando direcionado ao fluxo whats "Mais de um plano"
    E escolho a opcao <opcao> no menu "Unico plano"
    Entao valido que fui direcionado ao fluxo whats <fluxo>
    Exemplos:
    |opcao                  |fluxo         |
    |'Carteirinha'          |'Carteirinha'|
    |'Reembolso'            |'Reembolso'|
    |'Autorização'          |'Autorização'|
    |'Outros assuntos'      |'Outros assuntos'|
    |'Voltar'               |'Voltar'|
    |'Abacaxi'              |'Else Menu inicial'|
    |'Sair'                 |'Encerramento'|

    @inicio_whats5
    Esquema do Cenario: Acessar o bot whats saude itau com massa valida com mais de um plano e não selecionar um plano
    Dado que iniciei atendimento no bot whats seguindo ate o fluxo "Nome social" informando "massa_dois_planos_whats"
    #Quando direcionado ao fluxo whats "Mais de um plano"
    E escolho a opcao <opcao> no menu "Mais de um plano"
    Entao valido que fui direcionado ao fluxo whats <fluxo>
    Exemplos:
    |opcao                  |fluxo         |
    |'Outro plano'          |'Outro plano'|
    |'Voltar'               |'Voltar'|
    |'Abacaxi'              |'Else Menu inicial'|
    |'Sair'                 |'Encerramento'|

                                                    ####### Nome Social ########

    @inicio_whats_nomesocial1
    Esquema do Cenario: Acessar o bot whats saude itau com nome social com um unico plano
    Dado que iniciei atendimento no bot whats seguindo ate o fluxo "Nome social" informando "massa_nomesocial"
    Quando escolho a opcao <opcao> no menu "Unico plano"
    Entao valido que fui direcionado ao fluxo whats <fluxo>
    Exemplos:
    |opcao                  |fluxo         |
    |'Carteirinha'          |'Carteirinha'|
    |'Reembolso'            |'Reembolso'|
    |'Autorização'          |'Autorização'|
    |'Outros assuntos'      |'Outros assuntos'|
    |'Voltar'               |'Voltar'|
    |'Abacaxi'              |'Else Menu inicial'|
    |'Sair'                 |'Encerramento'|

    @inicio_whats_nomesocial2
    Esquema do Cenario: Acessar o bot whats saude itau com nome social com mais de um plano e selecionar um plano
    Dado que iniciei atendimento no bot whats seguindo ate o fluxo "Nome social" informando "massa_nomesocial"
    Quando direcionado ao fluxo whats "Mais de um plano"
    E escolho a opcao <opcao> no menu "Unico plano"
    Entao valido que fui direcionado ao fluxo whats <fluxo>
    Exemplos:
    |opcao                  |fluxo         |
    |'Carteirinha'          |'Carteirinha'|
    |'Reembolso'            |'Reembolso'|
    |'Autorização'          |'Autorização'|
    |'Outros assuntos'      |'Outros assuntos'|
    |'Voltar'               |'Voltar'|
    |'Abacaxi'              |'Else Menu inicial'|
    |'Sair'                 |'Encerramento'|

    @inicio_whats_nomesocial3
    Esquema do Cenario: Acessar o bot whats saude itau com nome social com mais de um plano e não selecionar um plano
    Dado que iniciei atendimento no bot whats seguindo ate o fluxo "Nome social" informando "massa_nomesocial"
    Quando direcionado ao fluxo whats "Mais de um plano"
    E escolho a opcao <opcao> no menu "Mais de um plano"
    Entao valido que fui direcionado ao fluxo whats <fluxo>
    Exemplos:
    |opcao                  |fluxo         |
    |'Outro plano'          |'Outro plano'|
    |'Voltar'               |'Voltar'|
    |'Abacaxi'              |'Else Menu inicial'|
    |'Sair'                 |'Encerramento'|




    

      

