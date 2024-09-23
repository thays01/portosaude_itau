# language: pt
# encode: UTF-8

@token_web
Funcionalidade: Testar o fluxo de token do bot saude itau


@token_web1
 Esquema do Cenario: Usuario que possui dados cadastrados vindo do menu inicial com numero e email cadastrado mas com menos de sete dados cadastrados para opcao voltar
 Dado que iniciei atendimento no bot web seguindo ate o fluxo "Nome social" informando "massa_valida_web"
 E escolho a opcao <opcao> no menu web "Menos que sete numeros"
 Entao valido que fui direcionado ao fluxo web <fluxo>
 Exemplos:
 |opcao                     |fluxo         |
 |'Não reconheço os dados'  |'Não reconheço os dados'|
 |'Voltar'                  |'Voltar'|
 
@token_web2
 Cenario: Usuario que possui dados cadastrados vindo da opção carterinha com apenas numero e com menos de sete numeros cadastrados 
 Dado que iniciei atendimento no bot web seguindo ate o fluxo "Nome social" informando "massa_valida_web"
 Entao valido que fui direcionado ao fluxo web "Menos que sete numeros"

@token_web3
Esquema do Cenario: Usuario que possui dados cadastrados vindo do menu inicial mais de sete dados cadastrados opcao voltar 
Dado que iniciei atendimento no bot web seguindo ate o fluxo "Nome social" informando "massa_valida_web"
Quando escolho a opcao <opcao> no menu web "Mais que sete numeros"
Entao valido que fui direcionado ao fluxo web <fluxo>
 Exemplos:
 |opcao                     |fluxo         |
 |'Não reconheço os dados'  |'Não reconheço os dados'|
 |'Voltar'                  |'Voltar'|
 
@token_web4
 Cenario: Usuario que possui dados cadastrados vindo do menu inicial mais de sete dados cadastrados
 Dado que iniciei atendimento no bot web seguindo ate o fluxo "Nome social" informando "massa_valida_web"
 Entao valido que fui direcionado ao fluxo web "Mais que sete numeros"

@token_web5
 Cenario: Usuario que possui dados cadastrados vindo do menu inicial mais de sete dados cadastrados mais opções ate acabar a paginação
 Dado que iniciei atendimento no bot web seguindo ate o fluxo "Nome social" informando "massa_valida_web"
 Quando valido um trecho web "Mais que sete numeros"
 E digito a opção "Mais Opções" "Mais Opções" seguidamente depois digito no canal web "Não reconheço os dados"
 Entao valido que fui direcionado ao fluxo web "Não reconheço os dados"


 #############################################################################################################################################################################################

@token_web6
 Cenario: Usuario que possui dados cadastrados vindo da opção carterinha com apenas email cadastrado menos de sete emails
 Dado que iniciei atendimento no bot web seguindo ate o fluxo "Carteirinha" informando "massa_carteirinha"
 E valido que fui direcionado ao fluxo web "Menos que sete emails"


@token_web7
 Esquema do Cenario: Usuario que possui dados cadastrados vindo da opção carterinha com apenas email cadastrado mais de sete emails voltar e else
 Dado que iniciei atendimento no bot web seguindo ate o fluxo "Carteirinha" informando "massa_carteirinha"
 E valido que fui direcionado ao fluxo web "Mais de sete emails"
 Entao valido que fui direcionado ao fluxo web <fluxo>
 Exemplos:
 |'Não reconheço o numero'  |'Não reconheço o numero'|
 |'Voltar'                  |'Voltar'|
 

 @token_web8
 Cenario: Usuario que possui dados cadastrados vindo da opção carterinha com apenas email cadastrado mais de sete emails
 Dado que iniciei atendimento no bot web seguindo ate o fluxo "Carteirinha" informando "massa_carteirinha"
 Então valido que fui direcionado ao fluxo web "Mais de sete emails"

@token_web9
Esquema do Cenario: Usuario que possui dados cadastrados vindo da opção carterinha com menos de sete email e telefone cadastrado voltar e else
Dado que iniciei atendimento no bot web seguindo ate o fluxo "Carteirinha" informando "massa_carteirinha"
E valido que fui direcionado ao fluxo web "Menos que sete email e telefone"
Entao valido que fui direcionado ao fluxo web <fluxo>
Exemplos:
 |'Não reconheço o numero'  |'Não reconheço o numero'|
 |'Voltar'                  |'Voltar'|
 

@token_web10
Cenario: Usuario que possui dados cadastrados vindo da opção carterinha com menos de sete emails e telefones cadastrados
Dado que iniciei atendimento no bot web seguindo ate o fluxo "Carteirinha" informando "massa_carteirinha"
Entao valido que fui direcionado ao fluxo web "Menos que sete email e telefone"

@token_web11
Esquema do Cenario: Usuario que possui dados cadastrados vindo da opção carterinha com mais de sete email e telefone cadastrado voltar e else
Dado que iniciei atendimento no bot web seguindo ate o fluxo "Carteirinha" informando "massa_carteirinha"
E valido que fui direcionado ao fluxo web "Mais que sete emails e telefone"
Entao valido que fui direcionado ao fluxo web <fluxo>
Exemplos:
 |'Não reconheço o numero'  |'Não reconheço o numero'|
 |'Voltar'                  |'Voltar'|
 

@token_web10
Cenario: Usuario que possui dados cadastrados vindo da opção carterinha com menos de sete emails e telefones cadastrados
Dado que iniciei atendimento no bot web seguindo ate o fluxo "Carteirinha" informando "massa_carteirinha"
Entao valido que fui direcionado ao fluxo web "Mais que sete emails e telefone"