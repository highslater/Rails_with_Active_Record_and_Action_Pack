class User < ActiveRecord::Base
  has_one :profile, dependent: :destroy
  has_many :todo_lists, dependent: :destroy
  has_many :todo_items, through: :todo_lists, source: :todo_items, dependent: :destroy
  validates :username, presence: true

  def get_completed_count()
    puts "Will return the number of completed todo_items for a specified user"
    # TodoItem.where(todo_list_id: 363).each {|t| puts t.completed}
    # TodoItem.where(todo_list_id: 363).each {|t| puts t.where(completed: true)} ?????????
    # SELECT "todo_items".completed FROM "todo_items" WHERE "todo_items"."todo_list_id" = 367;
  end


end
