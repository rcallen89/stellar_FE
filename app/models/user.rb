class User < ApplicationRecord
  validates_presence_of :first_name,
                        :last_name,
                        :google_token,
                        :email

  validates_uniqueness_of :email
  has_many :favorites
end
