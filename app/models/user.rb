class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do

    validates :password, format: { with: /\A(?=.*?[A-z])(?=.*?\d)[A-z\d]+\z/i }
    validates :email, uniqueness: true
    validates :nickname
    validates :birthday
    
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
      validates :last_name 
      validates :first_name
    end

    with_options format: { with: /[\p{katakana}ー－&&[^ -~｡-ﾟ]]+/ } do
      validates :lname
      validates :fname
    end

  end

  has_many :items

end
