class ChatsController < ApplicationController
    before_action :set_app, only: [:create, :index] 
    before_action :set_chat, only: [:show, :update]

    def index
        @q = Chat.ransack(params[:q])
        @chats = @q.result(distinct: true)
        render json: @chats, status: :ok
    end

    def show
        # chat = @app.chats.find_by(chatroom: params[:chatroom])
        # if app
        #     render json: chat, status: :ok
        # else
        #     render json: { error: "chat not found" }, status: :not_found  
        # end
        render json: @chat, status: :ok

    end



    def create
        byebug
        chat = @app.chats.new(chat_params)
        if chat.save!
            render json: chat, status: :created
        else
            render json: chat.errors, status: :unprocessable_entity
        end
    end


    def update
        byebug
        if @chat.update(chat_params)
        render json: @chat, status: :ok
        else
        render json: @chat.errors, status: :unprocessable_entity
        end
    end



    def set_app
        @app = App.find_or_create_by(name: app_params[:app_name])
    end

    def set_chat
        @chat = Chat.find_by(chat_number: params[:chat_number])
        render json: { error: "Chat not found" }, status: :not_found unless @chat

    end

    def app_params
        # byebug
        params.permit(:name)
    end

    def chat_params
        params.require(:chats).permit(:chatroom)
    end

    # def update_chat_params
    #     params.require(:chats).permit(:chatroom)
    # end
end
