class StaticPagesController < ApplicationController
  def index # current homepage
  end

  def landing_page # new homepage
    @products = Product.limit(3)
    @featured_product = Product.first
  end
end
