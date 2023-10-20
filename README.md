# Automation-project-itau

#Automação API Realizada na Linguagem JAVA

## 🚀 Começando

Essas instruções permitirão que você obtenha uma cópia do projeto de automação na sua máquina local para fins de avaliação dos teste.
E também para avaliação dos projetos


### 📋 Projeto Elegibilidade

Definir se um cliente com um ou mais contratos é elegível ou não de acordo com as regras pré definidas.
• Utilizar as variáveis e suas informações para definir a elegibilidade.
PS: A entrada pode ter mais de um contrato, podendo um ser elegível ou não, fazendo com que o cliente acabe não sendo elegível.
Regras:
Se todas as condições forem verdadeiras:
- indicador cliente correntista = “S”
- indicador conta ativa = “S”
- código tipo produto oferta está entre (“AB”, “CB”, “DC”)
- código tipo produto oferta produto oferta não está entre (“CC”, “CD”, “AC”)
- codigo produto origem está entre (1234, 5678, 7722, 5564, 2286, 5561)
- codigo produto origem não está entre (5555, 7777, 8888, 9999, 1010)
  Então
- atribuir ao indicador_elegibilidade_cliente = “S”

### ⚙️Testes

O projeto possui duas features:
- **CustomerElegibilityPOST.feature** - Onde contém a modelagem dos cenários com BDD, e a automação dos testes.
- **PostmanTest.feature** - Uma feature criada com a intenção de validação dos steps criados, apontando para uma API do postman.


o Projeto traz dois entendimentos referente as testes:

**1** - As condições de tipo de produto e origem, são de fato as que estão no escopo, logo temos produtos que elegem clientes e produtos que não elegem, e qualquer outro produto que não foi citado será considerado como produto Inexistente, então ao meu ver é necessário testar todos produtos positivos e negativos;

**2** -  Apenas os produtos que elegem são importantes, logo tudo que for diferente disso, o cliente não será eleito, então não a necessidade de criar testes para todos os produtos que não elegem o cliente, e também não teriamos uma mensagem de produto inexistente.

Esse projeto segue com testes referente a opção 1.


### 🔩 Analise os testes de ponta a ponta

Explique que eles verificam esses testes e porquê.

```
Dar exemplos
```


## 🛠️ Construído com

- Java 11
- Cucumber
- Maven
