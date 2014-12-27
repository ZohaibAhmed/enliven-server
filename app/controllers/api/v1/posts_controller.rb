module Api
  module V1
    class PostsController < ApplicationController
      skip_before_action :verify_authenticity_token
      respond_to :json

      def index
      	# get all the posts, regardless of locality
      	respond_with Post.all
      end

      def create
        if Product.create(title: params[:title], body: params[:body], picture: params[:picture])
          status = "OK"
        else
          status = "FAILED"

        respond_with {status: status}
      end

      
    end
  end
end