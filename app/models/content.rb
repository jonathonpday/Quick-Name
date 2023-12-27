class Content < ApplicationRecord
  belongs_to :display
  validates :title, presence: true

  has_one_attached :image

  def image_as_thumbnail
    image.variant(resize_to_limit: [800, 800]).processed
  end

#   def image_as_mini_thumbnail
#     image.variant(resize_to_limit: [400, 400]).processed
#   end
end
