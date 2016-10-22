class PostDecorator < Draper::Decorator
  delegate_all

  OPTIONS = {
    filter_html:     true,
    hard_wrap:       true,
    link_attributes: { rel: 'nofollow', target: '_blank' }
  }.freeze

  EXTENSIONS = {
    autolink:           true,
    superscript:        true
  }.freeze

  def body_as_html
    renderer = Redcarpet::Render::HTML.new(OPTIONS)
    markdown = Redcarpet::Markdown.new(renderer, EXTENSIONS)

    markdown.render(model.body).html_safe
  end

  def tag_label(tag_name)
    h.content_tag(:span, tag_name, class: 'label label-info')
  end

  def status_label
    label_color = model.status.wip? ? 'label-default' : 'label-primary'
    h.content_tag(:span, model.status_text, class: "label #{label_color}")
  end

  def published_at
    model.created_at.to_s(:published_at)
  end
end
