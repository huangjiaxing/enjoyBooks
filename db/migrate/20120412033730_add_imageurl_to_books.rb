class AddImageurlToBooks < ActiveRecord::Migration
  def change
    add_column :books, :imageurl, :string

  end
end
