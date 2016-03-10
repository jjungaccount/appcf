class SetAdminNotNullable < ActiveRecord::Migration
  def change
    change_column_null :users, :admin, false
  end
end
