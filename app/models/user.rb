class User < ActiveRecord::Base
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    has_many :owners
    has_many :messages
    has_many :posts

   
    has_many :comments, as: :commentable #added the comments relationship



    has_many :blogs, through: :owners # all the blogs owned by a specific user

    has_many :blog_posts, through: :posts, source: :blog # all the blogs a user has posted on

    validates :email_address, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
    validates :first_name, :last_name, :email_address, presence: true
end
