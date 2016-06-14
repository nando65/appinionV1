class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # Association declaration
  has_many :videos

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
