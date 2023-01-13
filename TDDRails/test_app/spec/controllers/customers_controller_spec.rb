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
        expect(response).to have_http_status(200)
        # puts response.inspect
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

    it "Flash notice" do
      customer_params = attributes_for(:customer)
      sign_in @member
      post :create, params: {customer: customer_params}
      expect(flash[:notice]).to match(/successfully created/)
    end

    context "Shoulda matchers" do
      it "routes" do
        is_expected.to route(:get, '/customers').to(action: :index)
      end

      describe "testando index" do
        before { get :index }
        it { is_expected.to render_template('index') }
      end
    end

    context "#create" do

      it "content-type Json" do
        customer_params = attributes_for(:customer)
        sign_in @member
        post :create, format: :json, params: {customer: customer_params}
        expect(response.content_type).to eq('application/json')
      end

      it "With valid attributes" do
        customer_params = attributes_for(:customer)
        sign_in @member
        expect{
          post :create, params: {customer: customer_params}
        }.to change(Customer, :count).by(1)
        # p customer_params
      end

      it "With invalid attributes" do
        customer_params = attributes_for(:customer, address: nil)
        sign_in @member
        expect{
          post :create, params: {customer: customer_params}
        }.not_to change(Customer, :count)
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
