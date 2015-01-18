class AddPlanToUser < ActiveRecord::Migration
  def change
    add_column :users, :plan_id, :integer
    add_column :users, :stripe_card_token, :integer
  end
end
