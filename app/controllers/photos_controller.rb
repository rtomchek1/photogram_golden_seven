class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show
    @photo = Photo.find_by({:id => params[:id]})
    render("/photos/details.html.erb")
  end

  def new_form
    render("/photos/new_form.html.erb")
  end

  def create_row
    p = Photo.new
    p.source = params[:the_source]
    p.caption = params[:the_caption]
    p.save
    redirect_to("/photos")
  end

  def destroy
    Photo.find_by({:id => params[:id]}).destroy
    redirect_to("/photos")
  end

  def edit_form
    @photo = Photo.find_by({:id => params[:id]})
    render("/photos/edit_form.html.erb")
  end

  def update
    p = Photo.find_by({:id => params[:id]})
    p.caption = params[:the_caption]
    p.source = params[:the_source]
    p.save
    @photo = p
    render("/photos/details.html.erb")
  end
end
