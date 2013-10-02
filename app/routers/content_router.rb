class ContentRouter < Object
  def self.reload
    @@routes=nil
  end
  
  def self.routes
    if @@routes.nil?
      if ActiveRecord::Base.connection.table_exists? 'pages'
        @@routes = []

        Page.all.each do |page|
          page.routes.each do |r|
            options = {
              page.routed_url(r) => 'content/' + r[:controller].to_s + '#' + r[:action].to_s
            }
            options[:as] = r[:as].underscore if r[:as]
            options[:page] = page
            @@routes << options
          end
        end
      end
    end

    # abort @@routes.to_s
  
    @@routes
  end

  private 
    @@routes=nil

end