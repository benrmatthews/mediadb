class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :firstname
      t.string :lastname
      t.string :title
      t.string :publications
      t.string :email
      t.string :phone
      t.string :twitter
      t.text :bio
      t.boolean :verified

      t.timestamps
    end
  end
end
