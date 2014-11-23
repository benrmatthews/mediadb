class Charge < ActiveRecord::Base
  
attr_accessor :stripe_card_token
 
def save_with_payment
  if valid?
    customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
    self.stripe_customer_token = customer.id
    save!
  end
 
   # Handle exceptions
   rescue Stripe::APIError => e
      logger.error "Stripe Authentication error while creating user: #{e.message}"
      errors.add :base, "Our system is temporarily unable to process credit cards."
      false
end