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
    ActionMailer::Base.mail(:from => @email,
      :to => 'ambient.solace@yahoo.com',
      :subject => "A new contact form message from #{@name}",
      :body =>  @message).deliver
  end

end
