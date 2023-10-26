class Api::V1::UserController < ApplicationController
    def login
        @user = User.find_by(name: user_params[:name])
        if @user
          render json: {
            status: { code: 200, message: 'signed in successfuly', data: @user }
          }, status: :ok
        else
          render json: { error: 'User not found' }, status: :not_found
        end
      end
    
      private
    
      def user_params
        params.require(:user).permit(:name)
      end
end
