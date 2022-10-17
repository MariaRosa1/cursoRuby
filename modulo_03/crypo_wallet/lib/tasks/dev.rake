namespace :dev do
  desc "Deleta, cria, faz a migration e sob os dados do DB"
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Apagando BD...') { %x(rails db:drop) }

      show_spinner('Criando BD...') { %x(rails db:create) }

      show_spinner('Migrando BD...') {%x(rails db:migrate)}

      show_spinner('Populando BD...') do
        %x(rails db:seed)
      end

    else
      puts "Vc não esta em ambiente de desenvolvimento"
    end
  end

  def show_spinner(msg_start, msg_end = 'Concluído')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

end
