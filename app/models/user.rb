class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :chats, dependent: :delete_all

  has_one :gamerooms, :class_name => 'Gameroom', :foreign_key => :user_id

  has_one :games, :class_name => 'Game', :foreign_key => :user_id

  validates :username, :length => { :maximum => 30 }
end