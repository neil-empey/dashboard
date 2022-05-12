class Device < ApplicationRecord
  validates :name, :state, :presence => true
end
