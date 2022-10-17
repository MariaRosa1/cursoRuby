# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Coin.create!(
    description: "Bitcoin",
    acronym: "BTC",
    url_image: "https://e7.pngegg.com/pngimages/261/204/png-clipart-bitcoin-bitcoin-thumbnail.png"
)
Coin.create!(
    description: "Ethereum",
    acronym: "ETH",
    url_image: "https://w7.pngwing.com/pngs/268/1013/png-transparent-ethereum-eth-hd-logo-thumbnail.png"
)
Coin.create!(
    description: "Dash",
    acronym: "DASH",
    url_image: "https://cryptologos.cc/logos/history/dash-logo-2014.svg?v=001"
)
puts "As moedas foram cadastradas com sucesso"