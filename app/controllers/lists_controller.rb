class ListsController < ApplicationController

def index
  @lists = List.all
end

def show
  @list = Lisyt.find(params[:id])
end

def new
  @list = List.new
end

def create
  @list = List.new(params[:name])
end

  # As a user, I can see all my movie lists
  # As a user, I can create a movie list
  # As a user, I can see the details of a movie list
end
