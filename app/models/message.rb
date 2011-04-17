class Message < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :title
  validates_presence_of :body
  
end

# == Schema Information
#
# Table name: messages
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  title      :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

