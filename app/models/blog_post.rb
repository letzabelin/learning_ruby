# frozen_string_literal: true

class BlogPost < ApplicationRecord
  has_many :comments, as: :commentable
end
