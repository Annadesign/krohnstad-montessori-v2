class GalleriesController < ApplicationController

 
  def show
    @gallery  = Gallery.find(params[:id])
    @images = @gallery.images
  end

 
end
