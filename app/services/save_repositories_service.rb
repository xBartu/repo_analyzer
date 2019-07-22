# frozen_string_literal: true

# In use on a rake task
class SaveRepositoriesService
  attr_reader :repository_service, :organization, :adapter

  def initialize(organization_name = 'google',
                 adapter_service = GithubGraphqlRepoAdapterService.new,
                 service = GithubGraphql::OrganizationRepositories.new)
    @repository_service = service
    @organization       = Organization.find_by name: organization_name
    @adapter            = adapter_service
  end

  def save
    # create a error class here
    raise 'Organization is not created, please create it first' unless organization.present?

    repository_service.repositories_of(organization.name).each do |repo|
      sub_repo = Repository.find_or_initialize_by(github_id: repo['id'])

      sub_repo              = adapter.adapted_object(sub_repo, repo)
      sub_repo.organization = organization

      sub_repo.save
    end
  end
end
