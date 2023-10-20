#language:pt
@api @elegibility
Funcionalidade: Como requisitante itau
  Eu desejo enviar contratos de produtos
  Para validar minha elegibilidade

  Contexto:
    Dado que informo a url de requisicao "https://teste/1.0/elegibilidade_cliente"

  @test001-006
  Esquema do Cenario: Eleger um cliente com conta ativa, correntista ativa, tipo de produto "<tipoProduto>" e origem <produtoOrigem>  via API
    E informo o body json "contractCustomer.json" na pasta "customerElegibility"
    E altero o campo "elegilibilidade.codigo_tipo_produto_oferta" para o valor "<tipoProduto>"
    E altero o campo "elegilibilidade.codigo_produto_origem" para o valor <produtoOrigem>
    E envio a requisicao "POST"
    Entao valido status code 200
    E valido se o campo "elegilibilidade.indicador_conta_ativa" contem o valor "S"
    E valido o schema "contractCustomerSchema.json" na pasta "customerElegibility"

    Exemplos:
       |tipoProduto|produtoOrigem|
       | AB        | 1234        |
       | CB        | 5678        |
       | DC        | 7722        |
       | AB        | 5564        |
       | AB        | 2286        |
       | AB        | 5561        |

