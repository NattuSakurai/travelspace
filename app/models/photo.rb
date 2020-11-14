class Photo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :place
  
  validates :title, :description, presence: true
  validates :place_id, numericality: { other_than: 1 } 

  has_one_attached :image
end
