class Admin::DocumentsController < Admin::ApplicationController
  
  def index

    @documents = Document.all

  end


  def new
  
    @document = Document.new(:department_id => params[:department_id])

  end

  def edit
    @document = Document.find(params[:id])
  end

  # POST /images
  # POST /images.json
  def create
    @document = Document.new(document_params)

    if @document.save
      respond_to do |format|
        format.html {
          render :json => [@document.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@document.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

 
  def update

  

    @document = Document.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(image_params)
        format.html { redirect_to admin_document_path(@document), notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    @document = Document.find(params[:id])
    @document.destroy

    respond_to do |format|
      format.html { redirect_to admin_documents_path }
      format.js
    end
  end


  private

  def document_params
    params.require(:document).permit(:title, :description, :document, :department_id)
  end
end