class Public::SearchesController < ApplicationController


  def search
    @range= params[:range]
    
    if @range==""
      @shops=Shop.looks(params)
end
