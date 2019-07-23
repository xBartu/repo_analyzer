require 'rails_helper'

RSpec.describe AnalysisController, type: :controller do
  context '#index' do
    before(:all) do
      Organization.create(name: 'google', github_id: '123aasd3354')
      SaveRepositoriesService.new.save
    end

    before(:each) do
      get :index
    end

    it { is_expected.to respond_with 200 }

    context 'check variable' do
      it 'most_used_languages' do
        expect(assigns('most_used_languages').count.positive?).to eq true
      end

      it 'least_used_languages' do
        expect(assigns('least_used_languages').count.positive?).to eq true
      end
    end
  end
end
