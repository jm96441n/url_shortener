class UrlsController < ApplicationController

  def create
    @response = Url::Create.new(create_params[:original]).()
    @url      = @response.model
    if @response.errors
      flash[:error] = @response.errors
      redirect_to new_url_path
    else
      redirect_to url_path(@url)
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
