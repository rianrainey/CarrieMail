class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me

  # VALIDATIONS
  validates_presence_of :first_name, :last_name
  validates_uniqueness_of  :email, :case_sensitive => false

  # friendly_id
  # has_friendly_id :name, :use_slug => true, :strip_non_ascii => true

end
