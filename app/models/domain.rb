# == Schema Information
#
# Table name: domains
#
#  id                    :integer(4)      not null, primary key
#  title                 :string(255)
#  description           :text
#  created_at            :datetime
#  updated_at            :datetime
#  pdomain_file_name     :string(255)
#  pdomain_content_type  :string(255)
#  pdomain_file_size     :integer(4)
#  pdomain_updated_at    :datetime
#  pproblem_file_name    :string(255)
#  pproblem_content_type :string(255)
#  pproblem_file_size    :integer(4)
#  pproblem_updated_at   :datetime
#  plan                  :text
#

class Domain < ActiveRecord::Base
  attr_accessible :title, :description, :pdomain_delete, :pdomain, :pproblem_delete, :pproblem, :plan
  
  belongs_to :user
  
  validates :title, :presence => true, :length => { :maximum => 50 }
  validates :description, :presence => true, :length => { :maximum => 500 }
  validates :user_id, :presence => true
  
  default_scope :order => 'domains.created_at DESC'
  
  has_attached_file :pdomain
  has_attached_file :pproblem
  
  before_save :destroy_pdomain?
  before_save :destroy_pproblem?
  

  def pdomain_delete
    @pdomain_delete ||= "0"
  end

  def pdomain_delete=(value)
    @pdomain_delete = value
  end
  
  def pproblem_delete
    @pproblem_delete ||= "0"
  end

  def pproblem_delete=(value)
    @pproblem_delete = value
  end
private
  def destroy_pdomain?
    self.pdomain.clear if @pdomain_delete == "1"
  end
  def destroy_pproblem?
    self.pproblem.clear if @pproblem_delete == "1"
  end
end
