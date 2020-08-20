class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name, length: { in: 1..6 }  
    validates :email, uniqueness: true 
    validates :familyname, :firstname
    validates :katakana_familyname, :katakana_firstname
    validates :birthday
    end
  
str = [(/\A[ぁ-んァ-ンー-領]/),/[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/]
with_options format: true do
  validates :familyname, :firstname, format: str[0]
  validates :katakana_familyname, :katakana_firstname
end
