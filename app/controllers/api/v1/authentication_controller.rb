module Api
    module V1
      class AuthenticationController < ApplicationController
        def login
            puts "DEBUG: Params received -> #{params.inspect}"

          provided_username = params[:username]
          provided_password = params[:password]
  
          correct_username = Rails.application.credentials.admin[:username]
          correct_password = Rails.application.credentials.admin[:password]
  
          if provided_username == correct_username && provided_password == correct_password
            token = generate_token(provided_username)
            render json: { token: token }, status: :ok
          else
            render json: { error: "Invalid credentials" }, status: :unauthorized
          end
        end
  
        private
  
        def generate_token(username)
          secret = Rails.application.credentials.secret_key_base
          JWT.encode({ username: username, exp: 24.hours.from_now.to_i }, secret, "HS256")
        end
      end
    end
  end
  