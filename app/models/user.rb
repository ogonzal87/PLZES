class User < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3, maximum: 254 }
  validates :email, presence: true, length: { minimum: 3, maximum: 254 }
  validates :password, presence: true, length: { minimum: 3, maximum: 254 }
  validates :time, presence: true
end
