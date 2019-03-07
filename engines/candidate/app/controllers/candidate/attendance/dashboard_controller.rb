require_dependency 'candidate/application_controller'

module Candidate
  module Attendance
    class DashboardController < Candidate::ApplicationController

      def index;end
      
      private

      def set_title
        @header_title = "meu_cadastro"
        @header_subtitle = "atendimentos"
      end
    end
  end
end