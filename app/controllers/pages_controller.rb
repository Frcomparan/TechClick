# frozen_string_literal: true

class PagesController < ApplicationController
  # before_action :authenticate_user!
  include Pagy::Backend

  Pagy::DEFAULT[:items] = 12

  def home
    @pagy, @products = pagy(Product.all)
  end

  def searcher
    if !params[:search].nil?
      @pagy, @products = pagy(Product.search(params[:search]))
    else
      @pagy, @products = pagy(Product.order(:id).all)
    end
  end

  def filter
    @pagy, @products = pagy(Product.where(id: params[:products_id]))
    @products = @products.search_filter(params[:filter])
  end

  def category
    @pagy, @products = pagy(Category.find_by(name: params[:category]).products)
    render :home
  end
end
