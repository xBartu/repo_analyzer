# frozen_string_literal: true

class GithubGraphqlRepoAdapterService
  def adapted_object(repository_object, graphql_hash)
    raise 'Plase send a Repository object' unless repository_object.is_a? Repository

    repository_object.name               = graphql_hash['name']
    repository_object.primary_language   = graphql_hash['primaryLanguage'].try(:[], 'name')
    repository_object.project_started_at = DateTime.parse graphql_hash['createdAt']

    repository_object
  end
end
