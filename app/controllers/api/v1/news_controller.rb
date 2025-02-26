module Api
  module V1
    class NewsController < ApplicationController
      def index
        news = News.order(created_at: :desc)
        render json: news
      end

      def create 
        news = News.new(news_params)

        if news.save
          render json: news, status: :created
        else
          render json: { error: news.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        news = News.find_by(id: params[:id]) # ✅ Prevents errors if ID is missing

        if news
          news.destroy
          render json: { message: "Post deleted successfully" }, status: :ok
        else
          render json: { error: "Post not found" }, status: :not_found
        end
      end

      def update
        news = News.find_by(id: params[:id])

        if news&.update(news_params)
          render json: news, status: :ok
        else
          render json: { error: news ? news.errors.full_messages : "Post not found" }, status: :unprocessable_entity
        end
      end

      def show
        news = News.find_by(id: params[:id])

        if news
          render json: news
        else
          render json: { error: "News not found" }, status: :not_found

        end
      end

      private

      def news_params
        params.require(:news).permit(:title, :description, :image_url)
      end
    end
  end
end
