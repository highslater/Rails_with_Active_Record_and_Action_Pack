class User < ActiveRecord::Base
  has_one :profile, dependent: :destroy
  has_many :todo_lists, dependent: :destroy
  has_many :todo_items, through: :todo_lists, source: :todo_items
  validates :username, presence: true


  def get_completed_count()
    # self.todo_items.where(completed: "t").count
    # TodoItem.where(todo_list_id: 363).each {|t| puts t.completed}
    # TodoItem.where(todo_list_id: 363).each {|t| puts t.where(completed: true)} ?????????
    # SELECT "todo_items".completed FROM "todo_items" WHERE "todo_items"."todo_list_id" = 367;
    # SELECT COUNT(completed) FROM todo_items WHERE completed="t";
    # SELECT COUNT(completed) FROM todo_items WHERE(completed="t" AND todo_list_id=user.id)
    # todo_item.where('completed:"t" AND todo_list_id: self.id)').count
    # todo_items.where(completed: "t").count
    # todo_items.where("completed IS ?", "t").count
    todo_items.where("completed = ?", "t").count
    #return 42
  end



end
