# frozen_string_literal: true

class AnalysisController < ApplicationController
  def index
    service = Analysis::Db.new 'google'

    @most_used_languages  = service.most_used_x_programming_languages 5
    @least_used_languages = service.least_used_x_programming_languages 5
  end
end
