class Note < ActiveRecord::Base
  belongs_to :catalog
  belongs_to :recipient

  after_initialize :init  # initializes new notes with default values
  
  validates_presence_of :title, :body, :catalog, :recipient
  
  attr_accessible :title, :body, :recipient_id, :catalog_id, :status
  
  def status_description
    @statuses = { 0 => 'New',
      1=>'Uploaded',
      2=>'Printed',
      3=>'Mailed'}
      
    @statuses[status]
  end
  
  # similar to constructor, initializes values for new models
  def init
    self.status ||= 0
  end
  
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
#  status       :integer
#

