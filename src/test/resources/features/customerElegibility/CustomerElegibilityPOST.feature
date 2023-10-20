#language:pt
@api @elegibility
Funcionalidade: Como requisitante itau
  Eu desejo enviar contratos de produtos
  Para validar elegibilidade de clientes

  Contexto:
    Dado que informo a url de requisicao "https://teste/1.0/elegibilidade_cliente"

  @test001-006
  Esquema do Cenario: Eleger um cliente com conta ativa, correntista ativa, tipo de produto "<tipoProduto>" e origem <produtoOrigem>  via API
    E informo o body json "contractCustomer.json" na pasta "customerElegibility"
    E altero o campo "elegilibilidade.contratos[0].codigo_tipo_produto_oferta" para o valor "<tipoProduto>"
    E altero o campo "elegilibilidade.contratos[0].codigo_produto_origem" para o valor <produtoOrigem>
    E envio a requisicao "POST"
    Entao valido status code 200
    E valido se o campo "elegilibilidade_cliente_saida.indicador-elegibilidade_cliente" contem o valor "S"
    E valido o schema "contractCustomerSchema.json" na pasta "customerElegibility"

    Exemplos:
       |tipoProduto|produtoOrigem|
       | AB        | 1234        |
       | CB        | 5678        |
       | DC        | 7722        |
       | AB        | 5564        |
       | AB        | 2286        |
       | AB        | 5561        |

  @test007
  Cenario: Eleger um cliente com dois contratos com os valores que permitem a elegibilidade via API
    E informo o body json "contractsCustomer.json" na pasta "customerElegibility"
    E envio a requisicao "POST"
    Entao valido status code 200
    E valido se o campo "elegilibilidade_cliente_saida.indicador-elegibilidade_cliente" contem o valor "S"
    E valido o schema "contractCustomerSchema.json" na pasta "customerElegibility"

  @test008-015
  Esquema do Cenario: Negar elegibilidade do cliente com conta ativa, correntista ativa, tipo de produto "<tipoProduto>" e origem <produtoOrigem>  via API
    E informo o body json "contractCustomer.json" na pasta "customerElegibility"
    E altero o campo "elegilibilidade.contratos[0].codigo_tipo_produto_oferta" para o valor "<tipoProduto>"
    E altero o campo "elegilibilidade.contratos[0].codigo_produto_origem" para o valor <produtoOrigem>
    E envio a requisicao "POST"
    Entao valido status code 200
    E valido se o campo "elegilibilidade_cliente_saida.indicador-elegibilidade_cliente" contem o valor "N"
    E valido o schema "contractCustomerSchema.json" na pasta "customerElegibility"

    Exemplos:
      |tipoProduto|produtoOrigem|
      | CC        | 1234        |
      | CD        | 1234        |
      | AC        | 1234        |
      | AB        | 5555        |
      | AB        | 7777        |
      | AB        | 8888        |
      | AB        | 9999        |
      | AB        | 1010        |

  @test016
  Cenario: Validar a eligibilidade do cliente com um tipo de produto Inexistente via API
    E informo o body json "contractCustomer.json" na pasta "customerElegibility"
    E altero o campo "elegilibilidade.contratos[0].codigo_tipo_produto_oferta" para o valor "XX"
    E envio a requisicao "POST"
    Entao valido status code 422

  @test017
  Cenario: Validar a eligibilidade do cliente com um produto origem inexistente via API
    E informo o body json "contractCustomer.json" na pasta "customerElegibility"
    E altero o campo "elegilibilidade.contratos[0].codigo_produto_origem" para o valor 5009
    E envio a requisicao "POST"
    Entao valido status code 422

  @test018-019
  Esquema do Cenario: Negar elegibilidade do cliente com conta não ativa, e não correntista via API
    E informo o body json "contractCustomer.json" na pasta "customerElegibility"
    E altero o campo "elegilibilidade.contratos[0].indicador_conta_ativa" para o valor "<contaAtiva>"
    E altero o campo "elegilibilidade.contratos[0].indicador_cliente_correntista" para o valor "<correntista>"
    E envio a requisicao "POST"
    Entao valido status code 200
    E valido se o campo "elegilibilidade_cliente_saida.indicador-elegibilidade_cliente" contem o valor "N"
    E valido o schema "contractCustomerSchema.json" na pasta "customerElegibility"

    Exemplos:
      |contaAtiva|correntista|
      | S        | N         |
      | N        | S         |

  @test020
  Cenario: Negar a eligibilidade do cliente com um contrato valido e o outro contrato com conta não ativa via API
    E informo o body json "contractsCustomer.json" na pasta "customerElegibility"
    E altero o campo "elegilibilidade.contratos[1].indicador_cliente_correntista" para o valor "N"
    E envio a requisicao "POST"
    Entao valido status code 200
    E valido se o campo "elegilibilidade_cliente_saida.indicador-elegibilidade_cliente" contem o valor "N"
    E valido o schema "contractCustomerSchema.json" na pasta "customerElegibility"


  @test021
  Cenario: Negar a eligibilidade do cliente com conta ativa em branco via API
    E informo o body json "contractCustomer.json" na pasta "customerElegibility"
    E altero o campo "elegilibilidade.contratos[0].indicador_conta_ativa" para o valor ""
    E envio a requisicao "POST"
    Entao valido status code 422

  @test022
  Cenario: Negar a eligibilidade do cliente com conta correntista em branco via API
    E informo o body json "contractCustomer.json" na pasta "customerElegibility"
    E altero o campo "elegilibilidade.contratos[0].indicador_cliente_correntista" para o valor ""
    E envio a requisicao "POST"
    Entao valido status code 422

  @test023
  Cenario: Negar a eligibilidade do cliente com tipo do produto em branco via API
    E informo o body json "contractCustomer.json" na pasta "customerElegibility"
    E altero o campo "elegilibilidade.contratos[0].codigo_tipo_produto_oferta" para o valor ""
    E envio a requisicao "POST"
    Entao valido status code 422

  @test024
  Cenario: Negar a eligibilidade do cliente com produto origem em branco via API
    E informo o body json "contractCustomer.json" na pasta "customerElegibility"
    E altero o campo "elegilibilidade.contratos[0].codigo_produto_origem" para o valor ""
    E envio a requisicao "POST"
    Entao valido status code 422
