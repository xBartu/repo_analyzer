# frozen_string_literal: true

module Analysis
  class Db
    attr_reader :repositories, :ordered_languages

    def initialize(organization_name = 'google')
      organization       = Organization.find_by name: organization_name
      @repositories      = Repository.where organization: organization
      @ordered_languages = []
    end

    def order_by_project_started_at
      repositories.order 'project_started_at'
    end

    def most_used_x_programming_languages(x = 5)
      prepare_ordered_list
      length = ordered_languages.length
      ordered_languages[(length-x)..length].reverse
    end

    def least_used_x_programming_languages(x = 5)
      prepare_ordered_list
      ordered_languages[0..x]
    end

    private

    def prepare_ordered_list
      group_by_languages = repositories.group(:primary_language).count
      language_list      = group_by_languages.keys
      language_list.sort! { |a,b| group_by_languages[a] <=> group_by_languages[b] }
      @ordered_languages = language_list
    end
  end
end
