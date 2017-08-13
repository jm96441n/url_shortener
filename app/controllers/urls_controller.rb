class UrlsController < ApplicationController

  def new
    @url = Url.new
  end

  def create
    @response = Url::Create.new(create_params[:original]).()
    @url      = @response.model
    if @response.errors.empty?
      redirect_to url_path(@url)
    else
      flash[:error] = @response.errors
      redirect_to new_url_path
    end
  end

  def show
    @url = Url.where(id: params[:id]).first
    @url
  end


  private

  def create_params
    params.require(:url).permit(:original)
  end
end
