# README

## Assumptions

The program assumes the followings

```
1- Most used languages and least used ones are different. There is no check for that but it may be case if an organization uses few languages.
2- Used languages analysis just primary language. If the repo contains other languages js, asm or php.., we count one of them from githubs primary language.
3- If Organization contains more than one most or least language, we picks some of them in no particular order. The order depends on the analysis service. Check the code. 


```

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

## usage

`domain/analysis` - You can see google's most and least used programming language to open source.

`domain/csv.csv` - You can download the list of repositories in a csv format.

`domain/csv` - You can see the list of repositories in a csv format.

## Further Steps

1- Currently, we do not have proper tests. Some tests are using the real http!

2- As google and others opensource something new frequently, you need to run 'rake github_task:update_google_repositories' command or newly introduced rake commands. To avoid, you can use background task quest like sidekiq.

