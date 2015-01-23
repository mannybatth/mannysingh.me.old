module ApplicationHelpers

    def protected!
        if !session[:uid]
            redirect to('/auth/identity')
        end
    end

end
