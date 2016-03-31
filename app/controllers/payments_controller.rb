class PaymentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => @product.price_in_cents, # amount in cents, again
        :currency => "usd",
        :source => token,
        :description => params[:stripeEmail]
      )

      if charge.paid
        Order.create(product_id: @product.id, user_id: @user.id, total: charge.amount)
        Product.update(@product.id, sold_date: Date.today)
      end 

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:alert] = "Unfortunately there was an error processing your payment: #{err[:message]}"
      redirect_to product_path(@product)
    rescue Stripe::InvalidRequestError => e
      # Invalid parameters were supplied to Stripe's API
      body = e.json_body
      err = body[:error]
      flash[:alert] = "Unfortunately there was an error processing your payment: #{err[:message]}"
      redirect_to product_path(@product)
    end
  end
end
