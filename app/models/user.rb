class User < ApplicationRecord
	has_many :forum_threads
	has_many :forum_posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum level: {member: 0, admin: 1}
end
