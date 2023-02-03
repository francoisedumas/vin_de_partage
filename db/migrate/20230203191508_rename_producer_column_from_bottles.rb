class RenameProducerColumnFromBottles < ActiveRecord::Migration[7.0]
  def change
    rename_column :bottles, :producer, :producer_name
  end
end
