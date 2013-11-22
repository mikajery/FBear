class GoodsRouter
  def self.reload
    @@routes = nil
  end

  def self.routes
    if @@routes.nil?
      if ActiveRecord::Base.connection.table_exists? 'goods'
        @@routes = []
        prefix = Page.find_by(url: :goods)

        Good.all.each do |g|
          @@routes << { route: g.slug, redirect_to: ['', prefix.url, g.slug].join('/') }
        end
      end
    end

    @@routes
  end

  private
  @@routes = nil
end