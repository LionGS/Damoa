class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_taggable
  acts_as_taggable_on :skills, :interests
  acts_as_voter

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :current_password
  validates_uniqueness_of :username
  has_many :histories
  has_many :recommend_posts

end
