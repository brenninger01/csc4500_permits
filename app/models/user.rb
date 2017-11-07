class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :vehicles
<<<<<<< HEAD
  has_many :students
  has_many :permits
  has_many :facultys
  has_many :emergency_contacts
=======
  has_one :permit
  has_one :faculty
  has_one :emergency_contact
  has_one :student
>>>>>>> testing

  def admin?
  	roles == "admin"
  end

  def editor?
  	roles == "editor"
  end

  def standard?
  	roles == "standard"
  end

end
