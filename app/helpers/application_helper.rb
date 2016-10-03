module ApplicationHelper
  def active_class_if(bool)
    bool ? 'active' : nil
  end
end
