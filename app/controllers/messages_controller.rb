class MessagesController < ApplicationController
    before_action :set_app, only: [:create] 
    before_action :set_chat, only: [:create, :index]
    before_action :set_message, only: [:show, :update]

    # def index
    #     message = @chat.messages
    #     render json: message, status: :ok
    # end

    def index
        @q = Message.ransack(params[:q])
        @messages = @q.result(distinct: true)
        render json: @messages, status: :ok
    end

    # def search
    #     index
    #     render :index
    # end

    def show
        render json: @message, status: :ok

    end

    def create
        #  byebug
        message = @chat.messages.new(message_params)
        if message.save!
            render json: message, status: :created
        else
            render json: message.errors, status: :unprocessable_entity
        end
    end

    def update
        if @message.update(message_params)
        render json: @message, status: :ok
        else
        render json: @message.errors, status: :unprocessable_entity
        end
    end


    def set_app
        
        @app = App.find_or_create_by(name: app_params[:app_app_name])
        render json: { error: "App not found" }, status: :not_found unless @app    

        
    end
    
    def set_chat
        # byebug
        @chat = Chat.find_by(chatroom: chat_params[:chat_chat_number])
        render json: { error: "Chat not found" }, status: :not_found unless @chat    
    end

    def set_message
        # byebug
        @message = Message.find_by(message_number: show_message_params[:message_number])
        render json: { error: "Message not found" }, status: :not_found unless @message    
    end

    def app_params
        # byebug
        params.permit(:app_name)
    end

    def chat_params
        # byebug
        params.permit(:chat_number)
    end

    def show_message_params
        params.permit(:message_number)
    end

    def message_params
        params.require(:messages).permit(:text)
    end

end
