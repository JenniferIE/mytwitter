class CreateCommentBookJoinTable < ActiveRecord::Migration
  def change
    create_table :comments_books, :id => false do |t|
      t.integer :comment_id
      t.integer :book_id  	
    end
  end
end
