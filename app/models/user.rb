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
  
  # 全角のカタカナを使用していないかどうかを検証
  with_options presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message:'Full-width katakana characters' }do
    validates :katakana_familyname
    validates :katakana_firstname

end

  with_options presence: true, format: { with: (/\A[ぁ-んァ-ンー-領]/), message:'Full-width characters' }do
    validates :familyname
    validates :firstname
end
end
end
