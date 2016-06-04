class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :confirmable

  validates :first_name, presence: true
  validates :last_name, presence: true

  def name
    "#{first_name.titleize} #{last_name.titleize}"
  end
end
