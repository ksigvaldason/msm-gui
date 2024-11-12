class ActorsController < ApplicationController
  def index
    @list_of_actors = Actor.all.order({ :created_at => :desc })
    render({ :template => "actor_templates/index" })
  end

  def show
    @actor = Actor.where({ :id => params.fetch("path_id") }).first
    @characters = Character.where({ :actor_id => @actor.id })
    render({ :template => "actor_templates/show" })
  end


  def create
    actor = Actor.new
    actor.name = params.fetch("query_name")
    actor.dob = params.fetch("query_dob")
    actor.save
    redirect_to("/actors")
  end

  def update
    actor = Actor.where({ :id => params.fetch("path_id") }).first
    actor.image = params.fetch("query_image")
    actor.save
    redirect_to("/actors/#{actor.id}")
  end

  def destroy
    actor = Actor.where({ :id => params.fetch("path_id") }).first
    actor.destroy
    redirect_to("/actors")
  end
end
