namespace :dev do

  DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

  desc "Deleta, cria, faz a migration e sob os dados do DB"
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Apagando BD...') { %x(rails db:drop) }

      show_spinner('Criando BD...') { %x(rails db:create) }

      show_spinner('Migrando BD...') {%x(rails db:migrate)}

      show_spinner('Add admin padrão...') {%x(rails dev:add_default_admin)}
      show_spinner('Add admin extras...') {%x(rails dev:add_extras_admin)}
      show_spinner('Add user padrão...') {%x(rails dev:add_default_user)}

      show_spinner('Add assuntos padrão...') {%x(rails dev:add_subjects)}
      show_spinner('Add questões padrão...') {%x(rails dev:add_question)}


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

  desc "Cadastra varios adms"
  task add_extras_admin: :environment do
    10.times do |i|
      Admin.create!(
        email: Faker::Internet.email,
        password: 123456,
        password_confirmation: 123456)
    end
  end

  desc "Cadastra um usuario padrão"
  task add_default_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: 123456,
      password_confirmation: 123456)
  end

  desc "Adiciona assuntos padrão"
  task add_subjects: :environment do
    file_name = 'subjects.txt'
    file_path = File.join(DEFAULT_FILES_PATH, file_name)

    File.open(file_path, 'r').each do |line|
      Subject.create!(description: line.strip)
    end
  end

  desc "Cadastra varias questoes"
  task add_question: :environment do
    Subject.all.each do |subject|
      rand(2..4).times do |i|
        Question.create!(
          description: "#{Faker::Lorem.paragraph} #{Faker::Lorem.question}",
          subject: subject
        )
      end
    end
  end


  private

  def show_spinner(msg_start, msg_end = 'Concluído')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

end
