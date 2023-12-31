class Content < ApplicationRecord
  belongs_to :display
  validates :title, presence: true
  validates :image, presence: true
  validates :audio, presence: true

  validate :validate_number_of_contents, on: :create

  has_one_attached :image
  has_one_attached :audio

  def image_as_thumbnail
    image.variant(resize_to_limit: [800, 800]).processed
  end

  def image_as_mini_thumbnail
    image.variant(resize_to_limit: [400, 400]).processed
  end

  private

  def validate_number_of_contents
    max_contents = 3
    if display.contents.count >= max_contents
      errors.add(:base, "Maximum number of contents (#{max_contents}) reached for this display.")
    end
  end
end
