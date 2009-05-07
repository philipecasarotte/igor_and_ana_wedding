class PostsController < ApplicationController
  def index
    @page = Page.find_by_permalink("mensagens")
    @metatag_object = @page
    @posts = Post.all
  end
  
  def create
    @post = Post.new(params[:post]) unless params[:post].blank?
    if @post.save
      flash[:notice] = 'Sua mensagem foi enviada.'
    else
      flash[:error] =  "Sua mensagem não pode ser enviada."
    end
    @posts = Post.all
    render :partial => "posts"
  end
end
