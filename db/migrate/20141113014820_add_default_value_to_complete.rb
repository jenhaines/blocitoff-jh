class AddDefaultValueToComplete < ActiveRecord::Migration
  def change
    change_column_default :todos, :complete, false
  end
end
