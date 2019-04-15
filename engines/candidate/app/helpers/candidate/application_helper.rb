module Candidate
  module ApplicationHelper

    def attendance_dependent_label(ticket_step: nil, dependent_mirror: nil)
      ticket_step.ticket_category_step.step_documents.each do |step_document|
        ticket_documents = ticket_step.ticket_documents.where(dependent_mirror_id: dependent_mirror.id, document_type_id: step_document.document_type_id)
        
        unless step_document.document_type.min_file <= ticket_documents.count
          return false
        end 
      end

      return true
    end

    def attendance_step_url(ticket: nil, ticket_category_step: nil, dependent_mirror_id: nil)
      ticket_step = ticket.ticket_steps.find_by(category_step_id: ticket_category_step.id)
      
      if ticket_step.data_updated?
        if ticket_category_step.document_required?
          if ticket_step.document?
            attendance_ticket_step_reopen_path(ticket, ticket_step)
          else
            if %w(dependent income).include?(ticket_step.ticket_category_step.view_form) 
              attallow_formendance_ticket_step_path(ticket, ticket_category_step)
            else
              attendance_ticket_step_document_types_url(ticket, ticket_step)
            end
          end
        else
          attendance_ticket_step_reopen_path(ticket, ticket_step)
        end
      else
        attendance_ticket_step_path(ticket, ticket_category_step)
      end 

    end
    
    def attendance_step_icon(ticket: nil, ticket_category_step: nil)
      ticket_step = ticket.ticket_steps.find_by(category_step_id: ticket_category_step.id)

      if ticket_category_step.step_required?
        if ticket_step.data_updated?
          if ticket_category_step.document_required?
            if ticket_step.document?
              image_tag 'checked.png'
            else 
              image_tag 'warning.png'
            end
          else
            image_tag 'checked.png'
          end
        else
          image_tag 'warning.png'
        end
      else

      end 
    end
    
    def attendance_step_action(ticket: nil, ticket_category_step: nil)
      ticket_step = ticket.ticket_steps.find_by(category_step_id: ticket_category_step.id)
      html = ""

      if ticket_step.data_updated?
        html += "<b>Dados:</b> Atualizado"
      else
        html += "<b>Dados:</b> Pendente"
      end

      html += "<br />"

      if ticket_category_step.document_required?
        if ticket_step.document?
          html += "<b>Documentação:</b> Atualizada"
        else
          html += "<b>Documentação:</b> Pendente"
        end
      end

      html.html_safe
    end
  end
end
