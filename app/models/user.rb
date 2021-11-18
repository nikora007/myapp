class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy

  #ターミナルでデリゲート(delegate)を使い、この名前でデータをとってくるように指定(中間の関係を省略)
  delegate :name, :learning_history, :purpose, :image, to: :profile

end
