#language:pt
@api
Funcionalidade: Como requisitante itau
  Eu desejo enviar contratos de produtos
  Para validar minha elegibilidade

  Contexto:
    Dado que informo a url de requisicao "https://postman-echo.com/post"

  @testPostman001
  Esquema do Cenario: Validar automacao com postman com tipo  "<tipoProduto>" e origem <produtoOrigem>
    E informo o body json "postmanBody.json" na pasta "postmanTest"
    E altero o campo "elegilibilidade.codigo_tipo_produto_oferta" para o valor "<tipoProduto>"
    E altero o campo "elegilibilidade.codigo_produto_origem" para o valor <produtoOrigem>
    E envio a requisicao "POST"
    Entao valido status code 200
    E valido se o campo "json.elegilibilidade.indicador_conta_ativa" contem o valor "S"
    E valido o schema "postmanTestSchema.json" na pasta "postmanTest"

    Exemplos:
    | tipoProduto | produtoOrigem |
    |  QA         |  1234         |
    |  QE         |  6789         |

  @testPostman002
  Esquema do Cenario: Validar automacao com postman com tipo  "<tipoProduto>" e origem <produtoOrigem>
    E informo o body json "contractCustomer.json" na pasta "customerElegibility"
    E altero o campo "elegilibilidade.contratos[0].codigo_tipo_produto_oferta" para o valor "<tipoProduto>"
    E altero o campo "elegilibilidade.contratos[0].codigo_produto_origem" para o valor <produtoOrigem>
    E envio a requisicao "POST"
    Entao valido status code 200
    E valido se o campo "json.elegilibilidade.contratos[0].indicador_conta_ativa" contem o valor "S"
    E valido o schema "contractSchema.json" na pasta "postmanTest"

    Exemplos:
      | tipoProduto | produtoOrigem |
      |  QA         |  1234         |
      |  QE         |  6789         |