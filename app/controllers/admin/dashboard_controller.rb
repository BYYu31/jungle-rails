class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_BASIC_AUTHENTICATION_USERNAME"], password: ENV["HTTP_BASIC_AUTHENTICATION_PASSWORD"]
  before_action :authorize
  def show
    @product_count = Product.count
    @category_count = Category.count
  end
end
