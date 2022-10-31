namespace :dev do

  desc "Deleta, cria, faz a migration e sob os dados do DB"
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Apagando BD...') { %x(rails db:drop) }

      show_spinner('Criando BD...') { %x(rails db:create) }

      show_spinner('Migrando BD...') {%x(rails db:migrate)}

      show_spinner('Add admin padrão...') {%x(rails dev:add_default_admin)}
      show_spinner('Add user padrão...') {%x(rails dev:add_default_user)}


    else
      puts "Vc não esta em ambiente de desenvolvimento"
    end
  end

  desc "Cadastra um adm padrão"
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin.com',
      password: 123456,
      password_confirmation: 123456)
  end

  desc "Cadastra um usuario padrão"
  task add_default_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: 123456,
      password_confirmation: 123456)
  end


  private

  def show_spinner(msg_start, msg_end = 'Concluído')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

end
