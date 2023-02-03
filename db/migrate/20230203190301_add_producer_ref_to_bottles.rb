class AddProducerRefToBottles < ActiveRecord::Migration[7.0]
  def change
    add_reference :bottles, :producer, foreign_key: true
  end
end
