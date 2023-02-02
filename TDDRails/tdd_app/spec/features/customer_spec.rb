require 'rails_helper'

RSpec.feature "Customers", type: :feature do
  context "Ida até o formulario de cadastro" do
    scenario 'Verifica existência do link de cadastro de clientes' do
      visit(root_path)
      expect(page).to have_link('Cadastro de Clientes')
    end

    scenario 'Verifica a execução do link de cadastro de clientes ' do
      visit(root_path)
      click_on('Cadastro de Clientes')
      expect(page).to have_content('Listando Clientes').and have_link('Novo Cliente')
    end

    scenario 'Verifica redirecionamento para formulário de novo cliente' do
      visit(customers_path)
      click_on('Novo Cliente')
      expect(page).to have_content('Novo Cliente')
    end
  end

  context "Cadastrando clientes" do
    scenario "Cadastra um novo cliente" do
      visit(new_customer_path)
      customer_name = Faker::Name.name

      fill_in('Nome', with: customer_name )
      fill_in('Email', with: Faker::Internet.email)
      fill_in('Telefone', with: Faker::PhoneNumber.phone_number)
      attach_file('Foto do Perfil', "#{Rails.root}/spec/fixtures/avatar.png")
      choose(option:["N", "S"].sample)

      click_on('Criar Cliente')

      expect(Customer.last.name).to eq(customer_name)
      expect(page).to have_content('Cliente cadastrado com sucesso!')
    end

    scenario "Não cadastra cliente invalido" do
      visit(new_customer_path)
      click_on('Criar Cliente')
      expect(page).to have_content('não pode ficar em branco')
    end
  end

  context "Mostrando cliente cadastrado" do
    scenario "Action :show " do
      customer = Customer.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.phone_number,
        smoker: ["N", "S"].sample,
        avatar: "#{Rails.root}/spec/fixtures/avatar.png"
      )

      visit(customer_path(customer.id))
      expect(page).to have_content(customer.name)
      expect(page).to have_content(customer.email)
      expect(page).to have_content(customer.phone)
    end

    scenario "Action :index" do
      customer1 = create(:customer)
      customer2 = create(:customer)

      visit(customers_path)
      expect(page).to have_content(customer1.name).and have_content(customer2.name)
    end
  end

  context "update" do
    scenario "Atualizando cliente" do
      customer = create(:customer)

      new_name = Faker::Name.name
      visit(edit_customer_path(customer.id))
      fill_in('Nome', with: new_name)

      click_on('Atualizar Cliente')

      expect(page).to have_content('Cliente atualizado com sucesso!')
      expect(page).to have_content(new_name)
    end
  end

  context "Executando links" do
    scenario "mostrar" do
      customer = create(:customer)

      visit(customers_path)
      find(:xpath, "/html/body/table/tbody/tr[1]/td[5]/a").click
      expect(page).to have_content("Mostrando Cliente")
    end

    scenario "editar" do
      customer = create(:customer)

      visit(customers_path)
      find(:xpath, "/html/body/table/tbody/tr[1]/td[6]/a").click
      expect(page).to have_content("Edit Cliente")
    end
  end

  context "Destroy" do
    scenario "Excluindo um cliente", js: true do
      customer = create(:customer)

      visit(customers_path)
      find(:xpath, "/html/body/table/tbody/tr[1]/td[7]/a").click
      1.second
      page.driver.browser.switch_to.alert.accept

      expect(page).to have_content('Cliente excluido com sucesso!')
    end
  end



end
