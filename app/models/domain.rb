class Domain < ActiveRecord::Base
  attr_accessible :title, :description, :pdomain_delete, :pdomain
  has_attached_file :pdomain
  
  before_save :destroy_pdomain?

  def pdomain_delete
    @pdomain_delete ||= "0"
  end

  def pdomain_delete=(value)
    @pdomain_delete = value
  end

private
  def destroy_pdomain?
    self.pdomain.clear if @pdomain_delete == "1"
  end

end
