class Api::V1::UsersController < ApplicationController

    # GET /api/v1/users    
    def index
        @users = User.all
    end

    # GET /api/v1/users/:id
    def show
        user = User.find_by(id: params[:id])
        if user
            render json: user, status: 200
        else
            render json: {error: "Cliente não foi localizado."}
        end
    end

    # POST /api/v1/users
    def create
        @user = User.new(usr_params)
        if @user.save
            render json: @user, include: :orders, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /api/v1/users/1
    #falta finalizar implementação
    def update
        if @user.update(usr_params)
            render json: @user
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    # DELETE /api/v1/users/1
    #falta finalizar implementação
    def destroy
      User.find(params[:id]).destroy!
      head :no_content  
    end

    private
    def usr_params
      params.require(:user).permit(:name, :cpf, :email)
    end  

end
