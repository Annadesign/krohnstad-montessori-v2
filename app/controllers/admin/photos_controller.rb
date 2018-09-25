class Admin::PhotosController < Admin::ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  def index
    @photos = Photo.all
  end

  def list
    @listimages = Photo.all
    render :layout => "gallery" 
  end

  def show
  end

  def new
    @photo = Photo.new
  end

  def edit
  end


  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save

        if params[:images]
          params[:images].each { |image|
            @photo.create(image: image)
          }
        end

        format.html { redirect_to admin_photos_url, notice: 'Bilde ble lastet opp' }
       
      else
        format.html { render action: "new" }
      
      end
    end  

  end

  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to admin_photos_url, notice: 'Photo was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to admin_photos_url, notice: 'Photo was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:image)
    end
end
