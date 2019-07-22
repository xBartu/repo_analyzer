require 'rails_helper'

RSpec.describe AnalysisController, type: :controller do
  context '#index' do
    before(:each) do
      get :index
    end

    it { is_expected.to respond_with 200 }
  end
end
