class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :title
      t.string :mediatype
      t.string :category
      t.string :frequency
      t.string :readership
      t.string :address
      t.string :email
      t.string :phone
      t.string :twitter
      t.text :bio
      t.boolean :verified

      t.timestamps
    end
  end
end
