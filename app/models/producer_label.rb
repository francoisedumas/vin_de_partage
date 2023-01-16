class ProducerLabel < ApplicationRecord
  belongs_to :label
  belongs_to :producer
end
