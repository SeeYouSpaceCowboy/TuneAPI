module Api::V1
  class AlbumsController < ApplicationController
    def index
      @albums = Album.all
      render json: @albums
   end

    def show
      @album = Album.find(params[:id])
      render json: @album, serializer: AlbumShowSerializer
    end

    def create
      @album = Album.create(title: params[:album][:title])
      render json: @album, status: 201
    end
  end
end
