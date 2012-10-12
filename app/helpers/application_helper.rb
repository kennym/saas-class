module ApplicationHelper
  def sortable(title, column)
    th_class = sort_column == column ? "hilite" : nil
    css_class = column + "_header"
    content_tag(:th, link_to(title, {:sort_by => column}, {:class => css_class}), :class=> th_class)
  end
end
