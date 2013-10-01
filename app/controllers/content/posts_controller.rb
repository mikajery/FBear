class Content::PostsController < Content::BaseController
  before_action :navigation, only: [:list, :item]

  def item
    @post = Post.find_by_slug params[:slug]
    @comments = @post.comments.where( locale: I18n.locale )
  end

  private
    def navigation
      links = []

      PostCategory.all.each do |i|
        links << { active: (true if @category == i), href: blogs_item_path(i.slug), title: i.title }
      end

      @navigation = {
        helper: t('navigation.blogs.helper'),
        title: t('navigation.blogs.title'),
        items: links
      }
    end  
end
