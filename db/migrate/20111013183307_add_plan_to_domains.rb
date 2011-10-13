class AddPlanToDomains < ActiveRecord::Migration
  def self.up
    add_column :domains, :plan, :text
  end

  def self.down
    remove_column :domains, :plan
  end
end
