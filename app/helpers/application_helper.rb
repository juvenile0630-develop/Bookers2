module ApplicationHelper
  def error_message_with_model(model)
    render partial: "model/error_model", object: model if model
  end
end
