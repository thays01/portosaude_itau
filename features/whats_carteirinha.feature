# language: pt
# encode: UTF-8

@carteirinha_whats
Funcionalidade: Testar o fluxo de carteirinha

@carteirinha_whats1
Esquema do Cenario: Acessar o bot saude itau e seguir com o fluxo de carteirinha plano titular sem dependentes
    Dado que iniciei atendimento no bot whats seguindo ate o fluxo "Nome social" informando "massa_valida_whats"
    Quando escolho a opcao "Carteirinha" no menu whats "Unico plano"
    Entao valido que fui direcionado ao fluxo whats <fluxo>
    Exemplos:
    |opcao                          |fluxo         |
    |'mostrar carteirinha'          |'mostrar carteirinha'|
    |'pedir segunda via'            |'pedir segunda via'|
    |'Não'                          |'Não'|
    |'Voltar'                       |'Voltar'|
    |'Abacaxi'              |'Else Menu inicial'|
    |'Sair'                 |'Encerramento'|

@carteirinha_whats2
Esquema do Cenario: Acessar o bot saude itau e seguir com o fluxo de carteirinha plano titular com até oito dependentes
    Dado que iniciei atendimento no bot whats seguindo ate o fluxo "Nome social" informando "massa_valida_whats"
    Quando escolho a opcao "Carteirinha" no menu whats "Unico plano"
    E escolho a opcao "mostrar carteirinha"
    E visualizo uma mensagem "Localizei aqui este(s) dependente(s) do seu plano." "Você quer consultar a carteirinha de quem?"
    Entao valido que fui direcionado ao fluxo whats <fluxo>
    Exemplos:
    |opcao                          |fluxo         |
    |'Minha carteirinha'            |'mostrar carteirinha'|
    |'??'                           |'??'|
    |'Outro dependente'             |'Outro dependente'|
    |'Voltar'                       |'Voltar'|
    |'Abacaxi'              |'Else Menu inicial'|
    |'Sair'                 |'Encerramento'|
    

@carteirinha_whats3
Esquema do Cenario: Acessar o bot saude itau e seguir com o fluxo de carteirinha plano titular com mais de nove dependentes
    Dado que iniciei atendimento no bot whats seguindo ate o fluxo "Nome social" informando "massa_valida_whats"
    Quando escolho a opcao "Carteirinha" no menu whats "Unico plano"
    E escolho a opcao "mostrar carteirinha"
    E visualizo uma mensagem "Localizei aqui este(s) dependente(s) do seu plano. Para falar sobre um segurado que não está nas opções, entre em contato com o RH ou representante da sua empresa." "Você quer consultar a carteirinha de quem?"
    Entao valido que fui direcionado ao fluxo whats <fluxo>
    Exemplos:
    |opcao                          |fluxo         |
    |'Minha carteirinha'            |'mostrar carteirinha'|
    |'??'                           |'??'|
    |'Mais opções'                  |'Mais opções'|
    |'Voltar'                       |'Voltar'|
    |'Abacaxi'                      |'Else Menu inicial'|
    |'Sair'                         |'Encerramento'|
    
