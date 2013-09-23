class MenuItem < ActiveRecord::Base
  include Multilingual
  belongs_to :menu
  belongs_to :templet

  def type
  	if url.empty?
  		'folder-open'
  	else
  		if is_absolute
	  		'globe'
	  	else
	  		'share'
	  	end
  	end
  end
end
