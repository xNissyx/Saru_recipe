class Admin::TagsController < ApplicationController
  def index
    @tags = Tag.page(params[:page]).per(12)
    @tag = Tag.new
  end

  def new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admin_tags_path
    else
      render :new
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to admin_tags_path
  end


  private
    def tag_params
      params.require(:tag).permit(:name)
    end
end
