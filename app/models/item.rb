class Item < ApplicationRecord
  validates :price, numericality: { greater_than: 0, allow_nil: true }
  validates :name, :description, presence: true

  after_initialize { p 'initialize custom' }
  after_save { p 'save custom' }
  after_create { p 'create custom' }
  after_update { p 'update custom' }
  after_destroy { p 'destroy custom' }
end
