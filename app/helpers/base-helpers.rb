module BaseHelpers

    def protected!
        if !session[:uid]
            redirect to('/auth/identity')
        end
    end

end
