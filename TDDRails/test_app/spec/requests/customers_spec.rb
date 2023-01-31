require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "GET /customers" do
    it "Status 200" do
      get customers_path
      expect(response).to have_http_status(200)
    end

    describe "JSON gem" do

      context "sem autenticação" do
        it "index" do
          get "/customers.json"
          expect(response.body).to include_json([
            id: /\d/,  #expressão regular q aceita só números
            name: (be_kind_of String),
            email: (be_kind_of String)
          ])
        end

        it "show" do
          get "/customers/1.json"
          expect(response.body).to include_json(
            id: 1
          )
        end
      end

      context "Com autenticação" do

        before(:each) do
          member = create(:member)
          login_as(member, scope: :member)
        end

        it "create" do

          headers = { "ACCEPT" => "application/json" }

          customers_params = attributes_for(:customer)
          post "/customers.json", params: { customer: customers_params }, headers: headers

          expect(response.body).to include_json(
            id: /\d/,
            name: customers_params[:name],
            email: customers_params.fetch(:email)
          )
        end

        it "update" do

          headers = { "ACCEPT" => "application/json" }

          customer = Customer.first
          customer.name += " - ATUALIZADO"

          patch "/customers/#{customer.id}.json", params: { customer: customer.attributes }, headers: headers

          expect(response.body).to include_json(
            id: /\d/,
            name: customer.name,
            email: customer.email
          )
        end

        it "destroy" do

          headers = { "ACCEPT" => "application/json" }

          customer = Customer.first

          expect { delete "/customers/#{customer.id}.json", headers: headers}.to change(Customer, :count).by(-1)
          expect(response).to have_http_status(204)
        end
      end
    end

    context "RSPEC puro" do
      it "show " do
        get "/customers/1.json"
        response_body = JSON.parse(response.body)
        expect(response_body["id"]).to eq(1)
        expect(response_body.fetch("name")).to be_kind_of(String)
        expect(response_body.fetch("email")).to be_kind_of(String)
      end
      it "show com request_helper" do
        get "/customers/1.json"
        expect(json["id"]).to eq(1)
        expect(json.fetch("name")).to be_kind_of(String)
        expect(json.fetch("email")).to be_kind_of(String)
      end
    end

    context "JSON Schema" do
      it "validate" do
        get "/customers/1.json"
        p response.body
        expect(response).to match_json_schema("customer")
      end

    end


  end
end