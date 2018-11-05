class Admin::InfosController < Admin::ApplicationController
 def new
    if Info.any?
      redirect_to edit_admin_info_url(Info.first)
    else
      @info = Info.new
    end
  end

  def create
    @info = Info.new(infos_params)
    if @info.save
      redirect_to edit_admin_info_url(@info), notice: 'Informasjon er lagret'
    else
      flash[:alert] = 'There was a problem creating setting'
      render :new
    end
  end

  def edit
    @info = Info.find(params[:id])
  end

  def update
    @info = Info.find(params[:id])
    if @info.update(infos_params)
      redirect_to edit_admin_info_url(@info), notice: 'Informasjon er oppdatert'
    else
      flash[:alert] = 'There was a problem updating setting'
      render :edit 
    end
  end

  private
  def infos_params
    params.require(:info).permit(:content)
  end
end
