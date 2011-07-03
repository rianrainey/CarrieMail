class Recipient < ActiveRecord::Base
  has_many :notes
  belongs_to :user
  
  validates_presence_of :first_name, :last_name, :street, :city, :state, :zip
  # email and addr_line2 are intentionally left as optional
  
  def name
    "#{first_name} #{last_name}"
  end
  
end

# == Schema Information
#
# Table name: recipients
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  note_id    :integer
#  first_name :string(255)
#  last_name  :string(255)
#  street     :string(255)
#  addr_line2 :string(255)
#  city       :string(255)
#  state      :string(255)
#  zip        :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

