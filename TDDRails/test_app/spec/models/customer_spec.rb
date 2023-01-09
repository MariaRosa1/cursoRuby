require 'rails_helper'

RSpec.describe Customer, type: :model do

####################################################################

  # it "tentando time.now" do
  #     @customer = create(:customer_vip)
  #     expect(@customer.created_at).to eq(Time.now)
  # end


  it "to_travel com be" do
    travel_to Time.zone.local(2004, 10, 14, 01, 04, 44) do
      @customer = create(:customer_vip)
    end
    expect(@customer.created_at).to be < Time.now
  end

  # it "to_travel com time.new" do
  #   travel_to Time.zone.local(2004, 10, 14, 01, 04, 44) do
  #     @customer = create(:customer_vip)
  #   end

  #   puts @customer.inspect
  #   puts @customer.created_at
  #   puts Time.now
  #   expect(@customer.created_at).to eq(Time.new(2004, 10, 14, 01, 04, 44))
  # end

####################################################################
# sequence

  # it "Email" do
  #   customer = create(:customer)
  #   customer1 = create(:customer)
  #   puts customer.email
  #   puts customer1.email
  # end

####################################################################
# traits

  # it "Cliente masculino default" do
  #   customer = create(:customer_male_default)
  #   expect(customer.vip).to  be false
  #   expect(customer.gender).to eq("M")
  # end

  # it "Cliente feminino vip" do
  #   customer = create(:customer_female_vip)
  #   expect(customer.vip).to  be true
  #   expect(customer.gender).to eq("F")
  # end

  # it "Cliente feminino" do
  #   customer = create(:customer_female)
  #   expect(customer.gender).to eq("F")
  # end

####################################################################

  # it "Atributo transitorio" do
  #   customer = create(:customer, upcased: true)
  #   expect(customer.name.upcase).to eq(customer.name)
  #   puts customer.name
  # end

####################################################################

    # it "attributes_for" do
    #   attrs = attributes_for(:customer)
    #   puts attrs
    #   customer = Customer.create(attrs)
    #   expect(customer.full_name).to start_with("Sr. ")
    # end

####################################################################

    # it "#default" do
    #   customer = create(:customer_default) #ou create(:customer)
    #   expect(customer.vip).to be_falsey
    # end

    # it "#vip" do
    #   customer = create(:customer_vip) #ou create(:customer)
    #   expect(customer.vip).to be true
    # end

####################################################################

  # it "#full_name com nome específico -- Sobrescrevendo" do
  #   customer = create(:customer, name: "Maria Clara")
  #   expect(customer.full_name).to eq("Sr. Maria Clara")
  # end


  # it "#full_name" do
  #   customer = create(:user) #ou create(:customer)
  #   expect(customer.full_name).to start_with("Sr. ")
  # end

  # it { expect{ create(:customer) }.to change{Customer.all.size}.by(1) }


  # it "create a customer com factories" do
  #   customer = create(:customer)
  #   expect(customer.full_name).to eq("Sr. maria rosa")
  # end

####################################################################

# fixtures :customers
  # it "create a customer com fixtures" do
  #   customer = customers(:maria)
  #   expect(customer.full_name).to eq("Sr. Maria Clara")
  # end


  # it "create a customer normal" do
  #   subject.name = "Jose"
  #   subject.email = "jose@js.com"
  #   subject.save
  #   expect(subject.full_name).to eq("Sr. Jose")
  # end
end
