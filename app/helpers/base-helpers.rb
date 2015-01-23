module BaseHelpers

    def protected!
        if !session[:uid]
            redirect '/auth/identity'
        end
    end

end
