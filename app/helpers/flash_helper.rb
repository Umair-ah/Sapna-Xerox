module FlashHelper
    def flash_fix(name)
        case name
        when "notice" then "success"
        when "info" then "info"
        when "success" then "success"
        when "" then "warning"
        end
    end
    
end