# language: pt
# encode: UTF-8

@token_whats
Funcionalidade: Testar o fluxo de token do bot saude itau


@token_whats1
 Esquema do Cenario: Usuario que possui dados cadastrados vindo do menu inicial com numero e email cadastrado mas com menos de sete dados cadastrados para opcao voltar e else
 Dado que iniciei atendimento no bot whats seguindo ate o fluxo "Nome social" informando "massa_valida"
 E escolho a opcao <opcao> no menu "Menos que sete numeros"
 Entao valido que fui direcionado ao fluxo whats <fluxo>
 Exemplos:
 |opcao                     |fluxo         |
 |'Não reconheço os dados'  |'Não reconheço os dados'|
 |'Voltar'                  |'Voltar'|
 |'Else token'              |'Else'|


@token_whats2
 Cenario: Usuario que possui dados cadastrados vindo do menu inicial com numero e email cadastrado mas com menos de sete dados cadastrados
 Dado que iniciei atendimento no bot whats seguindo ate o fluxo "Nome social" informando "massa_valida"
 Entao valido que fui direcionado ao fluxo whats "Menos que sete numeros"

@token_whats3
Esquema do Cenario: Usuario que possui dados cadastrados vindo do menu inicial mais de sete dados cadastrados opcao voltar e else
Dado que iniciei atendimento no bot whats seguindo ate o fluxo "Nome social" informando "massa_valida"
E escolho a opcao <opcao> no menu "Mais que sete numeros"
Entao valido que fui direcionado ao fluxo whats <fluxo>
 Exemplos:
 |opcao                     |fluxo         |
 |'Mais Opções'             |'Mais opções'|
 |'Não reconheço os dados'  |'Não reconheço os dados'|
 |'Voltar'                  |'Voltar'|
 |'Else token'              |'Else'|

@token_whats4
 Cenario: Usuario que possui dados cadastrados vindo do menu inicial mais de sete dados cadastrados 
 Dado que iniciei atendimento no bot whats seguindo ate o fluxo "Nome social" informando "massa_valida"
 Entao valido que fui direcionado ao fluxo whats "Mais que sete numeros"

 @token_whats5
 Cenario: Usuario que possui dados cadastrados vindo do menu inicial mais de sete dados cadastrados mais opções ate acabar a paginação
 Dado que iniciei atendimento no bot whats seguindo ate o fluxo "Nome social" informando "massa_valida"
 Quando valido um trecho whats "Mais que sete numeros"
 E digito a opção "Mais Opções" "Mais Opções" seguidamente depois digito "Não reconheço os dados"
 Entao valido que fui direcionado ao fluxo whats "Não reconheço os dados"
 

 #############################################################################################################################################################################################

@token_whats6
 Cenario: Usuario que possui dados cadastrados vindo da opção carterinha com apenas email cadastrado menos de sete emails
 Dado que iniciei atendimento no bot whats seguindo ate o fluxo "Carteirinha" informando "massa_carteirinha"
 E valido que fui direcionado ao fluxo whats "Menos que sete emails"


@token_whats7
 Esquema do Cenario: Usuario que possui dados cadastrados vindo da opção carterinha com apenas email cadastrado mais de sete emails voltar e else
 Dado que iniciei atendimento no bot whats seguindo ate o fluxo "Carteirinha" informando "massa_carteirinha"
 E valido que fui direcionado ao fluxo whats "Mais de sete emails"
 Entao valido que fui direcionado ao fluxo whats <fluxo>
 Exemplos:
 |opcao                     |fluxo         |
 |'Mais opções'             |'Mais opções'|
 |'Não reconheço os dados'  |'Não reconheço os dados'|
 |'Voltar'                  |'Voltar'|
 |'Else token'              |'Else'|

 @token_whats8
 Cenario: Usuario que possui dados cadastrados vindo da opção carterinha com apenas email cadastrado mais de sete emails
 Dado que iniciei atendimento no bot whats seguindo ate o fluxo "Carteirinha" informando "massa_carteirinha"
 Então valido que fui direcionado ao fluxo whats "Mais de sete emails"

@token_whats9
Esquema do Cenario: Usuario que possui dados cadastrados vindo da opção carterinha com menos de sete email e telefone cadastrado voltar e else
Dado que iniciei atendimento no bot whats seguindo ate o fluxo "Carteirinha" informando "massa_carteirinha"
E valido que fui direcionado ao fluxo whats "Menos que sete email e telefone"
Entao valido que fui direcionado ao fluxo whats <fluxo>
Exemplos:
 |opcao                  |fluxo         |
 |'Não reconheço os dados'  |'Não reconheço os dados'|
 |'Voltar'                  |'Voltar'|
 |'Else token'              |'Else'|

@token_whats10
Cenario: Usuario que possui dados cadastrados vindo da opção carterinha com menos de sete emails e telefones cadastrados
Dado que iniciei atendimento no bot whats seguindo ate o fluxo "Carteirinha" informando "massa_carteirinha"
Entao valido que fui direcionado ao fluxo whats "Menos que sete email e telefone"

@token_whats11
Esquema do Cenario: Usuario que possui dados cadastrados vindo da opção carterinha com mais de sete email e telefone cadastrado voltar e else
Dado que iniciei atendimento no bot whats seguindo ate o fluxo "Carteirinha" informando "massa_carteirinha"
E valido que fui direcionado ao fluxo whats "Mais que sete emails e telefone"
Entao valido que fui direcionado ao fluxo whats <fluxo>
Exemplos:
 |opcao                  |fluxo         |
 |'Mais opções'             |'Mais opções'|
 |'Não reconheço os dados'  |'Não reconheço os dados'|
 |'Voltar'                  |'Voltar'|
 |'Else token'              |'Else'|

@token_whats10
Cenario: Usuario que possui dados cadastrados vindo da opção carterinha com menos de sete emails e telefones cadastrados
Dado que iniciei atendimento no bot whats seguindo ate o fluxo "Carteirinha" informando "massa_carteirinha"
Entao valido que fui direcionado ao fluxo whats "Mais que sete emails e telefone"