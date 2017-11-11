class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :vehicles
  has_one :permit
  has_one :faculty
  has_one :emergency_contact
  has_one :student

  def admin?
  	roles == "admin"
  end

  def editor?
  	roles == "editor"
  end

  def standard?
  	roles == "standard"
  end

  def student?
    position == "Student"
  end

  def faculty?
    position == "Faculty"
  end

end
