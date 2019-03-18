require_dependency 'external/application_controller'

module External
  class RequerimentDocumentsController < ApplicationController
    before_action :set_requeriment

    def new
      @requeriment_document = @requeriment.requeriment_documents.new
      
      @header_title = "Novo requerimento"
      @header_backlink = external.new_requeriment_path
    end
    
    def create
      @requeriment_document = @requeriment.requeriment_documents.new(set_params)
      @requeriment_document.save
    end

    def delete
      @requeriment_document = @requeriment.requeriment_documents.find(params[:requeriment_document_id])
    end 
    
    def destroy
      @requeriment_document = @requeriment.requeriment_documents.find(params[:id])
      @requeriment_document.destroy
    end
    
    private

    def set_params 
      params.require(:requeriment_document)
        .permit(:attachment)
    end

    def set_requeriment
      @requeriment = External::Requeriment.find(params[:requeriment_id])
    end
  end
end
