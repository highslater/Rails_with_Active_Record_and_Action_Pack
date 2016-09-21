
$ rails new todolists
$ cd todolists/
$ bundle
$ rails generate rspec:install
--format documentation
$ rake db:migrate
$ rails generate scaffold User username:stri
ng password_digest:string
$ rails generate scaffold Profile gender:string birth_year:integer first_name:string last_name:string user:references
$ rails generate scaffold TodoList list_name:string list_due_date:date

$ rails g migration create_todo_lists_users todo_list:references user:references
