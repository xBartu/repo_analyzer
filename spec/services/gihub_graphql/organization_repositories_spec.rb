RSpec.describe GithubGraphql::OrganizationRepositories do
  let!(:service) { GithubGraphql::OrganizationRepositories.new }

  it 'fetch the repositories of google' do
    expect(service.repositories_of('google').count.positive?).to eq true
  end
end
