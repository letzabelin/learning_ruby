# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.all

    render body: @items.map { |item| "#{item.name} : #{item.price}" }.join("\n")
  end
end
