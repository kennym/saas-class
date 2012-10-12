module ApplicationHelper
  def sortable(title, column)
    th_class = sort_column == column ? "hilite" : nil
    link_id = column + "_header"
    content_tag(:th, link_to(title, {:sort_by => column}, {:id => link_id}), :class=> th_class)
  end
end
