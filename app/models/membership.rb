class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  validate :only_one_membership

  def only_one_membership
  end
  
end
