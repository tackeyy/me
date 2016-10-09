class PostDecorator < Draper::Decorator
  delegate_all

  def status_label
    label_color = model.status.wip? ? 'label-default' : 'label-primary'
    h.content_tag(:span, model.status_text, class: "label #{label_color}")
  end
end
