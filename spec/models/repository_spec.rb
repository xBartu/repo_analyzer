require 'rails_helper'

RSpec.describe Repository, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :github_id }
  it { is_expected.to validate_presence_of :project_started_at }
end
