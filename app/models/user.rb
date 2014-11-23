class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  
  belongs_to :plan  
  
  validates_presence_of :plan_id

  attr_accessor :stripe_card_token
  
  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end

  def cancel_user_plan(customer_id)
    customer = Stripe::Customer.retrieve("#{customer_id}")
    customer.cancel_subscription
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while deleting customer: #{e.message}"
    errors.add :base, "No active subscriptions for user."
    false
  end
  # validates :username, presence: true, length: { maximum: 50 }
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  def set_default_role
    self.role ||= :user
  end  
end