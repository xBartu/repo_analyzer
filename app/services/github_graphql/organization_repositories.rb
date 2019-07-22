module GithubGraphql
  class OrganizationRepositories < Base
    def repositories_of(organizaton_name = 'google')
      repos = []
      has_next = true
      end_cursor = ''

      while has_next
        information = fetch_repositories_for(end_cursor, organizaton_name).original_hash['data']['organization']['repositories']
        sub_repos = information['nodes']
        repos.concat sub_repos if sub_repos.present?
        has_next = false

        if information['pageInfo']['hasNextPage']
          has_next = true
          end_cursor = information['pageInfo']['endCursor']
        end
      end

      repos
    end

    private

    def fetch_repositories_for(end_cursor, organizaton_name)
      client.query do
        query do
          organization(login: organizaton_name) do
            id
            name
            repositories(first: 100, after: end_cursor) do
              pageInfo do
                hasNextPage
                endCursor
              end
              nodes do
                id
                name
                createdAt
                primaryLanguage do
                  name
                end
              end
              pageInfo do
                endCursor
              end
            end
          end
        end
      end
    end
  end
end
