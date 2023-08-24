# encoding: utf-8
# language: pt
require 'watir'
require 'rspec'


Dado("que estou na página de login") do
  @browser = Watir::Browser.new
  @browser.goto("https://lms-hcm.com.br/home/login")
end

Quando("eu preencher o campo de e-mail com {string}") do |emailaddress|
  @browser.text_field(id: 'emailaddress').set(emailaddress)
end

E("eu preencher o campo de senha com {string}") do |password|
  @browser.text_field(id: 'password').set(password)
end

E("eu clicar no botão de login") do
  @browser.button(class: 'btn btn-primary btn-block').click
end

Então("devo ser redirecionado para a página inicial") do
  logged_in_message = @browser.span(class: 'account-user-name').text
  expect(logged_in_message).to include('Aluno Aluno')
end

After do
  @browser.close
end

Dado("que estou na página de criação de usuário") do
  @browser = Watir::Browser.new
  @browser.goto("https://lms-hcm.com.br/home/login")
  @browser.text_field(id: 'emailaddress').set('adm@hcmsolucoes.com.br')
  @browser.text_field(id: 'password').set('mudar12345@')
  @browser.button(class: 'btn btn-primary btn-block').click
  @browser.goto("https://lms-hcm.com.br/admin/user_form/add_user_form")
end

Quando("eu preencher o campo de nome com {string}") do |first_name|
  @browser.text_field(id: 'first_name').set(first_name)
  @browser.text_field(id: 'last_name').set(first_name)
end

E("eu preencher o campo de novo e-mail com {string}") do |email|
  @browser.a(href: '#login_credentials').click
  @browser.text_field(id: 'email').set(email)
end

E("eu preencher o campo de nova senha com {string}") do |password|
  @browser.text_field(id: 'password').set(password)
end

E("eu clicar no botão de criar usuário") do
  @browser.a(href: '#finish').click
  @browser.button(name: 'button').click
end


Então("devo ver uma mensagem de sucesso {string}") do |expected_message|

  toast_message = @browser.h2(class: 'jq-toast-heading').text
  expect(toast_message).to include(expected_message)
end

After do
  @browser.close
end


Dado("que estou na página de visualização de usuários") do
  @browser = Watir::Browser.new
  @browser.goto("https://lms-hcm.com.br/home/login")
  @browser.text_field(id: 'emailaddress').set('adm@hcmsolucoes.com.br')
  @browser.text_field(id: 'password').set('mudar12345@')
  @browser.button(class: 'btn btn-primary btn-block').click
  @browser.goto("https://lms-hcm.com.br/admin/users?status=1")
end

Então("devo ver uma lista de usuários cadastrados") do

  table = @browser.table(id: 'basic-datatable')

  # Verificar se existem registros na tabela
  if table.exists?
    rows = table.rows

    # Ignorar o cabeçalho da tabela, começar a contagem a partir do índice 1
    expect(rows.count).to be > 1
    puts "Existem registros na tabela."
  else
    puts "A tabela não foi encontrada."
  end

end

After do
  @browser.close
end


Dado("que estou na página de edição de usuário") do
  @browser = Watir::Browser.new
  @browser.goto("https://lms-hcm.com.br/home/login")
  @browser.text_field(id: 'emailaddress').set('adm@hcmsolucoes.com.br')
  @browser.text_field(id: 'password').set('mudar12345@')
  @browser.button(class: 'btn btn-primary btn-block').click
  @browser.goto("https://lms-hcm.com.br/admin/users?status=1")
end

Quando("eu selecionar o usuário {string}") do |first_name|
  @browser.input(class: 'form-control form-control-sm').set(first_name)
  @browser.button(class: 'btn btn-sm btn-outline-primary btn-rounded btn-icon').click
  @browser.a(text: 'Editar').click
end

E("eu atualizar o campo de nome com {string}") do |first_name|
  @browser.text_field(id: 'first_name').set(first_name)
  @browser.text_field(id: 'last_name').set(first_name)
end

E("eu clicar no botão de salvar alterações") do
  @browser.a(href: '#finish').click
  @browser.button(name: 'button').click
end

Então("devo ver uma mensagem de sucesso edição {string}") do |expected_message|

  toast_message = @browser.h2(class: 'jq-toast-heading').text
  expect(toast_message).to include(expected_message)
end


After do
  @browser.close
end


Dado("que estou na página de visualização de usuários para excluir") do
  @browser = Watir::Browser.new
  @browser.goto("https://lms-hcm.com.br/home/login")
  @browser.text_field(id: 'emailaddress').set('adm@hcmsolucoes.com.br')
  @browser.text_field(id: 'password').set('mudar12345@')
  @browser.button(class: 'btn btn-primary btn-block').click
  @browser.goto("https://lms-hcm.com.br/admin/users?status=1")
end

Quando("eu selecionar o usuário {string} para excluir") do |first_name|
  @browser.input(class: 'form-control form-control-sm').set(first_name)
end

E("eu clicar no botão de excluir usuário") do
  @browser.button(class: 'btn btn-sm btn-outline-primary btn-rounded btn-icon').click
  @browser.a(text: 'Apagar').click
end

Então("devo ver uma mensagem de confirmação {string}") do |expected_message|

  if @browser.element(:text => expected_message).exists? == true
    sleep 3
  end

end


E("eu confirmar a exclusão") do
  @browser.a(text: 'Continuar').click
end

Então("devo ver uma mensagem de sucesso de exclusão {string}") do |expected_message|

  toast_message = @browser.h2(class: 'jq-toast-heading').text
  expect(toast_message).to include(expected_message)
end