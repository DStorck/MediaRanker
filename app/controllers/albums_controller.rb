class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def delete
    @album = Album.find_by(id: params[:id])
    @album.delete
    redirect_to albums_path
    #pops up confirmation to make sure you want to delete it
    #after you delete it , takes you back to album index
  end

  def edit
    @album = Album.find(params[:id])
  end

  def upvote
    @album = Album.find(params[:id])
    rating = @album.rating
    @album.update(rating: rating += 1)
    redirect_to album_path(@album.id)
  end

  def update
    @album = Album.find(params[:id])
    # @album.update(album_update_params)
    @album.update_attributes(album_update_params[:album])
    redirect_to album_path(@album.id)
  end


  private
  def album_update_params
		params.permit(album: [:name, :description, :artist, :rating])
	end
end


# get     'albums'            => 'albums#index'
# get     'albums/:id'        => 'albums#show',    as: :album
# delete  'albums/:id'        => 'albums#delete'
# get     'albums/:id/edit'   => 'albums#edit',   as: :edit_album
# patch   'albums/:id/update' => 'albums#update', as: :update_album
