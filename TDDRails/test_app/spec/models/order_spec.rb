require 'rails_helper'

RSpec.describe Order, type: :model do

  xit "has_many" do
    
  end

####################################################################

  it "create_list com 3 pedidos" do
    orders = create_list(:order, 3, description: "oi")
    expect(orders.count).to eq(3)
    puts orders.inspect
  end

####################################################################

  it "belongs to sobrescrevendo customer" do
    order = create(:order, customer: Customer.new)
    expect(order.customer).to be_kind_of(Customer)
  end

####################################################################

  # it "belongs to" do
  #   order = create(:order)
  #   expect(order.customer).to be_kind_of(Customer)
  #   puts order.description
  #   puts order.customer
  #   puts order.customer.name
  # end

end
