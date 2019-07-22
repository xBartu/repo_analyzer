# frozen_string_literal: true

module GithubGraphql
  class Base
    attr_reader :client

    def initialize(args = {})
      args = default_args.merge(args).with_indifferent_access
      @client = Graphlient::Client.new(args[:api_url], headers: { 'Authorization' => "Bearer #{args[:api_key]}" })
      post_initilazition
    end

    def post_initilazition; end

    private

    def default_args
      {
        api_url: 'https://api.github.com/graphql',
        api_key: ENV['GITHUB_API_KEY']
      }
    end
  end
end
