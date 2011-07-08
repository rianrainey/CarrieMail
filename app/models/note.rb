class Note < ActiveRecord::Base
  belongs_to :catalog
  belongs_to :recipient

  # required for ActiveModel::Errors dependency
  #extend ActiveModel::Naming
  
  after_initialize :init  # initializes new notes with default values
  
  validates_presence_of :title, :body, :catalog, :recipient  
  attr_accessible :title, :body, :recipient_id, :catalog_id, :status, :pdfdoc, :document_content
  
  has_attached_file :pdfdoc,
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :s3_permissions => :private,
                    :path => ":attachment/:id/:normalized_filename",
                    :url => ":attachment/:id/:normalized_filename"
  
  Paperclip.interpolates :normalized_filename do |attachment, style|
    attachment.instance.normalized_filename
  end
  
  def normalized_filename
    "#{self.title}-#{self.recipient_id}.pdf"
  end  
  
  before_save :create_pdfdoc
  
  def create_pdfdoc
      DocRaptor.create(  :document_content => self.document_content, 
                         :document_type    => 'pdf',
                         :name             => self.title,
                         :test             => true) do |file, response|

          if response.code == 200
            self.pdfdoc = file
          else
            e = Hash.from_xml(response.body)
            
            e.each do |key, value|
              self.errors.add(key, value)
            end #each do
          end #if
      end #create

      self.errors.count == 0  #return false if there were any errors
  end  # def
  
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
#  id                  :integer         not null, primary key
#  catalog_id          :integer
#  title               :string(255)
#  body                :text
#  recipient_id        :integer
#  created_at          :datetime
#  updated_at          :datetime
#  status              :integer
#  pdfdoc_file_name    :string(255)
#  pdfdoc_content_type :string(255)
#  pdfdoc_file_size    :integer
#  document_content    :text
#

