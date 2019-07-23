require 'rails_helper'

RSpec.describe CsvController, type: :controller do
  context '#index' do
    before(:each) do
      get :index, format: :csv
    end

    it { is_expected.to respond_with 200 }
  end
end
