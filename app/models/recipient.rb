class Recipient < ActiveRecord::Base
  has_many :notes
  belongs_to :user
  has_attached_file :photo,
                    :styles => {
                      :thumb => "100x100#",
                      :small => "250x250"
                    },
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => ":attachment/:id/:style.:extension",
                    :default_url => "/images/CarriemailBasketLogo-100x100.png"
                    
  before_destroy :ensure_no_notes_were_sent_to_this_recicipient
  
  validates_presence_of :first_name, :last_name, :street, :city, :state, :zip
  # email and addr_line2 are intentionally left as optional
  
  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
  
  def full_address
    "#{street}, #{city}, #{state} #{zip}"
  end
  
  private
  
  def ensure_no_notes_were_sent_to_this_recicipient
    if notes.empty?
      return true
    else
      errors.add(:base, 'This contact has active notes and cannot be deleted at this time')
    end
  end
  
end


# == Schema Information
#
# Table name: recipients
#
#  id                 :integer         not null, primary key
#  user_id            :integer
#  note_id            :integer
#  first_name         :string(255)
#  last_name          :string(255)
#  street             :string(255)
#  addr_line2         :string(255)
#  city               :string(255)
#  state              :string(255)
#  zip                :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

