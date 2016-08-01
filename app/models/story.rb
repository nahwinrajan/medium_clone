class Story < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3 }
  validates :content, presence: true, length: { minimum: 25 }
  validates :tags, presence: true

  validate :tags_length

  REGEX_TAGS_SPLIT_BY_HASH = '/\#\w+/i'

  def tags_length
    arr_tags = tags.split(REGEX_TAGS_SPLIT_BY_HASH)
    if (arr_tags.length < 1)
      errors.add(:tags, "there must be at least 1 tag specified")
    elsif (arr_tags.length > 6)
      error.add(:tags, "a story can only have maximum of 6 tags")
    end
  end
end
