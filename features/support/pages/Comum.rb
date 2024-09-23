class Comum
  include Capybara::DSL

  def texto_existe(texto)
    assert_selector(EL['txt_whats'], visible: true, text: texto)
    # if  == true
    #   #p "O texto '#{texto}' é compatível com o que esta sendo apresentado no bot"
    # else
    #   raise "O texto '#{texto}' não é compativel com o que esta sendo apresentado no bot"
    # end
  end

  def texto_existe_exato(texto)
    if assert_selector(EL['txt_whats'], visible: true, text: texto, exact_text: true) == true
      #p "O texto '#{texto}' é compatível com o que esta sendo apresentado no bot"
    else
      raise "O texto '#{texto}' não é compativel com o que esta sendo apresentado no bot"
    end
    #Compara o que tem dentro do elemento com o que tem dentro da nossa string que colocamos no step e verifica se é EXATAMENTE igual, se não for ira dar erro
  end    
  
  # Verifica se a caixa de texto está sendo apresentada e preenche
  def preenche_campo(texto)
    assert_selector(EL['box_text'], visible: true) 
    all(EL['box_text'])[0].set(texto)
  end

  def screenshot(nome)
    sleep(1)
    nome.gsub! "/", "_"
    save_screenshot("data/reports/screenshot/evidências/#{nome}}.png")
    # Realiza a captura de tela, salvando-a com o texto armazenado na variável 'nome'. Crie a pasta no caminho determinado antes de rodar.
  end

  def contem_texto(texto)
    sleep(5)
    qtd = (all(EL['txt_whats']).length)
    qtd = qtd - index
    text = all(EL['txt_whats'])[qtd].text
    if text.include?("\n\n")
      text = text.gsub("\n\n", " ")
    elsif text.include?("\n")
      text = text.gsub("\n", " ")
    end
    if text.include?(texto)
    else
      raise "texto nao esta sendo apresentado"
    end
  end

   # Gera massa de teste fake no formato solicitado
   def gera_info
    nome =  Faker::Name.name
    nome = nome.tr('ÂÁÉÍÓÚàáäâãèéëẽêìíïîĩòóöôõùúüûũñç', 'AAEIOUaaaaaeeeeeiiiiiooooouuuuunc')
    nome.gsub! '.','abcd'
    cpf = Faker::IDNumber.brazilian_citizen_number(formatted: true)
    email = Faker::Internet.email
    Faker::Config.locale = 'pt-BR'
    celular = Faker::PhoneNumber.cell_phone
    # cep = Faker::Address.zip_code(state_abbreviation = 'Br')
    cep = '01301-000'
    return nome, email, cpf, celular, cep
  end

  def foco_browser                # Alterna janela do navegador                 
    result = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.window(result)
  end

  #método que retorna dado fake gerado para caso válido e retorna dados invalidos se for o caso
  def valida_doc (dado)
    if dado == "valido" || dado == "correto"
      cpf = Comum.new.gera_info
      return cpf[2]
    elsif dado == "invalido" || dado == "incorreto"
      return '00000000000'
    elsif dado == "já_existente"
      return '' #dado já existente massa.yml
    end
  end

   #verifica se o texto apresentado está exatamente como informado no parâmetro e em negrito
  def texto_negrito_exato(texto)
    if has_selector?('b', visible: true, exact_text: texto) == true
    else
      raise "O texto '#{texto}' não está em negrito ou não é compatível."
    end
  end

  #verifica se o texto apresentado de acordo com índice (ultimo penultimo, antepenultimo) na conversa está de acordo com o texto do parametro
  def contem_texto_mgm(texto, index)
    sleep(5)
    qtd = (all(EL['txt_whats']).length)
    qtd = qtd - index
    text = all(EL['txt_whats'])[qtd].text
      if text.include?(texto)
      else
        raise "texto nao esta sendo apresentado"
      end
  end

  

 ############################# WEB ################################

  def opcao_existe(opcao)
    assert_selector(EL['label_option'], visible: true)
    qnt_opcoes = all(EL['label_option']).length
    cont = 0
    while cont < qnt_opcoes
      text = all(EL['label_option'], visible: true)[cont].text
      if text.include?(opcao)
        contem_texto = true
        break
      else
        cont +=1
      end
    end
    if contem_texto == true
    else
      raise "A opcao '#{opcao}' não está sendo apresentada"
    end
  end

  def opcao_existe_web(opcao)
    assert_selector(EL['list-option'], visible: true)
    qnt_opcoes = all(EL['list-option']).length
    cont = 0
    while cont < qnt_opcoes
      text = all(EL['list-option'], visible: true)[cont].text
      if text.include?(opcao)
        contem_texto = true
        break
      else
        cont +=1
      end
    end
    if contem_texto == true
    else
      raise "A opcao '#{opcao}' não está sendo apresentada"
    end
  end


  def titulo_existe(texto)
    if assert_selector(EL['title_text'], visible: true, text: texto) == true
      #p "O titulo '#{texto}' é compatível com o que esta sendo apresentado no bot"
    else
      raise "O título '#{texto}' não é compativel com o que esta sendo apresentado no bot"
    end
  end

  def titulo_existe_popup(texto)
    if assert_selector(EL['title_popup'], visible: true, text: texto) == true
      #p "O titulo '#{texto}' é compatível com o que esta sendo apresentado no bot"
    else
      raise "O título '#{texto}' não é compativel com o que esta sendo apresentado no bot"
    end
  end


  def titulo_existe_exato(texto)
    if assert_selector(EL['title_text'], visible: true, text: texto, exact_text: true) == true
      p "O titulo '#{texto}' é compatível com o que esta sendo apresentado no bot"
      #aqui você pode colocar uma mensagem que te irá aparecer quando sua string for igual a frase que esta dentro do elemento
    else
      raise "O título '#{texto}' não é compativel com o que esta sendo apresentado no bot"
    end
    #Compara o que tem dentro do elemento com o que tem dentro da nossa string que colocamos no step e verifica se é EXATAMENTE igual, se não for ira dar erro
  end
  #Verifica se o botao pesquisa usado em lista de opções inline esta sendo apresentado no bot e seleciona
  
  def selecionar_opcao(opcao)          
    opcao_existe(opcao)
    find(EL['label_option'], text: opcao).click
  end

  def selecionar_opcao_web(opcao)          
    opcao_existe_web(opcao)
    find(EL['list-option'], text: opcao, exact_text: true).click
  end

  def selecionar_opcao_exato(opcao)
    opcao_existe(opcao)
    find(EL['label_option'], text: opcao, exact_text: true).click
  end

  def clica_enviar
    all(EL['btn_enviar'])[0].click
  end

  def clica_confirmar_popuo
    all(EL['btn_popup'])[0].click
  end

  #Verifica se o botao pesquisa usado em Quick Replies esta sendo apresentado no bot e seleciona.
  def selecionar_quick_reply(opcao)         
    assert_selector(EL['btn_quick_reply'], visible: true, text: opcao) 
    find(EL['btn_quick_reply'], text: opcao).click
  end

  def selecionar_reply(opcao)         
    assert_selector(EL['btn_reply'], visible: true, text: opcao) 
    find(EL['btn_reply'], text: opcao).click
  end

  def primeira_opcao
    all(EL['label_option'])[0].click # Seleciona a primeira opcao apresentada
  end

  #Método que realiza o preenchimento automático da data presente em variavel no massa.yml no item calendário do bot web
  def pergunta_data(opcao)
    data_ano = MASSA[opcao]['nasc'].split('/')[2]
    data_mes = MASSA[opcao]['nasc'].split('/')[1]
    data_dia = MASSA[opcao]['nasc'].split('/')[0]

    find(EL['mes_atual']).click
    find(EL['ano_atual']).click

    ano_atual = (Time.now).strftime("%Y")
    
    if data_ano > ano_atual
        if "2078" > data_ano and data_ano > "2067"
            m=5
        elsif "2068" > data_ano and data_ano > "2057"
            m=4
        elsif "2058" > data_ano and data_ano > "2047"
            m=3
        elsif "2048" > data_ano and data_ano > "2037"
            m=2
        elsif "2038" > data_ano and data_ano > "2027"
            m=1
        end
        for k in 1..m do
            find(EL['btn_ano_prox']).click
        end
        
        find(EL['item_ano'], visible:true, text: data_ano).click
    
    elsif data_ano == ano_atual
        all(EL["item_ano_picked"], visible: true, text: data_ano)[0].click

    else
        if "1946" > data_ano and data_ano > "1935"
            i=8
        elsif "1956" > data_ano and data_ano > "1945"
            i=7
        elsif "1966" > data_ano and data_ano > "1955"
            i=6
        elsif "1976" > data_ano and data_ano > "1965"
            i=5
        elsif "1986" > data_ano and data_ano > "1975"
            i=4
        elsif "1996" > data_ano and data_ano > "1985"
            i=3
        elsif "2006" > data_ano and data_ano > "1995"
            i=2
        elsif "2016" > data_ano and data_ano > "2005"
            i=1
        end

        for j in 1..i do
            find(EL['btn_ano_anter']).click
        end
        find(EL['item_ano'], visible:true, text: data_ano).click
    end
    
    
    if data_mes == "01"
        data_mes = "Jan"
    elsif data_mes == "02"
        data_mes = "Fev"
    elsif data_mes == "03"
        data_mes = "Mar"
    elsif data_mes == "04"
        data_mes = "Abr"
    elsif data_mes == "05"
        data_mes = "Mai"
    elsif data_mes == "06"
        data_mes = "Jun"
    elsif data_mes == "07"
        data_mes = "Jul"
    elsif data_mes == "08"
        data_mes = "Ago"
    elsif data_mes == "09"
        data_mes = "Set"
    elsif data_mes == "10"
        data_mes = "Out"
    elsif data_mes == "11"
        data_mes = "Nov"
    elsif data_mes == "12"
        data_mes = "Dez"
    end
    find(EL['item_mes'], visible:true, text: data_mes).click
    if data_dia < "10"
      if data_dia == "01"
        data_dia = "1"
      elsif data_dia == "02"
        data_dia = "2"
      elsif data_dia == "03"
        data_dia = "3"
      elsif data_dia == "04"
        data_dia = "4"
      elsif data_dia == "05"
        data_dia = "5"
      elsif data_dia == "06"
        data_dia = "6"
      elsif data_dia == "07"
        data_dia = "7"
      elsif data_dia == "08"
        data_dia = "8"
      elsif data_dia == "09"
        data_dia = "9"
      end
    end
    all(EL['item_dia'], visible:true, text: data_dia)[0].click
end

#método que seleciona a opção em uma estrutura carrossel web
def opcao_existe_carrossel(opcao)
  assert_selector(EL['label_option_carrossel'], visible: true)
  qnt_opcoes = all(EL['label_option_carrossel']).length
  cont = 0
  while cont < qnt_opcoes
    text = all(EL['label_option_carrossel'], visible: true)[cont].text
    if text.include?(opcao)
      contem_texto = true
      break
    else
      cont +=1
    end
  end
  if contem_texto == true
  else
    raise "A opcao '#{opcao}' não está sendo apresentada"
  end
end

def selecionar_opcao_carrossel(opcao)
  opcao_existe_carrossel(opcao)
  if (all(EL["button_option"])[0].text || all(EL["button_option"])[1].text || all(EL["button_option"])[2].text) == opcao 
    find(EL["button_option"], text: opcao).click
  else
    for i in 0..2
      find(EL["btn_dir"]).click
      sleep (1)
    end
    if (all(EL["button_option"])[3].text || all(EL["button_option"])[4].text || all(EL["button_option"])[5].text) == opcao
      find(EL["button_option"], text: opcao).click
    else
      for i in 0..2
        find(EL["btn_dir"]).click
        sleep (1)
      end
      find(EL["button_option"], text: opcao).click
    end
  end
end

def titulo_existe_carrossel(texto)
  if assert_selector(EL['title_carrossel'], visible: true, text: texto) == true
    #p "O titulo '#{texto}' é compatível com o que esta sendo apresentado no bot"
  else
    raise "O título '#{texto}' não é compativel com o que esta sendo apresentado no bot"
  end
end

###################### WHATSAPP WEB ###################################
def apagar_conversa
  all(EL['btn_menu'])[0].click
  sleep (2)
  all(EL['apagar_chat'])[0].click
  sleep (2)
  all(EL['apagar_chat_confirma'])[0].click
  sleep (2)
end

def emoji_existe(emoji)
  assert_selector("img[alt='#{emoji}']", visible: true)
end

def texto_existe_whats(texto)
  assert_selector(EL["conversa_whats"], visible: true, text: texto)
end

def contem_texto_whats(texto)
  sleep(10)
  qtd = ((all(EL["conversa_whats"]).length) - 1)
  text = all(EL["conversa_whats"])[qtd].text
  if text.include?(texto)
  else
    raise "texto nao esta sendo apresendado"
  end
end

def texto_negrito_exato_whats(texto)
  if has_selector?('strong', visible: true, exact_text: texto) == true
  else
    raise "O texto '#{texto}' não está em negrito ou não é compatível."
  end
end

def preenche_campo_whats(texto)
  assert_selector(EL['box_text_whats'], visible: true)
  all(EL['box_text_whats'])[0].set(texto)
  all(EL['btn_enviar_whats'])[0].click
end

def titulo_existe_opcoes_whats(texto)
  assert_selector(EL["titulo_lista"], visible: true, text: texto)
end

def texto_existe_botao_opcoes_whats(texto)
  assert_selector(EL["texto_botao_lista"], visible: true, text: texto)
end

def seleciona_opcao_whats(opcao, descricao)
  all(EL['btn_opcoes'])[-1].click
  opcao_whats_existe(opcao, descricao)
  find(EL["opcoes_lista"], text: opcao).click
  sleep (1)
  all(EL['btn_envia_opcao'])[0].click
end

def opcao_whats_existe(opcao, descricao)
  assert_selector(EL["opcoes_lista"], visible: true)
  qnt_opcoes = all(EL["opcoes_lista"]).length
  cont = 0
  while cont < qnt_opcoes
    text = all(EL["opcoes_lista"], visible: true)[cont].text
    if text.include?("\n")
      text = text.split("\n")
      if text[0] == opcao && text[1] == descricao
        contem_texto = true
        break
      else
        cont += 1
      end
    elsif text == opcao
      contem_texto = true
      break
    else
      cont += 1
    end
  end
  if contem_texto == true
  else
    raise "O texto '#{opcao}' não está sendo apresentado"
  end
end

def seleciona_quick_reply(opcao)
  find(EL["btn_quick_reply"], exact_text: opcao).click
end

  
#############################ZNLU(whats)####################################

  def clica_buscar_arquivo
    all(EL['btn_search'])[0].click
  end

  def clica_upload_arquivo
    all(EL['btn_upload'])[0].click
  end

  def clica_fecha_upload
    all(EL['close_upload'])[0].click
  end

  def clica_enviar_whats
    all(EL["btn_enviar_znlu"])[0].click
  end

  def clica_enviar_arquivo_whats
    all(EL["btn_enviar_arquivo_znlu"])[0].click
  end

def envio_arquivo(dado)
  if dado == "válido"
    Comum.new.clica_enviar_arquivo_whats
    @arquivo = File.join(Dir.pwd, 'data/file/arquivo_a_enviar.jpg')
    attach_file('fileupload', @arquivo, make_visible:true)
    Comum.new.clica_upload_arquivo
    Comum.new.clica_fecha_upload
  elsif
    Comum.new.preenche_campo("teste123")
    Comum.new.clica_enviar_whats
  end 
end


 ################################ FILMAGEM EVIDENCIAS ################################
  def screen_recorder (cenario)
    advanced = {
    input:    {
        framerate:  30,
        video_size: '1920x1080' #Coloque a resolução recomendada para seu pc. Linux: Configurações -> Monitores -> Resolução. Windows:Na área de trabalho clique com o botão direito e escolha 'Configurações de exibição'. Em “Configurações”, escolhendo a opção “Tela”, localize o link para “Configurações de vídeo avançadas” e clique sobre ele. Agora, basta em ir “Resolução”.
    },
    output:   {
        r:       15, # Framerate
    },
    log:      'recorder.log',
    loglevel: 'level+debug', # For FFmpeg
    }
    ScreenRecorder::Desktop.new(output: "data/vídeos/#{cenario}.mp4", advanced: advanced)
  end

  # Método inserido no "Dado" após o login
  def iniciando_filmagem
    nome = ("#{$tag}"+"_"+"#{$numerodovideo}").gsub(/\s+/, "")
    nome = nome.gsub("_","_")
    nome = nome.gsub(")", "")
    @@recorder = screen_recorder(nome)
    @@recorder.start
  end
  # Método inserido no "Então"
  def encerrando_filmagem
    sleep(5)
    @@recorder.stop
  end

 ################################ LOGIN ################################

#Abre o navegador e acessa o whatsapp web diretamente na conversa do bot
def login_whats
  visit(DATA[$ambiente]["site_bot_whats"])
  preenche_campo_whats('olá')
  sleep (3)
end

 # Abre o navegador e acessa a URL que está em data.yml em 'site_bot' 
  def login_web
    visit(DATA[$ambiente]['site_bot'])
    sleep(2)
  end

 # Para acessar no modo whatsapp pelo ZNLU. Primeiro é inserido o link do builder e depois do debugger presente no Devtools do navegador

 def acessando_znlu(login)
  assert_selector(EL["login_znlu"], visible: true)
  all(EL["login_znlu"])[0].set(login)
  #acima estamos preenchendo o campo e-mail de Login do ZNLU com nosso e-mail que deve ser colocado no arquivo credenciais.yml
  all(EL["btn_logar_znlu"])[0].click #botão que clica para entrar com o email
  sleep(5)
end

#método de automação do preenchimento dos campos para login via okta
def login_okta(login, senha)
  assert_selector(EL["login_okta"], visible: true)
  all(EL["login_okta"])[0].set(login)
  puts(login)
  assert_selector(EL["senha_okta"], visible: true)
  all(EL["senha_okta"])[0].set(senha)
  all(EL["btn_logar_okta"])[0].click 
  sleep (5)
  all(EL["btn_push"])[0].click
  sleep(10)
end

def login_znlu
  visit(DATA[$ambiente]['site_bot_znlu'])
  if page.current_url != DATA[$ambiente]['site_bot_znlu'] #verificação se já foi realizado o login anteriormente
    all(EL["btn_login"])[0].click
    sleep(4)
    acessando_znlu(CRED["login"])
    login_okta(CRED["login"], CRED["senha"])
    visit(DATA[$ambiente]['site_bot_znlu'])
  end
  visit(DATA[$ambiente]['site_bot_znlu'])
  page.driver.open_new_window
  foco_browser
  sleep(4)
  visit(DATA[$ambiente]['site_bot_simulador'])
  sleep(2)
  preenche_campo('@atd_prod')
  clica_enviar_whats
  texto_existe("Este é um teste para coleta de evidências.")
  texto_existe("Ambiente API Zenvia: dev")
  texto_existe("Ambiente API Porto:prod")

  
end




  # Para acessar o Messenger, não pertence ao ALTU
  def login_facebook
    visit(DATA[$ambiente]['site_bot_facebook'])
    assert_selector(EL['login_facebook'], visible: true)
    all(EL['login_facebook'])[0].set(CRED['login'])
    #acima estamos preenchendo o campo e-mail. O e-mail que deve ser colocado no arquivo credenciais.yml
    assert_selector(EL['senha_facebook'], visible: true)
    all(EL['senha_facebook'])[0].set(CRED['senha'])
    #acima estamos preenchendo o campo senha. A senha que deve ser colocado no arquivo credenciais.yml
    all(EL['botao_entrar_facebook'])[0].click #botão que clica para entrar com o login
  end

  
end
