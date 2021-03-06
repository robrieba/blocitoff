class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         # disabling for debugging purposes.
         #,:confirmable

  validates :username, length: { minimum: 1, maximum: 100 }, presence: true

  has_many :items

  def self.gravatar_url(user, size)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=mm"
  end

end
