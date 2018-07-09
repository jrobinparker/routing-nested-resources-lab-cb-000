class SongsController < ApplicationController
  
  def index
    if params[:artist_id]
      @songs = Artist.find(params[:id]).songs 
    else
      redirect_to "artists/index"
      flash[:alert] = "Artist not found."
    end 
  end

  def show
    if params[:artist_id]
      @song = Artist.find(params[:id]).song
    else 
      redirect_to "artists/index"
      flash[:alert] = "Song not found."
    end
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end

