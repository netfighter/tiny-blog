class Comment < ActiveRecord::Base
  attr_accessible :user, :post, :content

  belongs_to :post
  belongs_to :user

  validates_presence_of :user, :post, :content
end
