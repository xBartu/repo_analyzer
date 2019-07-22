class CreateRepositories < ActiveRecord::Migration[5.2]
  def change
    create_table :repositories do |t|
      t.datetime :project_started_at
      t.string :name
      t.string :primary_language
      t.string :github_id
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
