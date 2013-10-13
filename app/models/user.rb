
class User < ActiveRecord::Base

  attr_accessible :user_name, :password_digest, :session_token, :password
  attr_reader :password

  validates(
  	:user_name,
  	:password_digest,
  	:session_token,
  	:presence => true
  )
  validates :user_name, :uniqueness => true
  validates :password, :length => { :minimum => 6, :allow_nil => true}

  before_validation do
  	self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

  has_many :luftballons, :dependent => :destroy


  def reset_session_token
  	self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
  end

  def self.find_by_credentials(name,password)
  	user = User.find_by_user_name(name)

    return nil if user.nil?
  	user.is_password?(password) ? user : nil
  end

  def password=(password)
  	@password = password
  	self.password_digest = BCrypt::Password.create(password).to_s
  end

  def is_password?(password)
  	BCrypt::Password.new(self.password_digest).is_password?(password)
  end
end
