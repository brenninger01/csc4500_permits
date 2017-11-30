class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :vehicles
  has_many :vehicle_permit
  has_one :faculty
  has_one :emergency_contact
  has_one :student

  def admin?
  	roles.upcase == "ADMIN"
  end

  def editor?
  	roles.upcase == "EDITOR"
  end

  def standard?
  	roles.upcase == "STANDARD"
  end

  def student?
    position.upcase == "STUDENT"
  end

  def faculty?
    position.upcase == "FACULTY"
  end

end
