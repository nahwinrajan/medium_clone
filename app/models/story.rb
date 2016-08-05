class Story < ActiveRecord::Base
  before_save { self.tags = tags.downcase }

  belongs_to :user
  has_many   :comments, dependent: :destroy

  accepts_nested_attributes_for :comments

  validates :title,   presence: true, length: { minimum: 3 }
  validates :content, presence: true, length: { minimum: 25 }
  validates :tags,    presence: true
  validates :user_id, presence: true

  validate :tags_length

  # any alphanumeric string of at least with 1 char after the hash
  REGEX_TAGS_SPLIT_BY_HASH = '/\#[\w]+/i'

  def tags_length
    arr_tags = tags.split(REGEX_TAGS_SPLIT_BY_HASH)
    if (arr_tags.length < 1)
      errors.add(:tags, "at least 1 tag specified")
    elsif (arr_tags.length > 6)
      error.add(:tags, "a story can only have maximum of 6 tags")
    end
  end
end
