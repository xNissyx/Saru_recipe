module ApplicationHelper
  def error_message_for(field, model)
    if model.errors[field].any?
      tag.div class: "invalid-feedback d-block" do
        model.errors[field].join(", ")
      end
    end
  end
end
