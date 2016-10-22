class AddTypeColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :type, :string, after: :email
  end
end
