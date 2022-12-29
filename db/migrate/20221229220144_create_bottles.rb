class CreateBottles < ActiveRecord::Migration[7.0]
  def change
    create_table :bottles do |t|
      t.string :name
      t.string :country
      t.string :domaine_name
      t.string :producer
      t.string :appelation
      t.string :region
      t.string :color
      t.integer :year
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
