class AppsController < ApplicationController
before_action :set_app, only: [:update]

def index
    @q = App.ransack(params[:q])
    @apps = @q.result(distinct: true)
    render json: @apps, status: :ok
end

def show
    byebug
    app = App.find_by(show_app_params)
    if app
        render json: app, status: :ok
    else
        render json: { error: "Application not found" }, status: :not_found  
    end
end


def create
    app = App.new(app_params)
    if app.save!
        render json: app, status: :created
    else
        render json: app.errors, status: :unprocessable_entity
    end
end

def update
    if @app.update(app_params)
    render json: @app, status: :ok
    else
    render json: @app.errors, status: :unprocessable_entity
    end
end


# def search

# end



def app_params
params.require(:apps).permit(:name)
end

def show_app_params
    params.permit(:name)
end

def set_app
    @app = App.find_by(name: params[:name])
    render json: { error: "App not found" }, status: :not_found unless @app
end


end
