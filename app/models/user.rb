class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
  validates :email, uniqueness: true
  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :lname, presence: true, format: { with: /[\p{katakana}ー－&&[^ -~｡-ﾟ]]+/ }
  validates :fname, presence: true, format: { with: /[\p{katakana}ー－&&[^ -~｡-ﾟ]]+/}
  validates :birthday, presence: true

end
