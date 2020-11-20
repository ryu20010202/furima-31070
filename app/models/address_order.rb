class AddressOrder
  include ActiveModel::Model
  attr_accessor :postal_cord, :prefectures, :municipality, :house_number, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_cord, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefectures, numericality: { other_than: 1 }
    validates :municipality
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/ }
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_cord: postal_cord, prefectures_id: prefectures, municipality: municipality, house_number: house_number, building: building, phone_number: phone_number, order_id: order.id)
  end
end
