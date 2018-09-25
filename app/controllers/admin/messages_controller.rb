class Admin::MessagesController < Admin::ApplicationController
 #before_action :set_message, only: [:destroy]

  #respond_to :html, :json  

  def index
    @messages = Message.order(id: :asc)
  end

 
  def show

  end

  def developement

  end

  def new
    @message = Message.new(:department_id => params[:department_id])
  end

  def edit
    @message = Message.find(params[:id])
  end

  # POST /admin/categories
  # POST /admin/categories.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to edit_admin_department_url(@message.department.id), notice: 'Beskjeden ble lagret.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/categories/1
  # PATCH/PUT /admin/categories/1.json
  def update
    @message = Message.find(params[:id])
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to edit_admin_message_url(@message), notice: 'Beskjeden ble oppdatert.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    respond_to do |format|
      format.html { redirect_to edit_admin_department_url(@message.department.id), notice: 'Beskjeden ble slettet.' }
      format.json { head :no_content }
    end
  end

  private 


    def message_params
      params.require(:message).permit(:title, :content, :color, :department_id)
    end
end
