require 'selenium-webdriver'
require 'report_builder'
require 'json'

Before do |scn|
  Capybara.current_session.driver.browser.manage.delete_all_cookies
  page.driver.quit
  Capybara.page.driver.browser.manage.window.maximize #comentar linha quando execução em tela cheia
end

ReportBuilder.configure do |config|
  config.json_path = 'data/reports/report.json'
  config.report_path = "data/reports/report-#{$report_time}"
  config.report_types = [:html]
  config.report_title = "Nome do Projeto - #{$report_title}"
  config.color = "blue"
end

After do |scn|
  sleep(3)
  if scn.failed?
    save_screenshot("data/screenshots/bugs/#{$tag}.png")   # Em caso de falha do cenário, é salvo automaticamente um screenshot da tela com o erro nessa pasta
    #Comum.new.encerrando_filmagem
    @idatendimento = Metodos.new.retorna_id_atendimento
    puts "Atendimento: 'https://portoassistencia.altu.com.br/contacts/details/#{@idatendimento}'"
    #Comum.new.apagar_conversa  #TESTE WHATSAPWEB
    page.driver.quit
  else
    @idatendimento = Metodos.new.retorna_id_atendimento
    puts "Atendimento: 'https://portoassistencia.altu.com.br/contacts/details/#{@idatendimento}'"
    #Comum.new.apagar_conversa    #TESTE WHATSAPWEB
    page.driver.quit
  end
end

at_exit do
  ReportBuilder.build_report
end

Before do |scn|
  $tag = scn.source_tag_names[1]
  if $numerodovideo.to_s == ''
    $numerodovideo = "1" 
  else 
    $numerodovideo = $numerodovideo.to_i
    $numerodovideo +=1
    $numerodovideo = $numerodovideo.to_s
  end
  #[1] refere-se a tag de cada cenario presente apos a primeira tag da feature, esta seria [0].
end



# if $numerodovideo.to_s == ''
  #   $numerodovideo = "1" 
  # else 
  #   $numerodovideo = $numerodovideo.to_i
  #   $numerodovideo +=1
  #   $numerodovideo = $numerodovideo.to_s
  # end
  # @recorder = Comum.new.screen_recorder("#{scn.name}")
  # @recorder.start

# AfterStep do |step|
#   data = "#{Time.now.strftime('%Y/%B/%d')}"
#   hora = "#{Time.now.strftime('%H-%M-%S')}"
#   save_screenshot("data/screenshots/evidencias/#{step}.png")
# end
