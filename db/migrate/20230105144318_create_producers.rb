class CreateProducers < ActiveRecord::Migration[7.0]
  def change
    create_table :producers do |t|
      t.string :name
      t.string :domaine_name
      t.string :address
      t.string :region
      t.string :cover

      t.timestamps
    end
  end
end
