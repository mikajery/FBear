class Admin::BaseController < ApplicationController
  layout 'admin'
  helper Admin::AdminHelper

  private
    def permit_params
      params.require(controller_path.singularize).permit get_safe_params
    end

end