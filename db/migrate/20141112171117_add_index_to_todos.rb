class AddIndexToTodos < ActiveRecord::Migration
  def change
    add_index :todos, :complete
  end
end
