class ChangeRoleDefalutToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role, :string, null: false, default: "user"
    add_column :users, :point, :integer, null: false, default: 0
  end
end
