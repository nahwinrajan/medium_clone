class User < ActiveRecord::Base
  has_many :stories, dependent: :destroy
  has_many :comments #comment will be dependent on story
  has_many :active_relationships, class_name:   "Relationships",
                                foreign_key:  "follower_id",
                                dependent:    :destroy
  has_many :passive_relationships, class_name:   "Relationships",
                                foreign_key:  "followed_id",
                                dependent:    :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships

  before_save :downcase_all_columns
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_voter

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

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
