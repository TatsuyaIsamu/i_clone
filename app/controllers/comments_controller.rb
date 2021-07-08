class CommentsController < ApplicationController
  before_action :set_picture, only: [:create, :edit, :update]
    # コメントを保存、投稿するためのアクションです。
    def create
      # Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
      @comment = @picture.comments.build(comment_params)
  
      # クライアント要求に応じてフォーマットを変更
      respond_to do |format|
        if @comment.save
          format.js { render :index }
        else
          format.html { redirect_to picture_path(@picture), notice: '投稿できませんでした...' }
        end
      end
    end

    def edit
      @comment = @picture.comments.find(params[:id])
      respond_to do |format|
        flash.now[:notice] = 'コメントの編集中'
        format.js { render :edit }
      end
    end
    def update
      @comment = @picture.comments.find(params[:id])
        respond_to do |format|
          if @comment.update(comment_params)
            flash.now[:notice] = 'コメントが編集されました'
            format.js { render :index }
          else
            flash.now[:notice] = 'コメントの編集に失敗しました'
            format.js { render :edit_error }
          end
        end
    end

    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      respond_to do |format|
        flash.now[:notice] = 'コメントが削除されました'
        format.js { render :index }
      end
    end
    
    private
    # ストロングパラメーター
    def comment_params
      params.require(:comment).permit(:picture_id, :content)
    end
    def set_picture
        @picture = Picture.find(params[:picture_id])
    end
end
