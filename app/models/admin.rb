class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  # attr_accessible :title, :body
end


#validations
class  Admin < ActiveRecord::Base
  validates :email, :password, :password_confirmation, :username, presence: true
  validates_presence_of :password, :on => :create
  validates_length_of :password, :minimum => 8
  validates_confirmation_of :password
end  