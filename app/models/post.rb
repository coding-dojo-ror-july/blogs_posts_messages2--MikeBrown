class Post < ActiveRecord::Base
  has_many :messages
  belongs_to :user
  belongs_to :blog
  validates :title, :content, presence:true
end
