class Note < ActiveRecord::Base
  belongs_to :catalog
  
  after_initialize :init  # initializes new notes with default values
  
  validates_presence_of :body, :catalog, :return_name, :return_street, :return_city,
                        :return_state, :return_zip, :dest_name, :dest_street, :dest_city, :dest_state, :dest_zip
   
  attr_accessible :body, :catalog_id, :status, :letter, :envelope, :document_content, :envelope_content,
                  :return_name, :return_street, :return_city,
                  :return_state, :return_zip, :dest_name, :dest_street, :dest_city, :dest_state, :dest_zip
                  
  before_save :create_envelope, :create_letter
  
  has_attached_file :letter,
                    :styles => {:thumb => "100x100#"},
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
# uncomment for secured storage on s3
#                    :s3_permissions => :private,
                    :path => ":id/:style-:attachment-:normalized_filename",
                    :url => ":id/:style-:attachment-:normalized_filename"
  
  has_attached_file :envelope,
                    :styles => {:thumb => "100x150"},
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
# uncomment for secured storage on s3
#                    :s3_permissions => :private,
                    :path => ":id/:style-:attachment-:normalized_filename",
                    :url => ":id/:style-:attachment-:normalized_filename"
                    
  Paperclip.interpolates :normalized_filename do |attachment, style|
    attachment.instance.normalized_filename
  end
  
  def return_city_state_zip
    "#{self.return_city}, #{self.return_state} #{self.return_zip}"
  end

  def dest_city_state_zip
    "#{self.dest_city}, #{self.dest_state} #{self.dest_zip}"
  end
  
  def normalized_filename
    "#{self.return_name.gsub(/\s+/,"_")}-#{self.dest_name.gsub(/\s+/,"_")}.pdf"
  end  
  
  def create_letter
    # if we don't have content set yet, then just return
    return true if self.document_content.nil?

    logger.debug "create_letter: creating #{self.normalized_filename}"
    DocRaptor.create(  :document_content => self.document_content, 
                       :document_type    => 'pdf',
                       :name             => self.normalized_filename,
                       :prince_options   => {
                         :media => :screen, 
                         :baseurl => 'http://carriemail-staging.heroku.com'
                         },
                       :tag              => 'Carriemail',
                       :test             => true) do |file, response|

        logger.debug "create_letter: returned status code #{response.code}"
        if response.code == 200
          self.letter = file
        else
          e = Hash.from_xml(response.body)
          
          e.each do |key, value|
            self.errors.add(key, value)
          end #each do
        end #if
    end #create
    self.errors.count == 0
  end

  def create_envelope
    # if we don't have content set yet, then just return
    return true if self.envelope_content.nil?

    logger.debug "create_envelope: creating envelope-#{self.normalized_filename}"
    DocRaptor.create(  :document_content => self.envelope_content, 
                       :document_type    => 'pdf',
                       :name             => "envelope-#{self.normalized_filename}",
                       :prince_options   => {
                         :media => :screen, 
                         :baseurl => 'http://carriemail-staging.heroku.com'
                         },
                       :tag              => 'Carriemail',
                       :test             => true) do |file, response|

        logger.debug "create_envelope: returned status code #{response.code}"
        if response.code == 200
          self.envelope = file
        else
          e = Hash.from_xml(response.body)
          
          e.each do |key, value|
            self.errors.add(key, value)
          end #each do
        end #if
    end #create
    self.errors.count == 0
  end

      
  def is_printing?
    self.status == 2 || self.status == 3
  end
  
  def status_description
    @statuses = { 
      0 => 'New',
      1 => 'Waiting',
      2 => 'Printing',
      3 => 'In Delivery',
      4 => 'Recalled',
      }
      
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
#  id                    :integer         not null, primary key
#  catalog_id            :integer         not null
#  body                  :text
#  created_at            :datetime
#  updated_at            :datetime
#  status                :integer
#  letter_file_name      :string(255)
#  letter_content_type   :string(255)
#  letter_file_size      :integer
#  document_content      :text
#  return_name           :string(255)
#  return_street         :string(255)
#  return_addr_line2     :string(255)
#  return_city           :string(255)
#  return_state          :string(255)
#  return_zip            :string(255)
#  dest_name             :string(255)
#  dest_street           :string(255)
#  dest_addr_line2       :string(255)
#  dest_city             :string(255)
#  dest_state            :string(255)
#  dest_zip              :string(255)
#  envelope_file_name    :string(255)
#  envelope_content_type :string(255)
#  envelope_file_size    :integer
#  envelope_content      :text
#

