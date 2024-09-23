# language: pt
# encode: UTF-8

@carteirinha_web
Funcionalidade: Testar o fluxo de carteirinha

@carteirinha_web1
Esquema do Cenario: Acessar o bot saude itau e seguir com o fluxo de carteirinha plano titular sem dependentes
    Dado que iniciei atendimento no bot web seguindo ate o fluxo "Nome social" informando "massa_valida_web"
    Quando escolho a opcao "Carteirinha" no menu web "Unico plano"
    Entao valido que fui direcionado ao fluxo web <fluxo>
    Exemplos:
    |opcao                          |fluxo         |
    |'mostrar carteirinha'          |'mostrar carteirinha'|
    |'pedir segunda via'            |'pedir segunda via'|
    |'Não'                          |'Não'|
    |'Voltar'                       |'Voltar'|

@carteirinha_web2
Esquema do Cenario: Acessar o bot saude itau e seguir com o fluxo de carteirinha plano titular com até oito dependentes
    Dado que iniciei atendimento no bot web seguindo ate o fluxo "Nome social" informando "massa_valida_web"
    Quando escolho a opcao "Carteirinha" no menu web "Unico plano"
    E escolho a opcao "mostrar carteirinha"
    E visualizo uma mensagem "Localizei aqui este(s) dependente(s) do seu plano." "Você quer consultar a carteirinha de quem?"
    Entao valido que fui direcionado ao fluxo web <fluxo>
    Exemplos:
    |opcao                          |fluxo         |
    |'Minha carteirinha'            |'mostrar carteirinha'|
    |'??'                           |'??'|
    |'Outro dependente'             |'Outro dependente'|
    |'Voltar'                       |'Voltar'|
    

@carteirinha_web3
Esquema do Cenario: Acessar o bot saude itau e seguir com o fluxo de carteirinha plano titular com mais de nove dependentes
    Dado que iniciei atendimento no bot web seguindo ate o fluxo "Nome social" informando "massa_valida_web"
    Quando escolho a opcao "Carteirinha" no menu web "Unico plano"
    E escolho a opcao "mostrar carteirinha"
    E visualizo uma mensagem "Localizei aqui este(s) dependente(s) do seu plano. Para falar sobre um segurado que não está nas opções, entre em contato com o RH ou representante da sua empresa." "Você quer consultar a carteirinha de quem?"
    Entao valido que fui direcionado ao fluxo web <fluxo>
    Exemplos:
    |opcao                          |fluxo         |
    |'Minha carteirinha'            |'mostrar carteirinha'|
    |'??'                           |'??'|
    |'Mais opções'                  |'Mais opções'|
    |'Voltar'                       |'Voltar'|
    
