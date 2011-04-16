class Note < ActiveRecord::Base
  belongs_to :catalog
  
  validates_presence_of :title, :body, :catalog
  
end

# == Schema Information
#
# Table name: notes
#
#  id           :integer         not null, primary key
#  catalog_id   :integer
#  title        :string(255)
#  body         :text
#  recipient_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

