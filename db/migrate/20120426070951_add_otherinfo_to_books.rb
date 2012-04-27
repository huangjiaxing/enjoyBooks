class AddOtherinfoToBooks < ActiveRecord::Migration
  def change
    add_column :books, :otherinfo, :string

  end
end
