Dado("que iniciei atendimento no bot web seguindo ate o fluxo {string} informando {string}") do |fluxo, dado|
  Comum.new.login_web
  Comum.new.iniciando_filmagem
  Fluxo.new.redirecionamento_fluxo(fluxo, dado)
end

Então("valido que fui direcionado ao fluxo web {string}") do |fluxo|
  Fluxo.new.validacao_fluxo(fluxo)
  sleep(3)
  Comum.new.encerrando_filmagem
end

Então("direcionado ao fluxo web {string}") do |fluxo|
  Fluxo.new.redirecionamento_fluxo(fluxo, '')
  sleep(3)
end

  Quando("visualizo a mensagem {string}") do |mensagem|
    Fluxo.new.validacao_fluxo(mensagem)
  end
  
  Quando("valido um trecho web {string}") do |mensagem|
    Fluxo.new.validacao_fluxo(mensagem)
  end

  E("digito a opcao {string}") do |opcao| 
    sleep(3)
    Comum.new.preenche_campo(opcao)
    Comum.new.clica_enviar_web
    sleep(3)
  end  

  Dado("insiro a opcao {string} na pergunta {string}") do |opcao, pergunta|
    Comum.new.preenche_campo(opcao)
    Comum.new.clica_enviar_web
  end  

  Dado('escolho a opcao {string} no menu web {string}') do |opcao, menu|
    sleep(3)
    Fluxo.new.validacao_fluxo(menu)
    Comum.new.selecionar_opcao_web(opcao)
    Comum.new.clica_confirmar_popuo
    sleep(5)
  end

  Então("digito a opção {string} {string} seguidamente depois digito no canal web {string}") do |opcao1, opcao2, opcao3| 
    Comum.new.selecionar_opcao_web(opcao1)
    Comum.new.clica_confirmar_popuo
    sleep(3)
    Comum.new.selecionar_opcao_web(opcao2)
    Comum.new.clica_confirmar_popuo
    sleep(3)
    Comum.new.selecionar_opcao_web(opcao3)
    Comum.new.clica_confirmar_popuo
    sleep(3)
  end  


  E("visualizo uma mensagem {string}") do |mensagem|
    Fluxo.new.validacao_fluxo(mensagem)
  end

Entao("valido o encaminhamento para o fluxo {string}") do |fluxo|
  Fluxo.new.validacao_fluxo(fluxo)
  Comum.new.encerrando_filmagem
end

Quando('visualizo a mensagem {string} seleciono a opcao {string}') do |mensagem, opcao|
  Fluxo.new.validacao_fluxo(mensagem)    
  Comum.new.preenche_campo(opcao)
  Comum.new.clica_enviar_web
end

Quando('visualizo a mensagem {string} seleciono a opcao {string} visualizo a mensagem {string} preencho o campo {string}') do |mensagem, opcao, mensagem1, campo|
  Fluxo.new.validacao_fluxo(mensagem)    
  Comum.new.preenche_campo(opcao)
  Comum.new.clica_enviar_web
  Comum.new.texto_existe(mensagem1)
  Comum.new.preenche_campo(campo)
  Comum.new.clica_enviar_web
end


Dado('visualizo a mensagem {string} o menu {string}') do |mensagem, menu|
  Fluxo.new.validacao_fluxo(mensagem)
  Fluxo.new.validacao_fluxo(menu)
end

Dado('visualizo a mensagem {string} a mensagem {string} o menu {string}') do |mensagem, mensagem1, menu|
  Fluxo.new.validacao_fluxo(mensagem)
  Fluxo.new.validacao_fluxo(mensagem1)
  Fluxo.new.validacao_fluxo(menu)
end

Dado('aguardo o tempo de {string}') do |tempo|
  sleep(tempo)
end

Dado('aguardo o tempo de {float}') do |float|
sleep(float)
end

  Entao("valido que fui encaminhado para o fluxo {string}") do |fluxo|
   Fluxo.new.validacao_fluxo(fluxo) 
   Comum.new.encerrando_filmagem
  end

#teste enviar arquivos

Quando('seleciono a opcao {string}') do |opcao|
  Fluxo.new.validacao_fluxo(opcao)
end  

Quando('o usuario envia um arquivo') do
   @arquivo = File.join(Dir.pwd, 'data/file/envio.txt')
   attach_file('fileupload', @arquivo, make_visible:true)
   Metodos.new.clica_enviar_file_altu
   sleep(3)
   Metodos.new.clica_upload_file_altu
end

Entao('valido que o arquivo foi enviado') do
  Comum.new.encerrando_filmagem
end

Dado("que acessei o bot sinistro auto ate o fluxo {string}") do |fluxo|
  Fluxo.new.validacao_fluxo(fluxo)
end

Quando("informo uma {string} visualizo a mensagem {string} informo uma {string}") do |string, string2, string3|
  
end

