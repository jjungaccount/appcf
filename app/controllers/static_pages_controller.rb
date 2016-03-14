class StaticPagesController < ApplicationController
  def index # current homepage
  end

  def landing_page # new homepage
    @products = Product.limit(3)
    @featured_product = Product.first
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end

end
