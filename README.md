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

**test001** -	Eleger um cliente com conta ativa, correntista ativa, tipo de produto AB e origem 1234  via API

**test002** -	Eleger um cliente com conta ativa, correntista ativa, tipo de produto CB e origem 5678  via API

**test003** -	Eleger um cliente com conta ativa, correntista ativa, tipo de produto DC  e origem 7722 via API

**test004** -	Eleger um cliente com conta ativa, correntista ativa, tipo de produto AB e origem 5564 via API

**test005** -	Eleger um cliente com conta ativa, correntista ativa, tipo de produto AB e origem 2286 via API

**test006** -	Eleger um cliente com conta ativa, correntista ativa, tipo de produto AC  e origem 5561 via API

**test007** -	Eleger um cliente com dois contratos com os valores que permitem a elegibilidade via API

**test008** -	Negar elegibilidade do cliente com conta ativa, correntista ativa, tipo de produto CC e a origem 1234 via API

**test009** -	Negar elegibilidade do cliente com conta ativa, correntista ativa, tipo de produto CD e a origem 1234 via API

**test010** -	Negar elegibilidade do cliente com conta ativa, correntista ativa, tipo de produto AC e a origem 1234 via API

**test011** -	Negar elegibilidade do cliente com conta ativa, correntista ativa, tipo de produto AB e a origem 5555 via API

**test012** -	Negar elegibilidade do cliente com conta ativa, correntista ativa, tipo de produto AB e a origem 7777 via API

**test013** -	Negar elegibilidade do cliente com conta ativa, correntista ativa, tipo de produto AB e a origem 8888 via API

**test014** -	Negar elegibilidade do cliente com conta ativa, correntista ativa, tipo de produto AB e a origem 9999 via API

**test015** -	Negar elegibilidade do cliente com conta ativa, correntista ativa, tipo de produto AB e a origem 1010 via API

**test016** -	Validar a eligibilidade do cliente com um tipo de produto Inexistente via API

**test017** -	Validar a eligibilidade do cliente com um produto origem inexistente via API

**test018** -	Negar a eligibilidade do cliente com conta não ativa via API

**test019** -	Negar a eligibilidade do cliente com conta não correntista  via API

**test020** -	Negar a eligibilidade do cliente com um contrato valido e o outro contrato com conta não ativa via API

**test021** -	Negar a eligibilidade do cliente com conta ativa em branco via API

**test022** -	Negar a eligibilidade do cliente com conta correntista em branco via API

**test023** -	Negar a eligibilidade do cliente com tipo do produto em branco via API

**test024** -	Negar a eligibilidade do cliente com produto origem em branco via API

Testes retirando campos, ou nulos seriam testados manualmente ou como testes exploratórios

A modelagem  BDD está na feature.

### 📋 Projeto Senha inválida

Você está iniciando o refinamento de backlog em conjunto com a área de negócio e a
Story não está bem descrita. Quais questionamentos podem ser feitos para entender o
pedido realizado? Visando uma melhoria no processo, para que num futuro sua
modelagem seja mais eficaz, quais sugestões podem ser feitas para melhoria da escrita?

Story:
Como Product Analytics
Gostaria de ter um validador de senha
Para não permitir que nossos clientes cadastrem senhas inválidas

### ⚙️Questionamentos e sugestões

Qual seria a principal motivação da criação do sistema?
O que é considerado uma senha válida?
Quais os requisitos e complexidade de uma senha válida? (Caracteres, tamanho, combinações)
A senha teria uma data de expiração, e uma validação para não criar senhas iguais as anteriores?
Qual seria a mensagem para uma senha inválida? Seria bom ter uma instrução dos requisitos da senha.
O validador tem um site específico ou seria um portal de integração com ontros sistemas?
Quais os beneficios, e resultados esperados com a criação do validador?

Para uma melhor modelagem, precisamos saber requisitos e complexidade das senhas, precisamos saber a dor e o desejo final do cliente.
Então sugiro Dor e Dods, Prazo de entrega e regras de negócio detalhadas.


## 🛠️ Construído com

- Java 11
- Cucumber
- Maven
- Allure Report
