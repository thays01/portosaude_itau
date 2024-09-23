class Fluxo_whats
    include Capybara::DSL
  
    def validacao_fluxo(valida_fluxo)
        case valida_fluxo
       
        when 'Inicio'
            Comum.new.texto_existe('Oi, sou a Assistente Virtual da Itaú Saúde 👋')  
            Comum.new.texto_existe('Para continuar com o seu atendimento, por favor, digite o CPF da pessoa titular.') 

        when 'Cliente nao identificado'
            Comum.new.texto_existe ('Não consegui localizar o CPF informado. Por favor, digite o CPF da pessoa titular do plano.')

        when 'Massa invalida'
            Comum.new.texto_existe('Não entendi a sua resposta. Por favor, digite o CPF como nos exemplos 👇 123.456.789-10 ou 12345678910')
            
        when 'Nome social'
            Comum.new.texto_existe('Por qual nome podemos te chamar?')

        when 'Unico plano'
            Comum.new.texto_existe('Como eu posso te ajudar?')

        when 'Mais de um plano'
            Comum.new.texto_existe('Teste, você quer atendimento para qual plano?')

        when 'Carteirinha'
            Comum.new.texto_existe('[dev] - caiu em transbordo: atendimento encerrado')

        when 'Reembolso'
            Comum.new.texto_existe('[dev] - caiu em transbordo: atendimento encerrado')

        when 'Autorização'
            Comum.new.texto_existe('[dev] - caiu em transbordo: atendimento encerrado')

        when 'Outros assuntos'
            #Comum.new.texto_existe('[dev] - caiu em transbordo: atendimento encerrado')
            Comum.new.texto_existe('Certo. Antes de transferir seu atendimento, por favor, me conte o que você estava buscando.')

        when 'Voltar'
            Comum.new.texto_existe('Para continuar com o seu atendimento, por favor, digite o CPF da pessoa titular.')
        
        when 'Else primeira tentativa'
            Comum.new.texto_existe('Não entendi a sua resposta. Por favor, escolha uma das opções.')
            Comum.new.texto_existe('Se quiser encerrar o atendimento, é só digitar sair.')

        when 'Else segunda tentativa'
            Comum.new.texto_existe('Ainda não consegui entender e vou precisar encerrar a conversa')
            Comum.new.texto_existe('Quando precisar, é só chamar 🙂')

        when 'Else'
            Comum.new.texto_existe('Não entendi a sua resposta. Por favor, escolha uma das opções.')
            Comum.new.texto_existe('Se quiser encerrar o atendimento, é só digitar sair.')

        when 'Outro plano'
            Comum.new.texto_existe('')

        when 'Encerramento'
            Comum.new.texto_existe('Certo! Vou encerrar a conversa. Quando precisar, é só chamar 🙂')

        when 'Menos que sete numeros'
            Comum.new.texto_existe('Para dar continuidade ao atendimento, preciso que você me informe um código de acesso.')
            Comum.new.texto_existe('Como posso te enviar?')

        when 'Opcao de contato'
            Comum.new.texto_existe('Por favor, digite o código de acesso que acabei de te enviar para o seu número {celular} Importante: ele é válido por 5 minutos. Se não tiver recebido, digite não recebi.')
            Comum.new.texto_existe('Se quiser voltar ao menu anterior, é só digitar voltar.')
        
        when 'Não reconheço os dados'
            Comum.new.texto_existe('Teste, por segurança, não vou poder continuar com o atendimento por aqui.') 
            Comum.new.texto_existe('Para atualizar os seus dados cadastrais, acesse o App Itaú Saúde e siga estes passos 👇')
            Comum.new.texto_existe ('- Faça o login; - Selecione a opção "Meus dados". Depois basta alterar e pronto!')

        when 'Mais que sete numeros'
            Comum.new.texto_existe('Para dar continuidade ao atendimento, preciso que você me informe um código de acesso.')
            Comum.new.texto_existe('Como posso te enviar?')

        when 'Menos que sete emails'
            Comum.new.texto_existe('Para dar continuidade ao atendimento, preciso que você me informe um código de acesso.')
            Comum.new.texto_existe('Como posso te enviar?')


        when 'Mais de sete emails'
            Comum.new.texto_existe('Para dar continuidade ao atendimento, preciso que você me informe um código de acesso.')
            Comum.new.texto_existe('Como posso te enviar?')

        when 'Menos que sete email e telefone'
            Comum.new.texto_existe('Para dar continuidade ao atendimento, preciso que você me informe um código de acesso.')
            Comum.new.texto_existe('Como posso te enviar?')

        when 'Mais que sete emails e telefone'
            Comum.new.texto_existe('Para dar continuidade ao atendimento, preciso que você me informe um código de acesso.')
            Comum.new.texto_existe('Como posso te enviar?')

        when 'Mais opções'
            Comum.new.texto_existe('Para dar continuidade ao atendimento, preciso que você me informe um código de acesso.')
            Comum.new.texto_existe('Como posso te enviar?')

            #####################################Carteirinha##################################

        when 'mostrar carteirinha'
            Comum.new.texto_existe('Aqui está a carteirinha')

        when 'pedir segunda via'
            Comum.new.texto_existe('')

        when 'Não'
            Comum.new.texto_existe('')
            
        when 'Até oito dependentes'
            Comum.new.texto_existe('Localizei aqui este(s) dependente(s) do seu plano.')
            Comum.new.texto_existe('Você quer consultar a carteirinha de quem?')

        when 'Outro dependente'
                Comum.new.texto_existe('Certo. Não localizei outros dependentes por aqui. Se você já solicitou a inclusão, por favor, entre em contato com o RH.')
            
        when 'Mais opções'
            Comum.new.texto_existe('Você quer consultar a carteirinha de quem?')
        

         else
            raise "Erro - Fluxo inválido"
        end    
        
    end

    def redirecionamento_fluxo(fluxo, massa)
        case fluxo
        
        when 'Inicio'
            validacao_fluxo('Inicio')
            Comum.new.preenche_campo(MASSA[massa])
            Comum.new.clica_enviar_whats

        when 'Cliente nao identificado'
            redirecionamento_fluxo('Inicio', massa)
            validacao_fluxo('Cliente nao identificado')
            Comum.new.preenche_campo(MASSA[massa])
            Comum.new.clica_enviar_whats
            Comum.new.texto_existe('Ainda não consegui localizar o CPF informado e vou precisar encerrar a conversa.')
            Comum.new.texto_existe('Quando precisar, é só chamar 🙂')


        when 'Massa valida'
            redirecionamento_fluxo('Inicio', massa)

        when 'Massa invalida'
            redirecionamento_fluxo('Inicio', massa)
            Comum.new.texto_existe('Não entendi a sua resposta. Por favor, digite o CPF como nos exemplos 👇')
            Comum.new.texto_existe ('123.456.789-10 ou 12345678910')
            Comum.new.preenche_campo(MASSA[massa])
            Comum.new.clica_enviar_whats
            Comum.new.texto_existe('Ainda não consegui entender e vou precisar encerrar a conversa.')
            Comum.new.texto_existe('Quando precisar, é só chamar 🙂')

        when 'Nome social'
            redirecionamento_fluxo('Inicio', massa)
            validacao_fluxo('Nome social')
            Comum.new.preenche_campo('Teste')
            Comum.new.clica_enviar_whats
            Comum.new.texto_existe('Certo, podemos prosseguir te chamando de, Teste.')
            sleep(3)
            Comum.new.preenche_campo('NÃO')
            Comum.new.clica_enviar_whats
            Comum.new.texto_existe('Vamos tentar novamente!')
            validacao_fluxo('Nome social')
            Comum.new.preenche_campo('Teste')
            Comum.new.clica_enviar_whats
            Comum.new.texto_existe('Certo, podemos prosseguir te chamando de, Teste.')
            sleep(3)
            Comum.new.preenche_campo('SIM')
            Comum.new.clica_enviar_whats
            
        when 'Unico plano'
            validacao_fluxo('Unico plano')

        when 'Mais de um plano'
            validacao_fluxo('Mais de um plano')
            Comum.new.preenche_campo('Plano 1')
            Comum.new.clica_enviar_whats
       
        when 'Carteirinha'
            redirecionamento_fluxo('Inicio', massa)
            validacao_fluxo('Unico plano')
            Comum.new.preenche_campo('Carteirinha')
            Comum.new.clica_enviar


        when 'Menos que sete numeros'
            validacao_fluxo('Menos que sete numeros')
            Comum.new.preenche_campo('opcao de contato')
            Comum.new.clica_enviar
            validacao_fluxo('Opcao de contato')

        when 'Else Menu inicial'
            validacao_fluxo('Else primeira tentativa')
            Comum.new.preenche_campo('Abacaxi')
            Comum.new.clica_enviar_whats
            validacao_fluxo('Else segunda tentativa')
            Comum.new.preenche_campo('Abacaxi')
            Comum.new.clica_enviar_whats

        else
            raise "Erro - Redirecionamento inválido"
        end    
    end
end

