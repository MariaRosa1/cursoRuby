<ul>
    <li>
        <a href="/coins">Cadastros das moedas</a>
    </li>
    <li>
        <%= link_to 'Casdastro das moedas', coins_path %>
    </li>
</ul>

<p> A soma é <%= 1 + 1%> </p>
<% ax = "minha variavel a" %>
<p> Imprimindo a variavel a: <%= ax %> </p>
<p> A data de hoje é: <%= Date.today %> </p>


aplication.js
<% msg = Time.now.hour < 12 ? 'Bom dia!' : 'Olá!!!' %>
alert("<%= msg %>");

source 'https://rails-assets.org' do
  gem 'rails-assets-jquery'
  gem 'rails-assets-notifyjs'
end


aula 54
aula 66
aula 71
aula 80
aula 87
aula 91

