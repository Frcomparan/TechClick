# frozen_string_literal: true

class PagesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_filter, only: %i[ filter category ]

  include Pagy::Backend

  Pagy::DEFAULT[:items] = 12

  def home
    @filtered_products = Product.all.where('quantity > 0')
    @pagy, @products = pagy(@filtered_products)
  end

  def searcher
    if !params[:search].nil?
      @filtered_products = Product.search(params[:search])
      @pagy, @products = pagy(@filtered_products)
    else
      @filtered_products = Product.order(:id).all.where('quantity > 0')
      @pagy, @products = pagy(@filtered_products)
    end
  end

  def filter
    @filtered_products = Product.where(id: params[:products_id]).search_filter(params[:filter])
    @pagy, @products = pagy(@filtered_products)
  end

  def category
    @pagy, @products = pagy(Category.find_by(name: params[:category]).products.where('quantity > 0')  )
    render :home
  end

  private

  def set_filter
    @category_selected = params[:category_selected] ? params[:category_selected] : -1
    @filter_selected = params[:filter_selected] ? params[:filter_selected] : -1
  end
end
