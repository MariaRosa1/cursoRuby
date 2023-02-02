require 'rails_helper'

RSpec.feature "Welcomes", type: :feature do
  scenario "Mostrar mensagem bem-vindo" do
    visit(root_path)
    expect(page).to have_content('Bem-vindo')
  end

  scenario "Verificar o link de cadastro de clientes" do
    visit(root_path)
    expect(find('ul li')).to have_link('Cadastro de Clientes')
  end
end
