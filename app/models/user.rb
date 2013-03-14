class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:first_name,:last_name,:secret_code,:role
  validates :secret_code, :presence => true
  # ,:inclusion => { :in => "foobar" }
  # # attr_accessible :title, :body
  has_one :secretcode, :class_name => 'SecretCode', :foreign_key => "user_id"
  after_create :update_user
  # accepts_nested_attributes_for :secret_code,
  #                           :reject_if => :all_blank,
  #                           :allow_destroy => true

 def update_user
    code = SecretCode.find(secret_code)
    code.user_id = id
    code.save
 end
 def admin?
   return true if self.role == 'admin'
 end
end
