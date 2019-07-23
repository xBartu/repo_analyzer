# README

## How to install

Please follow the order as follow:

Before starting, please define your api key in a enviorement variable.
` export GITHUB_API_KEY=xxx-xxx-x-xx`



```
git clone git@github.com:xBartu/repo_analyzer.git 
bundle
rake db:create
rake db:migrate
rake db:seed
rake github_task:update_google_repositories
```

Now you can run your service!

## Further Steps

1- Currently, we do not have proper tests. Some tests are using the real http!

2- As google and others opensource something new frequently, you need to run 'rake github_task:update_google_repositories' command or newly introduced rake commands. To avoid, you can use background task quest like sidekiq.

