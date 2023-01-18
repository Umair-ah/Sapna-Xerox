module FlashHelper
    def flash_fix(name)
        case name
            when "notice" then "warning"
            when "info" then "info"
            when "success" then "success"
        
            when name.nil? then "warning"
        end
    end
    
end