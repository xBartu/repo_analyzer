namespace :github_task do
  desc 'The github tasks are defined. You can check them.'
  task update_google_repositories: :environment do
    SaveRepositoriesService.new.save
  end
end
