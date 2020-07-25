# frozen_string_literal: true

class CreateBlogPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end