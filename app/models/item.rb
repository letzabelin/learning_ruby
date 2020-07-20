# frozen_string_literal: true

class Item < ApplicationRecord
  validates :price, numericality: { greater_than: 0, allow_nil: true }
  validates :name, presence: true

  has_many :positions
  has_many :carts, through: :positions
  has_many :comments, as: :commentable
  has_one :image, as: :imageable

  after_initialize { p 'initialize custom' }
  after_save { p 'save custom' }
  after_create { p 'create custom' }
  after_update { p 'update custom' }
  after_destroy { p 'destroy custom' }

  # TODO: for carts_items
  # has_and_belongs_to_many :carts
end
