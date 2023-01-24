class ApplicationController < ActionController::API
    def jwt_key
        Rails.application.credentials.jwt_key
    end

    def issue_token(user)
        JWT.encode(user, jwt_key, "HS256")
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, jwt_key, true, { :algorithm => 'HS256' })
            rescue JWT::DecodeError
                nil
            end   
        end 
    end
    
    def auth_header
        request.headers["Authorization"]
    end

    def user_id
        if decoded_token
            decoded_token[0]["user_id"]
        end
    end

    def current_user
        if decoded_token
            @user ||= User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!current_user
    end
end
