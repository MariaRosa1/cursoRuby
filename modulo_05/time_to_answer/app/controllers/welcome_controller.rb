class WelcomeController < ApplicationController
  http_basic_authenticate_with name: "maria", password: "12"
  def index
  end
end
