# language: pt
Funcionalidade: Login de usuário
  @logar
  Cenário: Login Usuário Válido

    Dado que estou na página de login
    Quando eu preencher o campo de e-mail com "student@hcmsolucoes.com.br"
    E eu preencher o campo de senha com "mudar12345@"
    E eu clicar no botão de login
    Então devo ser redirecionado para a página inicial

  @criarusuario
  Cenário: Criação de usuário

    Dado que estou na página de criação de usuário
    Quando eu preencher o campo de nome com "Novo Usuário"
    E eu preencher o campo de novo e-mail com "novo_usuario@teste.com"
    E eu preencher o campo de nova senha com "senha456"
    E eu clicar no botão de criar usuário
    Então devo ver uma mensagem de sucesso "Parabéns"

  @visualizar
  Cenário: Visualização de usuários

    Dado que estou na página de visualização de usuários
    Então devo ver uma lista de usuários cadastrados

  @editar
  Cenário: Edição de usuário

    Dado que estou na página de edição de usuário
    Quando eu selecionar o usuário "Novo Usuário"
    E eu atualizar o campo de nome com "Usuário Atualizado"
    E eu clicar no botão de salvar alterações
    Então devo ver uma mensagem de sucesso edição "Parabéns"

  @excluir
  Cenário: Exclusão de usuário

    Dado que estou na página de visualização de usuários para excluir
    Quando eu selecionar o usuário "Usuário Atualizado" para excluir
    E eu clicar no botão de excluir usuário
    Então devo ver uma mensagem de confirmação "Você tem certeza?"
    E eu confirmar a exclusão
    Então devo ver uma mensagem de sucesso de exclusão "Parabéns"
