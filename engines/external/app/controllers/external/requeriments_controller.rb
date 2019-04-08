require_dependency 'external/application_controller'

module External
  class RequerimentsController < ApplicationController
    before_action :set_requeriments

    def index
      if session[:external_requeriment_cpf].nil?
        redirect_to external.new_pre_requeriment_path
      end 

      @requeriment_service = Support::Attendance::RequerimentService.new(session[:external_requeriment_cpf])

      @header_title = "Meus requerimentos"
      @header_backlink = external.new_pre_requeriment_path
    end

    def new
      @requeriment = @requeriments.new
      @requeriment_service = Support::Attendance::RequerimentService.new(session[:external_requeriment_cpf])
      
      @header_title = "Novo requerimento"
      @header_backlink = external.requeriments_path 
    end
    
    def create
      @requeriment = @requeriments.new(set_params)
      @requeriment_service = Support::Attendance::RequerimentService.new(session[:external_requeriment_cpf])

      if @requeriment.save
        redirect_to external.new_requeriment_requeriment_attachment_path(@requeriment)
      else
        render action: :new
      end
    end

    def done 
      @requeriment = @requeriments.find(params[:requeriment_id])
      
      @header_title = "Requerimento"
      @header_backlink = external.requeriments_path
    end

    def show
      @requeriment = @requeriments.find(params[:id])

      @header_title = "Requerimento"
      @header_backlink = external.requeriments_path
    end

    private

    def set_params 
      params.require(:requeriment).permit(:name, :category_id, :telephone, :celphone, :city_id, 
                                          :address, :document_number, :content)
    end

    def set_requeriments
      @requeriments = External::Requeriment.where(cpf: session[:external_requeriment_cpf]) 
    end

  end
end