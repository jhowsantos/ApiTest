#language: pt
@run
Funcionalidade: Gerenciar Processos
    Como alguem da area de gerenciamento de processos
    Quero poder gerenciar os processos, criando, alterando e deletando
    Para ter o controle dos processos

    Contexto:
      Dado que o usuário está na home de processos

      Cenário: Incluir processo com sucesso
        E preenche o campo "vara" com o valor "123"
        E preenche o campo "numero_processo" com o valor "999999"
        E preenche o campo "natureza" com o valor "Treta"
        E preenche o campo "partes" com o valor "Fred x Jason"
        E preenche o campo "urgente" com o valor "S"
        E preenche o campo "arbitramento" com o valor "N"
        E preenche o campo "assistente_social" com o valor "Chuck"
        E preenche o campo "data_entrada" com o valor "2020-02-22"
        E preenche o campo "data_saida" com o valor "2020-02-25"
        E preenche o campo "data_agendamento" com o valor "2020-02-24"
        E preenche o campo "status" com o valor "Aguardando testemunhas"
        E preenche o campo "observacao" com o valor "As partes estao de acordo"
        Quando clicar em salvar
        Então deve receber a mensagem de "salvo com sucesso"
        E dever ver o campo "vara" com valor "123"

    Esquema do Cenário: Consultar processos
      E consulta o processo com id "<id>"
      Quando clicar em visualizar
      Então deve receber a mensagem de "<mensagem>"

      Exemplos:
        | id   | mensagem       |
        |  50  | sucesso        |
        | 9999 | não encontrado |

    Cenário: Alterar dados do processo
      E consulta o processo com id "50"
      E preenche o campo "vara" com o valor "99"
      E preenche o campo "numero_processo" com o valor "001100"
      E preenche o campo "natureza" com o valor "Digital"
      E preenche o campo "partes" com o valor "Jobs x Gates"
      E preenche o campo "urgente" com o valor "S"
      E preenche o campo "arbitramento" com o valor "N"
      E preenche o campo "assistente_social" com o valor "Jhonatas Matos"
      E preenche o campo "data_entrada" com o valor "2020-03-12"
      E preenche o campo "data_saida" com o valor "2020-04-20"
      E preenche o campo "data_agendamento" com o valor "2020-03-23"
      E preenche o campo "status" com o valor "Aguardando acusadores"
      E preenche o campo "observacao" com o valor "Nada a declarar"
      Quando clicar em atualizar
      Então deve receber a mensagem de "sucesso"
      E dever ver o campo "vara" com valor "99"

    Cenário: Deletar processo com sucesso
      E preenche o campo "vara" com o valor "123"
      E preenche o campo "numero_processo" com o valor "999999"
      E preenche o campo "natureza" com o valor "Treta"
      E preenche o campo "partes" com o valor "Fred x Jason"
      E preenche o campo "urgente" com o valor "S"
      E preenche o campo "arbitramento" com o valor "N"
      E preenche o campo "assistente_social" com o valor "Chuck"
      E preenche o campo "data_entrada" com o valor "2020-02-22"
      E preenche o campo "data_saida" com o valor "2020-02-25"
      E preenche o campo "data_agendamento" com o valor "2020-02-24"
      E preenche o campo "status" com o valor "Aguardando testemunhas"
      E preenche o campo "observacao" com o valor "As partes estao de acordo"
      E clicar em salvar
      E clicar em deletar
      E deve receber a mensagem de "sem informação"
      Quando clicar em visualizar
      Então deve receber a mensagem de "não encontrado"

    Cenário: Tentar deletar processo sem passar dados
      Quando clicar em deletar
      Então deve receber a mensagem de "não encontrado"