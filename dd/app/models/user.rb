class User < ActiveRecord::Base
  has_secure_password
  attr_accessible  :name, :password, :forget_issues, :forget_answer,:password_confirmation, :token
  before_create { generate_token(:token) }
  validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
  validates :forget_issues, :presence => true
  validates :forget_answer, :presence => true
  validates :password, :length => {:minimum => 6}, :on => :create

  def generate_token(column)
    begin
      self[column]=SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end

