class User < ActiveRecord::Base
  has_many :stories, dependent: :destroy
  has_many :comments

  before_save :downcase_all_columns
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def downcase_all_columns
    self.email = self.email.downcase
    self.f_name = f_name.downcase
    self.l_name = l_name.downcase
    self.city = city.downcase
    self.country = country.downcase
  end

  def fullname
    self.f_name << " " << self.l_name
  end
end
