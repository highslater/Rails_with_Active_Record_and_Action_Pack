```shell
$ rails new todolists
$ cd todolists/
$ bundle
$ rails generate rspec:install
```
--format documentation
```shell
$ rspec -e rq01
Assignment
  rq01
    Generate Rails application
      must have top level structure of a rails application
1 example, 0 failures

$ rails generate model User username:string password_digest:string
Running via Spring preloader in process 6852
      invoke  active_record
      create    db/migrate/20160920191225_create_users.rb
      create    app/models/user.rb
      invoke    test_unit
      create      test/models/user_test.rb
      create      test/fixtures/users.yml

$ rake db:migrate
== 20160920191225 CreateUsers: migrating ======================================
-- create_table(:users)
   -> 0.0023s
== 20160920191225 CreateUsers: migrated (0.0026s) =============================

$ rspec -e rq02
Assignment
  rq02
    User Model:
      User class created
      User database structure in place
      User class properties added
        should respond to #username
        should respond to #password_digest
        should respond to #created_at
        should respond to #updated_at
6 examples, 0 failures

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.timestamps null: false
    end
  end
end

class User < ActiveRecord::Base
  has_one :profile
  has_many :todo_lists
end

$ rails generate model Profile gender:string birth_year:integer first_name:string last_name:string user:references
Running via Spring preloader in process 7142
      invoke  active_record
      create    db/migrate/20160920191900_create_profiles.rb
      create    app/models/profile.rb
      invoke    test_unit
      create      test/models/profile_test.rb
      create      test/fixtures/profiles.yml

$ rake db:migrate
== 20160920191900 CreateProfiles: migrating ===================================
-- create_table(:profiles)
   -> 0.0026s
== 20160920191900 CreateProfiles: migrated (0.0027s) ==========================

$ rspec -e rq03
Assignment
  rq03
    Profile Model:
      Profile class created
      Profile database structure in place
      Profile 1:1 belongs_to relationship to User in place
      User 1:1 has_one relationship to Profile in place
      Profile class properties added
        should respond to #gender
        should respond to #birth_year
        should respond to #first_name
        should respond to #last_name
        should respond to #user
        should respond to #created_at
        should respond to #updated_at
11 examples, 0 failures
```

```ruby
class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :gender
      t.integer :birth_year
      t.string :first_name
      t.string :last_name
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end

class Profile < ActiveRecord::Base
  belongs_to :user
end
```

```shell
$ rails generate model TodoList list_name:string list_due_date:date
Running via Spring preloader in process 8157
      invoke  active_record
      create    db/migrate/20160920192554_create_todo_lists.rb
      create    app/models/todo_list.rb
      invoke    test_unit
      create      test/models/todo_list_test.rb
      create      test/fixtures/todo_lists.yml

$ rake db:migrate
== 20160920192554 CreateTodoLists: migrating ==================================
-- create_table(:todo_lists)
   -> 0.0017s
== 20160920192554 CreateTodoLists: migrated (0.0018s) =========================

$ rspec -e rq04
Assignment
  rq04
    TodoList database structure in place
    TodoList Model
      TodoList class
    TodoList class properties added
      should respond to #list_due_date
      should respond to #list_name
      should respond to #created_at
      should respond to #updated_at
6 examples, 0 failures
```

```ruby
class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
      t.string :list_name
      t.date :list_due_date
      t.timestamps null: false
    end
  end
end

class TodoList < ActiveRecord::Base
  belongs_to :user
  has_many :todo_items, dependent: :destroy
end

```

```shell
$ rails generate migration AddUserToTodoList user:references
Running via Spring preloader in process 8968
      invoke  active_record
      create    db/migrate/20160920193948_add_user_to_todo_list.rb

$ rake db:migrate
== 20160920193948 AddUserToTodoList: migrating ================================
-- add_reference(:todo_lists, :user, {:index=>true, :foreign_key=>true})
   -> 0.0018s
== 20160920193948 AddUserToTodoList: migrated (0.0019s) =======================

$ rspec -e rq05
Assignment
  rq05
    TodoList has a many:1 belongs_to relationship with User
    User has a 1:many has_many relationship with TodoList
2 examples, 0 failures
```

```ruby
class AddUserToTodoList < ActiveRecord::Migration
  def change
    add_reference :todo_lists, :user, index: true, foreign_key: true
  end
end
```

```shell
$ rails generate model TodoItem due_date:date title:string description:text completed:boolean todo_list:references
Running via Spring preloader in process 10488
      invoke  active_record
      create    db/migrate/20160920194813_create_todo_items.rb
      create    app/models/todo_item.rb
      invoke    test_unit
      create      test/models/todo_item_test.rb
      create      test/fixtures/todo_items.yml

$ rake db:migrate
== 20160920194813 CreateTodoItems: migrating ==================================
-- create_table(:todo_items)
   -> 0.0027s
== 20160920194813 CreateTodoItems: migrated (0.0028s) =========================

$ rspec -e rq06
Assignment
  rq06
    TodoItem database structure in place
    TodoItem has a many:1 belongs_to relationship with TodoList
    TodoList has a 1:many has_many relationship with TodoItem
    TodoItem will be destroyed when TodoList deleted
    TodoItem Model
      TodoItem class
    TodoItem class properties added
      should respond to #due_date
      should respond to #title
      should respond to #completed
      should respond to #description
      should respond to #created_at
      should respond to #updated_at
11 examples, 0 failures
```

```ruby
class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.date :due_date
      t.string :title
      t.text :description
      t.boolean :completed
      t.references :todo_list, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end

class TodoItem < ActiveRecord::Base
  belongs_to :todo_list
end
```

```shell
$ rake db:migrate

$ rspec -e rq07
All examples were filtered out
0 examples, 0 failures
```

```ruby
class User < ActiveRecord::Base
  has_one :profile
  has_many :todo_lists
  has_many :todo_items, through: :todo_lists, source: :todo_items
end
```

```shell
$ rspec -e rq08
Assignment
  rq08
    User has a 1:many relationship with TodoItem
    User has a 1:many relationship with TodoItem through TodoList
2 examples, 0 failures
```


```ruby
User.destroy_all
Profile.destroy_all
TodoList.destroy_all
TodoItem.destroy_all

u1 = User.create( username: "Fiorina", password_digest: "carly")
p1 = Profile.create(gender: "female", birth_year: 1954, first_name: "Carly", last_name: "Fiorina")
u1.profile = p1
td1 = TodoList.create(list_name: "fiorinas_list", list_due_date: Date.today + 1.year, :user_id=>u1.id)
TodoItem.create(due_date: Date.today + 1.year , title: "an arbitrary title", description: "an arbitrary description", todo_list_id: td1.id, completed: true)
TodoItem.create(due_date: Date.today + 1.year , title: "an arbitrary title", description: "an arbitrary description", todo_list_id: td1.id, completed: false)
TodoItem.create(due_date: Date.today + 1.year , title: "an arbitrary title", description: "an arbitrary description", todo_list_id: td1.id, completed: true)
TodoItem.create(due_date: Date.today + 1.year , title: "an arbitrary title", description: "an arbitrary description", todo_list_id: td1.id, completed: false)
TodoItem.create(due_date: Date.today + 1.year , title: "an arbitrary title", description: "an arbitrary description", todo_list_id: td1.id, completed: true)

u2 = User.create( username: "Trump", password_digest: "donald")
p2 = Profile.create(gender: "male", birth_year: 1946, first_name: "Donald", last_name: "Trump")
u2.profile = p2
td2 = TodoList.create(list_name: "donalds_list", list_due_date: Date.today + 1.year, :user_id=>u2.id)
TodoItem.create(due_date: Date.today + 1.year , title: "an arbitrary title", description: "an arbitrary description", todo_list_id: td2.id, completed: true)
TodoItem.create(due_date: Date.today + 1.year , title: "an arbitrary title", description: "an arbitrary description", todo_list_id: td2.id, completed: false)
TodoItem.create(due_date: Date.today + 1.year , title: "an arbitrary title", description: "an arbitrary description", todo_list_id: td2.id, completed: true)
TodoItem.create(due_date: Date.today + 1.year , title: "an arbitrary title", description: "an arbitrary description", todo_list_id: td2.id, completed: false)
TodoItem.create(due_date: Date.today + 1.year , title: "an arbitrary title", description: "an arbitrary description", todo_list_id: td2.id, completed: true)

u3 = User.create( username: "Carson", password_digest: "ben")
p3 = Profile.create(gender: "male", birth_year: 1951, first_name: "Ben", last_name: "Carson")
u3.profile = p3
td3 = TodoList.create(list_name: "carsons_list", list_due_date: Date.today + 1.year, :user_id=>u3.id)
TodoItem.create(due_date: Date.today + 1.year , title: "an arbitrary title", description: "an arbitrary description", todo_list_id: td3.id, completed: true)
TodoItem.create(due_date: Date.today + 1.year , title: "an arbitrary title", description: "an arbitrary description", todo_list_id: td3.id, completed: false)
TodoItem.create(due_date: Date.today + 1.year , title: "an arbitrary title", description: "an arbitrary description", todo_list_id: td3.id, completed: true)
TodoItem.create(due_date: Date.today + 1.year , title: "an arbitrary title", description: "an arbitrary description", todo_list_id: td3.id, completed: false)
TodoItem.create(due_date: Date.today + 1.year , title: "an arbitrary title", description: "an arbitrary description", todo_list_id: td3.id, completed: true)

u4 = User.create( username: "Clinton", password_digest: "hillary")
p4 = Profile.create(gender: "female", birth_year: 1947, first_name: "Hillary", last_name: "Clinton")
u4.profile = p4
td4 = TodoList.create(list_name: "hillarys_list", list_due_date: Date.today + 1.year, :user_id=>u4.id)
TodoItem.create(due_date: Date.today + 1.year , title: "an arbitrary title", description: "an arbitrary description", todo_list_id: td4.id, completed: true)
TodoItem.create(due_date: Date.today + 1.year , title: "an arbitrary title", description: "an arbitrary description", todo_list_id: td4.id, completed: false)
TodoItem.create(due_date: Date.today + 1.year , title: "an arbitrary title", description: "an arbitrary description", todo_list_id: td4.id, completed: true)
TodoItem.create(due_date: Date.today + 1.year , title: "an arbitrary title", description: "an arbitrary description", todo_list_id: td4.id, completed: false)
TodoItem.create(due_date: Date.today + 1.year , title: "an arbitrary title", description: "an arbitrary description", todo_list_id: td4.id, completed: true)
```



```text 
$ rspec -e rq09
Assignment
  rq09
    check seed file
      has a file for seeding the database
      must have Users with lastnames for usernames as directed in assignment
      must have Profiles set up for each user with the given data
      must have TodoList set up as directed
      must have TodoItems set up as directed
5 examples, 0 failures
```


```ruby
class TodoList < ActiveRecord::Base
  belongs_to :user
  has_many :todo_items, dependent: :destroy
  default_scope {order :list_due_date}
end

class TodoItem < ActiveRecord::Base
  belongs_to :todo_list
  default_scope {order :due_date}
end
```


```shell
$ rspec -e rq10
Assignment
  rq10
    Default scope on TodoItem should result in collection in ascending order by due_date
    Default scope on TodoList should result in collection in ascending order by list_due_date
2 examples, 0 failures
```


```ruby
class User < ActiveRecord::Base
  has_one :profile, dependent: :destroy
  has_many :todo_lists, dependent: :destroy
  has_many :todo_items, through: :todo_lists, source: :todo_items
  validates :username, presence: true
end

class Profile < ActiveRecord::Base
  belongs_to :user
  validates :gender, inclusion: {in: %w(male female)}
  validate :no_boy_named_Sue
  validate :first_last_nil
  def first_last_nil
    if first_name.nil? and last_name.nil?
      errors.add(:base, 'first and last cannot both be nil')
    end
  end
  def no_boy_named_Sue
    if gender == "male" and first_name == "Sue"
      errors.add(:gender, 'A boy cannot be named "Sue"')
    end
  end
end
```


```shell
$ rspec -e rq11
Assignment
  rq11
    Validators:
      does not allow a User without a username
      does not allow a Profile with a null first and last name
      allows a Profile with a null first name when last name present
      allows a Profile with a null last name when first name present
      does not allow a Profile with a gender other than male or female
      does not allow a boy named Sue
      allows a Profile with gender male
      allows a Profile with gender female
8 examples, 0 failures

$ rspec -e rq12
Assignment
  check database operations
    rq12
      Cascading delete is represented in model dependencies
      User delete must cascade delete to Profile, TodoList and TodoItems
2 examples, 0 failures
```
