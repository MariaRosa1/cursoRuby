namespace :dev do
  desc "Deleta, cria, faz a migration e sob os dados do DB"
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Apagando BD...') { %x(rails db:drop) }

      show_spinner('Criando BD...') { %x(rails db:create) }

      show_spinner('Migrando BD...') {%x(rails db:migrate)}

      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)

    else
      puts "Vc não esta em ambiente de desenvolvimento"
    end
  end

  desc "Cadastra as moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando moedas") do

      coins = [
        { description: "Bitcoin",
        acronym: "BTC",
        url_image: "https://e7.pngegg.com/pngimages/261/204/png-clipart-bitcoin-bitcoin-thumbnail.png",
        mining_type: MiningType.find_by(acronym: 'PoW')},

        { description: "Ethereum",
        acronym: "ETH",
        url_image: "https://w7.pngwing.com/pngs/268/1013/png-transparent-ethereum-eth-hd-logo-thumbnail.png",
        mining_type: MiningType.all.sample},

        { description: "Dash",
        acronym: "DASH",
        url_image: "https://cryptologos.cc/logos/history/dash-logo-2014.svg?v=001",
        mining_type: MiningType.all.sample},

        { description: "Iota",
        acronym: "IOT",
        url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1720.png",
        mining_type: MiningType.all.sample},

        { description: "ZCash",
        acronym: "ZEC",
        url_image: "https://cryptologos.cc/logos/zcash-zec-logo.png",
        mining_type: MiningType.all.sample}]

      coins.each do |coin|
          Coin.find_or_create_by!(coin)
      end

    end
  end


  desc "Cadastra os tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando tipos de mineração") do

      mining_types = [
        { description: "Proof of Work", acronym: "PoW"},
        { description: "Proof of Stake", acronym: "PoS"},
        { description: "Proof of Capacity", acronym: "PoC"}
      ]

      mining_types.each do |type|
        MiningType.find_or_create_by!(type)
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
