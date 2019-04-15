require_dependency 'external/application_controller'

module External
  class RequerimentAttachmentsController < ApplicationController
    before_action :set_requeriment

    def index
      @requeriment_attachment = @requeriment.requeriment_attachments.new
      
      @header_title = "Novo requerimento"
      @header_backlink = external.new_requeriment_path
    end
    
    def create
      @requeriment_attachment = @requeriment.requeriment_attachments.new(set_params)
      @requeriment_attachment.save
    end
    
    def show
      @requeriment_attachment = @requeriment.requeriment_attachments.find(params[:id])
    end

    def delete
      @requeriment_attachment = @requeriment.requeriment_attachments.find(params[:requeriment_attachment_id])
    end 
    
    def destroy
      @requeriment_attachment = @requeriment.requeriment_attachments.find(params[:id])
      @requeriment_attachment.destroy
    end
    
    private

    def set_params 
      params.require(:requeriment_attachment)
        .permit(:attachment)
    end

    def set_requeriment
      @requeriment = External::Requeriment.find(params[:requeriment_id])
    end
  end
end
