class User < ActiveRecord::Base
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    has_many :owners
    has_many :messages
    has_many :posts
    #all the blogs owned by a user
    has_many :blogs, through: :owners
    #all the blogs a user has posted on
    has_many :blogs_posts, through: :posts, source: :blog

    has_many :messages, through: :posts

    validates :first_name, :last_name, :email_address, presence:true
    validates :email_address, uniqueness: { case_sensitive: false}, format: { with: EMAIL_REGEX}
end
