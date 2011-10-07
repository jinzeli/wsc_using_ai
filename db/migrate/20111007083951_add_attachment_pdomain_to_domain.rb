class AddAttachmentPdomainToDomain < ActiveRecord::Migration
  def self.up
    add_column :domains, :pdomain_file_name, :string
    add_column :domains, :pdomain_content_type, :string
    add_column :domains, :pdomain_file_size, :integer
    add_column :domains, :pdomain_updated_at, :datetime
  end

  def self.down
    remove_column :domains, :pdomain_file_name
    remove_column :domains, :pdomain_content_type
    remove_column :domains, :pdomain_file_size
    remove_column :domains, :pdomain_updated_at
  end
end
