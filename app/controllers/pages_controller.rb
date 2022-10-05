# frozen_string_literal: true

class PagesController < ApplicationController
  # before_action :authenticate_user!

  def home
    @products = Product.all
  end

  def searcher
    if !params[:search].nil?
      @products = Product.search(params[:search])
    else
      @products = Product.order(:id).all
    end
  end
end
