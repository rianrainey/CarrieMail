class Note < ActiveRecord::Base
  belongs_to :catalog
  belongs_to :recipient

  after_initialize :init  # initializes new notes with default values
  
  validates_presence_of :title, :body, :catalog, :recipient  
  attr_accessible :title, :body, :recipient_id, :catalog_id, :status
  
  has_attached_file :pdfdoc,
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => ":attachment/:id/:style.:extension"
  
  before_save :create_pdfdoc
  
  def create_pdfdoc
      DocRaptor.create(  :document_content => self.document_content, 
                         :document_type    => 'pdf',
                         :name             => self.document_name,
                         :test             => true) do |file, response|

          #file.extend(ActionDispatch::Http::UploadedFile)
          #file.content_type  = response.headers["content-type"]
          name = self.document_name.strip.gsub(/\s/, "_").gsub(/\W/, "").underscore.downcase
          # file.original_path = "#{name}.pdf"

          if response.code == 200
            self.pdfdoc = file
          else
            e = ActiveResource::Errors.new(self) 
            e.from_xml(response.body)
            e.each do |key, value|
              self.errors.add(key, value)
            end #each do
          end #if
      end #create

      self.errors.count == 0  #return false if there were any errors
  end  # def
  
  def document_name
    self.recipient.name.tr(' ','_')
  end  
  
  def status_description
    @statuses = { 
      0 => 'New',
      1 => 'Uploaded',
      2 => 'Printed',
      3 => 'Mailed'
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
#  id           :integer         not null, primary key
#  catalog_id   :integer
#  title        :string(255)
#  body         :text
#  recipient_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#  status       :integer
#

