class PostController < ApplicationController
  def index
    @posts=Post.all
  end

  def new
  end

  def create
    #1
    post=Post.create(title: params[:title], body: params[:body])

    #1-1
    #Post.create(title => params[:title], body => params[:body])

    #2
    #post=Post.new
    #post.title=params[:title]
    #post.body=params[:body]
    #post.save

    flash[:notice] = "글이 작성되었습니다."
    redirect_to "/post/#{post.id}"


  end


  def show
  @post=Post.find(params[:id])
  end

  def destroy
  post=Post.find(params[:id])
  post.destroy
  flash[:alert] = "글이 삭제되었습니다."

  #redirect_to 뒤에는 반드시 ""로 경로를 설정해 줘야함
  redirect_to "/"
  end

  def edit
    @post=Post.find(params[:id])
  end

  def update
    Post.find(params[:id]).update(title: params[:title],body: params[:body])
    post=Post.find(params[:id])
    flash[:notice] = "글이 수정되었습니다."
    redirect_to  "/post/#{post.id}"

  end




end
