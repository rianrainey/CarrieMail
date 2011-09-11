class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :package_choice,
                  :street, :city, :state, :zip

  # VALIDATIONS
  validates_presence_of :first_name, :last_name
  validates_uniqueness_of  :email, :case_sensitive => false

  # friendly_id
  # has_friendly_id :name, :use_slug => true, :strip_non_ascii => true

  # ASSOCIATIONS
  has_one :catalog, :dependent => :destroy
  has_many :recipients, :dependent => :destroy
  
  after_initialize :init
  
  def init
    self.catalog ||= Catalog.create(:user_id => self.id)
  end  

  def name
    "#{first_name} #{last_name}"
  end
  
end


# == Schema Information
#
# Table name: users
#
#  id                   :integer         not null, primary key
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default(""), not null
#  password_salt        :string(255)     default(""), not null
#  reset_password_token :string(255)
#  remember_token       :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer         default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  first_name           :string(255)
#  last_name            :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  package_choice       :integer
#

