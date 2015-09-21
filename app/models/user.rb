class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         # disabling for debugging purposes.
         #,:confirmable

  validates :username, length: { minimum: 1, maximum: 100 }, presence: true

end
