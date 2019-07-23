# frozen_string_literal: true

class CsvController < ApplicationController
  def index
    service = Analysis::Db.new 'google'
    repositories = service.order_by_project_started_at
    attributes = %w[name primary_language project_started_at]
    respond_to do |format|
      format.csv { send_data repositories.to_csv(attributes) }
    end
  end
end
