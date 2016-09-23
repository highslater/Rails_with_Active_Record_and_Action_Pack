class TodoItem < ActiveRecord::Base
  def self.completed_count
    TodoItem.where(completed: true).count
  end
end
