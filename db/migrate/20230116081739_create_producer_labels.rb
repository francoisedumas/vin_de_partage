class CreateProducerLabels < ActiveRecord::Migration[7.0]
  def change
    create_table :producer_labels do |t|
      t.references :label, null: false, foreign_key: true
      t.references :producer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
