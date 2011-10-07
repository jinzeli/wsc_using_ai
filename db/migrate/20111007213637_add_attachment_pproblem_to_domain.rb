class AddAttachmentPproblemToDomain < ActiveRecord::Migration
  def self.up
    add_column :domains, :pproblem_file_name, :string
    add_column :domains, :pproblem_content_type, :string
    add_column :domains, :pproblem_file_size, :integer
    add_column :domains, :pproblem_updated_at, :datetime
  end

  def self.down
    remove_column :domains, :pproblem_file_name
    remove_column :domains, :pproblem_content_type
    remove_column :domains, :pproblem_file_size
    remove_column :domains, :pproblem_updated_at
  end
end
