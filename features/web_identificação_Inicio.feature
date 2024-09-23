# language: pt
# encode: UTF-8

@inicio_web
Funcionalidade: Testar o fluxo de indentificação de inicio para o bot Saude Itau

    @inicio_web1
    Cenario: Acessar o bot saude itau com massa invalida
    Dado que iniciei atendimento no bot web seguindo ate o fluxo "Massa invalida" informando "massa_invalida"
    Entao valido que fui direcionado ao fluxo web "Massa invalida"

    @inicio_web2
    Cenario: Acessar o bot itau com cliente não identificado
    Dado que iniciei atendimento no bot web seguindo ate o fluxo "Cliente nao identificado" informando "massa_nao_identificado_web"
    Entao valido que fui direcionado ao fluxo web "Encerramento"

    @inicio_web3
    Esquema do Cenario: Acessar o bot saude itau com massa valida com um unico plano
    Dado que iniciei atendimento no bot web seguindo ate o fluxo "Nome social" informando "massa_valida_web"
    Quando escolho a opcao <opcao> no menu web "Unico plano"
    Entao valido que fui direcionado ao fluxo web <fluxo>
    Exemplos:
    |opcao                  |fluxo         |
    |'Carteirinha'          |'Carteirinha'|
    |'Reembolso'            |'Reembolso'|
    |'Autorização'          |'Autorização'|
    |'Outros assuntos'      |'Outros assuntos'|
    |'Voltar'               |'Voltar'|

    @inicio_web4
    Esquema do Cenario: Acessar o bot saude itau com massa valida com mais de um plano e selecionar um plano
    Dado que iniciei atendimento no bot web seguindo ate o fluxo "Nome social" informando "massa_dois_planos_web"
    Quando direcionado ao fluxo web "Mais de um plano"
    E escolho a opcao <opcao> no menu web "Unico plano"
    Entao valido que fui direcionado ao fluxo web <fluxo>
    Exemplos:
    |opcao                  |fluxo         |
    |'Carteirinha'          |'Carteirinha'|
    |'Reembolso'            |'Reembolso'|
    |'Autorização'          |'Autorização'|
    |'Outros assuntos'      |'Outros assuntos'|
    |'Voltar'               |'Voltar'|

    @inicio_web5
    Esquema do Cenario: Acessar o bot saude itau com massa valida com mais de um plano e não selecionar um plano
    Dado que iniciei atendimento no bot web seguindo ate o fluxo "Nome social" informando "massa_dois_planos_web"
    #Quando direcionado ao fluxo web "Mais de um plano"
    E escolho a opcao <opcao> no menu web "Mais de um plano"
    Entao valido que fui direcionado ao fluxo web <fluxo>
    Exemplos:
    |opcao                  |fluxo         |
    |'Outro plano'          |'Outro plano'|
    |'Voltar'               |'Voltar'|
    

                                     ####### Nome Social ########

    @inicio_web_nomesocial1
    Esquema do Cenario: Acessar o bot saude itau com nome social com um unico plano
    Dado que iniciei atendimento no bot web seguindo ate o fluxo "Nome social" informando "massa_nomesocial"
    Quando escolho a opcao <opcao> no menu web "Unico plano"
    Entao valido que fui direcionado ao fluxo web <fluxo>
    Exemplos:
    |opcao                  |fluxo         |
    |'Carteirinha'          |'Carteirinha'|
    |'Reembolso'            |'Reembolso'|
    |'Autorização'          |'Autorização'|
    |'Outros assuntos'      |'Outros assuntos'|
    |'Voltar'               |'Voltar'|
   

    @inicio_web_nomesocial2
    Esquema do Cenario: Acessar o bot saude itau com nome social com mais de um plano e selecionar um plano
    Dado que iniciei atendimento no bot web seguindo ate o fluxo "Nome social" informando "massa_nomesocial"
    Quando direcionado ao fluxo web "Mais de um plano"
    E escolho a opcao <opcao> no menu web "Unico plano"
    Entao valido que fui direcionado ao fluxo web <fluxo>
    Exemplos:
    |opcao                  |fluxo         |
    |'Carteirinha'          |'Carteirinha'|
    |'Reembolso'            |'Reembolso'|
    |'Autorização'          |'Autorização'|
    |'Outros assuntos'      |'Outros assuntos'|
    |'Voltar'               |'Voltar'|
    

    @inicio_web_nomesocial3
    Esquema do Cenario: Acessar o bot saude itau com nome social com mais de um plano e não selecionar um plano
    Dado que iniciei atendimento no bot web seguindo ate o fluxo "Nome social" informando "massa_nomesocial"
    Quando direcionado ao fluxo web "Mais de um plano"
    E escolho a opcao <opcao> no menu web "Mais de um plano"
    Entao valido que fui direcionado ao fluxo web <fluxo>
    Exemplos:
    |opcao                  |fluxo         |
    |'Outro plano'          |'Outro plano'|
    |'Voltar'               |'Voltar'|
   
