class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]
  def show
    @db_count_products = Product.count
    @db_count_catagories = Category.count
  end
end
