Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLISHABLE_KEY'],
  :secret_key      => ENV['SECRET_KEY']
}

Stripe.api_key = "sk_test_Y8W3eeJ5yji65zKTizoI5wn4"
STRIPE_PUBLIC_KEY = "pk_test_L3GbXTfZeb9HKrXKX6886uY7"