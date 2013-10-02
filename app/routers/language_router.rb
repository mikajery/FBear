class LanguageRouter < Object
  def self.reload
    @@routes=nil
  end
  
  def self.routes
    if @@routes.nil?
      if ActiveRecord::Base.connection.table_exists? 'languages'
        @@routes = []

        options = {
          'locale/:slug' => 'content/language#select',
          as: 'locale_select'
        }
        @@routes << options
      end
    end

    # abort @@routes.to_s
  
    @@routes
  end

  private 
    @@routes=nil

end