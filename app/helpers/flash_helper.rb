module FlashHelper
    def flash_fix(name)
        case name
        when "notice" then "success"
        when "info" then "info"
        when "success" then "success"
        end
    end
    
end