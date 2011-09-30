class Cart < ActiveRecord::Base
  has_many :notes
  has_one :order
  belongs_to :user
  
  def total_price
    # convert to array so it doesn't try to do sum on database directly
    notes.to_a.sum(&:full_price)
  end
end

# == Schema Information
#
# Table name: carts
#
#  id           :integer         not null, primary key
#  user_id      :integer
#  purchased_at :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

