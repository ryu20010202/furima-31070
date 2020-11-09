class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :condition_id
    validates :burden_id
    validates :area_id
    validates :day_id
    validates :price
  end

  - belongs_to :user
  - has_one_attached :image

end
