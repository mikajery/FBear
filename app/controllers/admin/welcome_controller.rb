class Admin::WelcomeController < Admin::BaseController
  def index
    category = Category.by_lang('ru').first
    abort category.slug + category.lang('ru').name
  end
end