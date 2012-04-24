class DeviseCreateHuangs < ActiveRecord::Migration
  def self.up
    create_table(:huangs) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :huangs, :email,                :unique => true
    add_index :huangs, :reset_password_token, :unique => true
    # add_index :huangs, :confirmation_token,   :unique => true
    # add_index :huangs, :unlock_token,         :unique => true
    # add_index :huangs, :authentication_token, :unique => true
  end

  def self.down
    drop_table :huangs
  end
end
