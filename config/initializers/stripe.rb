if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_OUpD2jOULM80wAk5VMraQIfV',
    :secret_key => 'sk_test_UtzlTfMRtVa1FJTLkRIz6SQH'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]