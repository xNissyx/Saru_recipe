class Public::HomesController < ApplicationController
  def top
    @tags = Tag.all
  end
end
