class StaticPagesController < ApplicationController
  def index # current homepage
  end

  def landing_page # new homepage
    @featured_product = Product.first
  end
end
