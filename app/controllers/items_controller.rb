# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :authenticate_user!
  # skip_before_action :verify_authenticity_token
  before_action :find_item, only: %i[show edit update destroy upvote]
  before_action :admin?, only: :edit

  def index
    @items = Item.all.order(:id).includes(:image)
  end

  def create
    @item = Item.create(items_params)
    if @item.persisted?
      flash[:success] = 'Item was created successfully'
      redirect_to items_path
    else
      flash.now[:error] = 'Please fill all fields correctly'
      render 'new'
    end
  end

  def new
    @item = Item.new
  end

  def show; end

  def edit; end

  def update
    if @item.update(items_params)
      flash[:success] = 'Item was updated successfully'
      redirect_to item_path
    else
      flash.now[:error] = 'Please fill all fields correctly'
      render json: item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.destroy.destroyed?
      render json: { success: true }
    else
      flash.now[:error] = 'Item wasn\'t destroyed'
      render json: items.errors, status: :unprocessable_entity
    end
  end

  def upvote
    @item.increment! :votes_count # rubocop:disable Rails/SkipsModelValidations
    redirect_to items_path
  end

  def expensive
    @items = Item.where('price > 50')
    render 'index'
  end

  private

  def items_params
    params.require(:item).permit(:name, :price, :description)
  end

  def find_item
    @item = Item.where(id: params[:id]).first
    render_404 unless @item
  end
end
