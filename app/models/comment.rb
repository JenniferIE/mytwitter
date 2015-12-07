class Comment < ActiveRecord::Base
	belongs_to :user
    belongs_to :comment
    has_and_belongs_to_many :comments
    has_many :commentators, :through => :comments,
                :source => :user
	has_and_belongs_to_many :books
    validates :user_id, presence: true
    validates :book_id, presence: true
    validates :content, presence: true, length: { maximum: 140 }
end
