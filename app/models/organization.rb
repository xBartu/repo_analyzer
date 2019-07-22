class Organization < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :url
  validates_uniqueness_of :url
end
