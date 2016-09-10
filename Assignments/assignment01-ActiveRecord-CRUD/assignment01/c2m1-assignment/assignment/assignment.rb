require_relative '../config/environment'

class Assignment

  # Create
  def create_user(params)
    @user = User.create(username: params[:username],
                        password_digest: params[:password_digest])
  end

  def create_todolist(params)
    @todolist = TodoList.create(list_name: params[:name],
                                list_due_date: params[:due_date])
  end


  # Read
  def find_allusers(offset, limit)
    @all_users = User.all().order(updated_at: :asc).limit(limit).offset(offset)
  end

  def find_alllists(offset, limit)
    @all_todoLists = TodoList.all().order(list_due_date: :desc).limit(limit).offset(offset)
  end

  def find_user_byname(username)
    @user_by_name = User.where(username: username)
  end

  def find_todolist_byname(name)
    @todo_list_by_name = TodoList.where(list_name: name)
  end

  def get_user_byid(id)
    @user_by_id = User.find_by(id: id)
  end

  def get_todolist_byid(id)
    @todo_list_id = TodoList.find_by(id: id)
  end


  # Update
  def update_password(id, password_digest)
    get_user_byid(id).update(password_digest:  password_digest)
  end

  def update_listname(id, name)
    get_todolist_byid(id).update(list_name:  name)
  end


  # Delete
  def delete_user(id)
    get_user_byid(id).destroy
  end

  def delete_todolist(id)
    get_todolist_byid(id).destroy
  end
end
