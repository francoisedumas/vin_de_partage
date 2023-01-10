class AddWebsiteToProducers < ActiveRecord::Migration[7.0]
  def change
    add_column :producers, :website, :string
    add_reference :producers, :user, index: true, foreign_key: true
  end
end
