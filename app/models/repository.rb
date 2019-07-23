class Repository < ApplicationRecord
  belongs_to :organization

  validates_presence_of :name
  validates_presence_of :github_id
  validates_presence_of :project_started_at

  def self.to_csv(attributes, service: CSV)
    service.generate(headers: true) do |csv|
      csv << attributes

      all.each do |repository|
        csv << attributes.map { |attr| repository.send(attr) }
      end
    end
  end
end
