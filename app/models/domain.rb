class Domain < ActiveRecord::Base
  attr_accessible :title, :description, :pdomain_delete, :pdomain, :pproblem_delete, :pproblem
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
