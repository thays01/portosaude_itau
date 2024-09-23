class Metodos
    include Capybara::DSL

    def clica_buscar_file_altu
        all(EL['btn_file'])[0].click
    end
    
    def clica_enviar_file_altu
        all(EL['btn_upload'])[0].click
    end
    
    def clica_upload_file_altu
        all(EL['close-upload.upload-btn'])[0].click
    end    

    def texto_negrito_exato(texto)
        if has_selector?('b', visible: true, exact_text: texto) == true
        else
          raise "O texto '#{texto}' não está em negrito ou não é compatível."
        end
  end 

  def retorna_id_atendimento #retorna id atendimento informado no chat (combinar com DEV)
    id=all(EL['txt_whats'], text: "91")[-1].text #identifica no chat o id_atendimento
    return id #retorna número ID de atendimento (7 dígitos - número de digitos varia para cada assistente )
  end
  
     def texto_random
         assert_selector(EL['txt_whats'], visible:true)
         qnt_texto = 0
         if has_selector?(EL['txt_whats'], visible:true, wait: 30) == true
           qnt_texto = all(EL['txt_whats']).length
           texto_capturado = all(EL['txt_whats'])[qnt_texto -1].text
    
           text1 = 'Antes de encerrar este atendimento, a Porto gostaria de pedir sua ajuda para melhorar nosso atendimento. Pode nos explicar, em poucas palavras, que assunto você procurou e não encontrou?'
           text2 = 'Antes de transferir esta conversa para um especialista, por favor, precisamos de algumas informações. Pode nos explicar, em poucas palavras, que assunto você procurou e não encontrou?'
           text3 = 'Transbordo deu certo!'
           text4 = 'Posso te ajudar em algo mais?'


           if texto_capturado.include?(text1)
               sleep(3)
                puts "texto 1 foi apresentado"
           elsif texto_capturado.include?(text2)
               sleep(3)
               puts "texto 2 foi apresentado"
            elsif texto_capturado.include?(text3)
                sleep(3)
                puts "texto 3 foi apresentado"
            elsif texto_capturado.include?(text4)
                sleep(3)
                puts "texto 4 foi apresentado"       
            
           else 
            raise "texto nao esta sendo apresentado"
           end
         end
     end

end





