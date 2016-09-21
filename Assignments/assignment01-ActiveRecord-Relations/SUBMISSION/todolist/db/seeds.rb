
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
