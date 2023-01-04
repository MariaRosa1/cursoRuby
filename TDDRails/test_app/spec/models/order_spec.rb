require 'rails_helper'

RSpec.describe Order, type: :model do

####################################################################

  it "has_many com factory e trait" do
    customer = create(:customer_with_orders, qtt_orders: 5)
    expect(customer.orders.count).to eq(5)
    puts customer.inspect
    # puts customer.orders.inspect
  end

  it "has_many sobrescrevendo" do
    customer = create(:customer, :with_orders, qtt_orders: 5)
    expect(customer.orders.count).to eq(5)
    puts customer.inspect
    puts customer.orders.inspect
  end

  it "has_many" do
    customer = create(:customer, :with_orders)
    expect(customer.orders.count).to eq(3)
    puts customer.inspect
    puts customer.orders.map{|n| n.description}
  end

####################################################################

  # it "create_pair com 3 pedidos" do
  #   orders = create_pair(:order)
  #   expect(orders.count).to eq(2)
  #   puts orders.inspect
  # end

####################################################################

#   it "create_list com 3 pedidos" do
#     orders = create_list(:order, 3, description: "oi")
#     expect(orders.count).to eq(3)
#     puts orders.inspect
#   end

#####################################################################

  # it "belongs to sobrescrevendo customer" do
  #   order = create(:order, customer: Customer.new)
  #   expect(order.customer).to be_kind_of(Customer)
  # end

  # it "belong to" do
  #   order = create(:order, description: "oi")
  #   expect(order.description).to eq("oi")
  # end

  # it "belongs to" do
  #   order = create(:order)
  #   expect(order.customer).to be_kind_of(Customer)
  #   puts order.description
  #   puts order.customer
  #   puts order.customer.name
  # end

end