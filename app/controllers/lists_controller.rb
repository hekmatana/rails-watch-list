class ListsController < ApplicationController

def index
  @lists = List.all
  @list = List.new
end

def show
  @list = List.find(params[:id])
  @bookmark = Bookmark.new
end

def new
  @list = List.new
end

def create
  @list = List.new(list_params)
  if @list.save
    redirect_to list_path(@list)
  else
    @lists = List.all
    render "index", status: :unprocessable_entity
  end
end

private

def list_params
  params.require(:list).permit(:name, :image_url, :photo)
end

  # As a user, I can see all my movie lists
  # As a user, I can create a movie list
  # As a user, I can see the details of a movie list
end



# "restaurants/show"
