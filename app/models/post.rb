class Post < ActiveRecord::Base
  attr_accessible :user, :title, :content

  belongs_to :user
  has_many :comments

  validates_presence_of :user, :title, :content
end
