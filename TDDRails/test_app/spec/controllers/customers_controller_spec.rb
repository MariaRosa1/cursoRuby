require 'rails_helper'

RSpec.describe CustomersController, type: :controller do

  describe "Not authentication" do
    context "#index" do
      # it "responds successfuly" do
      #     get :index
      #     expect(response).to be_success
      # end

      it "responds status 200" do
        get :index
        # puts response.inspect
        expect(response).to have_http_status(200)
      end
    end

    context "#show" do
      it "responds a 302 response(not authorized)" do
        customer = create(:customer)
        get :show, params: {id: customer.id}
        expect(response).to have_http_status(302)
      end
    end
  end



  describe "Authentication" do

    before do
      @member = create(:member)
      @customer = create(:customer)
    end

    context "#create" do
      it "With valid attributes" do
        customer_params = attributes_for(:customer)
        # p customer_params
        sign_in @member
        expect{
          post :create, params: {customer: customer_params}
        }.to change(Customer, :count).by(1)
      end
    end

    context "#show" do
      it "login" do
        sign_in @member
        expect(response).to have_http_status(200)
      end

      it "login e #show" do
        sign_in @member
        get :show, params: {id: @customer.id}
        expect(response).to have_http_status(200)
      end

      it "render a :show template" do
        sign_in @member
        get :show, params: {id: @customer.id}
        expect(response).to render_template(:show)
      end
    end
  end
end
