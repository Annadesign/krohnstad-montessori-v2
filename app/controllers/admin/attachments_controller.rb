class Admin::AttachmentsController < Admin::ApplicationController
  
  def index

    @attachments = Attachment.all

  end


  def new
  
    @attachment = Attachment.new(:article_id => params[:article_id])

  end

  def edit
    @attachment = Attachment.find(params[:id])
  end

  # POST /images
  # POST /images.json
  def create
    @attachment = Attachment.new(attachment_params)

    if @attachment.save
      respond_to do |format|
        format.html { redirect_to admin_attachments_url, notice: 'Dokumentet ble lastet opp' }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

 
  def update

  

    @attachment = Attachment.find(params[:id])

    respond_to do |format|
      if @attachment.update_attributes(attachment_params)
        format.html { redirect_to admin_attachment_path(@attachment), notice: 'Attachment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    @attachment = Attachment.find(params[:id])
    @attachment.destroy

    respond_to do |format|
      format.html { redirect_to admin_attachments_path }
      format.js
    end
  end


  private

  def attachment_params
    params.require(:attachment).permit(:attachment, :description, :article_id)
  end
end