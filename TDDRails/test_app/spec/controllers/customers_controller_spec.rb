require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  # it "responds successfuly" do
  #   get :index
  #   expect(response).to be_success
  # end

  it "responds status 200" do
    get :index
    # puts response.inspect
    expect(response).to have_http_status(200)
  end

end
