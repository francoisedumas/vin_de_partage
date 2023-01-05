class AddCoordinatesToProducers < ActiveRecord::Migration[7.0]
  def change
    add_column :producers, :latitude, :float
    add_column :producers, :longitude, :float
  end
end
