class Public::HomesController < ApplicationController
  def top
    @shops=Shop.all
  end
end
