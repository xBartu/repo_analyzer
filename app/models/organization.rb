class Organization < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :github_id
end
