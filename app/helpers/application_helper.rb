module ApplicationHelper
  def current_locale
    params["locale"]
  end
end
