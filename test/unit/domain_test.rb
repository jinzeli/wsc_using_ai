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

require 'test_helper'

class DomainTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Domain.new.valid?
  end
end
