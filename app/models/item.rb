class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :condition_id
    validates :burden_id
    validates :area_id
    validates :day_id
    validates :price, format: { with: /\A(?=\d)\z/}, numericality: { :greater_than_or_equal_to => 300 }, :numericality => { :less_than_or_equal_to => 9999999 }
  end

  belongs_to :user
  has_one_attached :image

end
