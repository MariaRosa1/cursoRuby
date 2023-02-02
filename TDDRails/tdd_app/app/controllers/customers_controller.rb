class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit update destroy]

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def show
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to customers_path, notice: "Cliente cadastrado com sucesso!"
    else
      render :new
    end
  end

  def update

    if @customer.update(customer_params)
      redirect_to customers_path, notice: "Cliente atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy

    if @customer.destroy
      redirect_to customers_path, notice: "Cliente excluido com sucesso!"
    else
      render customers_path
    end
  end


  private

  def set_customer
    @customer = Customer.find(params[:id])
  end


  def customer_params
    params.require(:customer).permit(:name, :email, :phone, :smoker, :avatar)
  end

end
