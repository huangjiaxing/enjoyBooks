class AddHeadToUsers < ActiveRecord::Migration
  def change
    add_column :users, :head, :string

  end
end
