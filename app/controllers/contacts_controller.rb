class ContactsController < ApplicationController
  def index
    if current_user
      @contact_list = current_user.contacts
    else
      redirect_to "/users/sign_in"
    end

    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    if params[:address] == ''
      @coordinates = Geocoder.coordinates(params[:address])
    else
      @coordinates = [0.00, -0.00]
    end

    Contact.create(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      bio: params[:bio],
      latitude: @coordinates[0],
      longitude: @coordinates[1],
      user_id: current_user.id
    )

    render 'create.html.erb'
  end

  def show
    if current_user
      @contact_id = params[:id]
      @contact = Contact.find_by(id: @contact_id)
    else 
      redirct_to '/users.sign_in'
    end
    
    render 'show.html.erb'
  end

  def edit
    @contact_id = params[:id]
    @contact = Contact.find_by(id: @contact_id)
    render 'edit.html.erb'
  end

  def update
    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)

    @contact.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number]
    )

    render 'update.html.erb'
  end

  def destroy
    contact_id = params[:id]
    contact = Contact.find_by(id: contact_id)

    contact.destroy

    render 'destroy.html.erb'
  end
  
end