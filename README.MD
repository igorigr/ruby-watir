# Projeto Base Automação Web - Ruby, Watir & Cucumber(BDD) + Rspec

## Ferramentas utilizadas:
- [Ruby](https://www.ruby-lang.org/en/ "Ruby")
- [Watir](http://watir.com/ "Watir")
- [Cucumber](https://cucumber.io/ "Cucumber")
- [Rspec](https://rspec.info/ "Rspec")

## DEPENDENCIES

  cucumber
  rspec
  watir

## Pré-Requisitos para utilização:

- Possuir uma versão do Ruby instalado. (Required ruby-3.2.2 )
- Mapear o arquivo Gemfile na pasta principal.
- Instalar as bibliotecas necessárias para funcionamento do Watir, para
isso basta abrir o terminal na pasta do projeto e executar os comandos a seguir:

- Install the gem:

bundle

- Install the watir:

gem install watir-webdriver

- Install the Cucumber:

gem install cucumber

- Then, initialize a features/ directory:

cucumber --init

- Install the rspec:

gem install rspec

Referências:

- [Cucumber para Ruby](https://cucumber.io/docs/installation/ruby/ "Cucumber")


### Arquitetura - Bibliotecas utilizadas

Neste projeto foi utilizada a linguagem Ruby com a Gem Watir, para fazer a automação das ações do browser e a Gem Rspec para fazer as validações e o Cucumber para escrever as features BDD.

```
├── README.md
├── .idea
    └── gitignore
    └── CucumberTeste.iml
    └── modules.xml
    └── workspace.xml
└── features
    ├── step_definitions
    │   ├── user_steps.rb
    └── user.features
└── .ruby-version
├── Gemfile
├── Gemfile.lock

```

### Sobre o Projeto

Neste projeto foi utilizado um sistema de LMS, onde os requisitos são:

- Logar com um usuário do Tipo Administrador
- Criar um novo usuário
- Visualizar o novo usuário criado
- Editar este novo usuários
- Excluir este novo usuário

### Como executar o Projeto

No terminal executar o seguinte comando do cucumber

- Para rodar o Teste Todo

cucumber 

- Para rodar o Teste Unitario por Cenário de acordo com a Tag

cucumber --@NomeDaTag