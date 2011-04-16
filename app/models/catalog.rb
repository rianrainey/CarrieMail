class Catalog < ActiveRecord::Base
  belongs_to :user
  has_many :notes, :order => "created_at DESC"
end

# == Schema Information
#
# Table name: catalogs
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

