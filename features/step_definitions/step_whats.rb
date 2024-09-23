Dado("que iniciei atendimento no bot whats seguindo ate o fluxo {string} informando {string}") do |fluxo, dado|
  Comum.new.login_znlu
  Comum.new.iniciando_filmagem
  @@dado = dado
  Fluxo_whats.new.redirecionamento_fluxo(fluxo, dado)
end

Então("valido que fui direcionado ao fluxo whats {string}") do |fluxo|
  if fluxo == "Else Menu inicial"
    Fluxo_whats.new.redirecionamento_fluxo(fluxo, '')
  else
    Fluxo_whats.new.validacao_fluxo(fluxo)
  end
  sleep(3)
  Comum.new.encerrando_filmagem
end

  Quando("visualizo a mensagem {string}") do |mensagem|
    Fluxo_whats.new.validacao_fluxo(mensagem)
  end
  
  Quando("direcionado ao fluxo whats {string}") do |fluxo|
    Fluxo_whats.new.redirecionamento_fluxo(fluxo, '')
  end

  Quando("valido um trecho whats {string}") do |mensagem|
    Fluxo_whats.new.validacao_fluxo(mensagem)
  end

  Então("digito a opcao {string}") do |opcao| 
    Comum.new.preenche_campo(opcao)
    Comum.new.clica_enviar_whats
    sleep(3)
  end  

  Então("digito a opção {string} {string} seguidamente depois digito {string}") do |opcao1, opcao2, opcao3| 
    Comum.new.preenche_campo(opcao1)
    Comum.new.clica_enviar_whats
    sleep(3)
    Comum.new.preenche_campo(opcao2)
    Comum.new.clica_enviar_whats
    sleep(3)
    Comum.new.preenche_campo(opcao3)
    Comum.new.clica_enviar_whats
    sleep(3)
  end  

  Dado("insiro a opcao {string} na pergunta {string}") do |opcao, pergunta|
    Comum.new.preenche_campo(opcao)
    Comum.new.clica_enviar_whats
  end  

  Dado('escolho a opcao {string} no menu {string}') do |opcao, menu|
    sleep(3)
    Fluxo_whats.new.validacao_fluxo(menu)
    Comum.new.preenche_campo(opcao)
    Comum.new.clica_enviar_whats
    sleep(5)
  end

  #Então("visualizo uma mensagem {string}") do |mensagem|
    #Fluxo_whats.new.validacao_fluxo(mensagem)
  #end

  Quando("visualizo uma mensagem {string}") do |mensagem|
    Comum.new.texto_existe(mensagem)
  end

Entao("valido o encaminhamento para o fluxo {string}") do |fluxo|
  Fluxo_whats.new.validacao_fluxo(fluxo)
  Comum.new.encerrando_filmagem
end

Quando('visualizo a mensagem {string} seleciono a opcao {string}') do |mensagem, opcao|
  Fluxo_whats.new.validacao_fluxo(mensagem)    
  Comum.new.preenche_campo(opcao)
  Comum.new.clica_enviar_whats
end

Quando('visualizo a mensagem {string} seleciono a opcao {string} visualizo a mensagem {string} preencho o campo {string}') do |mensagem, opcao, mensagem1, campo|
  Fluxo_whats.new.validacao_fluxo(mensagem)    
  Comum.new.preenche_campo(opcao)
  Comum.new.clica_enviar_whats
  Comum.new.texto_existe(mensagem1)
  Comum.new.preenche_campo(campo)
  Comum.new.clica_enviar_whats
end


Dado('visualizo a mensagem {string} o menu {string}') do |mensagem, menu|
  Fluxo_whats.new.validacao_fluxo(mensagem)
  Fluxo_whats.new.validacao_fluxo(menu)
end

Dado('visualizo a mensagem {string} a mensagem {string} o menu {string}') do |mensagem, mensagem1, menu|
  Fluxo_whats.new.validacao_fluxo(mensagem)
  Fluxo_whats.new.validacao_fluxo(mensagem1)
  Fluxo_whats.new.validacao_fluxo(menu)
end

Dado('aguardo o tempo de {string}') do |tempo|
  sleep(tempo)
end

Dado('aguardo o tempo de {float}') do |float|
sleep(float)
end

  Entao("valido que fui encaminhado para o fluxo {string}") do |fluxo|
   Fluxo_whats.new.validacao_fluxo(fluxo) 
   Comum.new.encerrando_filmagem
  end

#teste enviar arquivos

Quando('seleciono a opcao {string}') do |opcao|
  Fluxo_whats.new.validacao_fluxo(opcao)
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
  Fluxo_whats.new.validacao_fluxo(fluxo)
end

Quando("informo uma {string} visualizo a mensagem {string} informo uma {string}") do |string, string2, string3|
  
end

