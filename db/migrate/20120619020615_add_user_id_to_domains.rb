class AddUserIdToDomains < ActiveRecord::Migration
  def self.up
    add_column :domains, :user_id, :integer
    add_index :domains, :user_id
  end

  def self.down
    remove_column :domains, :user_id
  end
end
