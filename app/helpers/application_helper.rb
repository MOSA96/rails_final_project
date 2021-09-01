module ApplicationHelper
    # Returns the full title on a per-page basis.
    def full_title(page_title = '')
        base_title = "Ruby on Rails Tutorial Sample App"
        if page_title.empty?
            test
                base_title
        else
            page_title + " | " + base_title
        end
    end
    
    
    
    
end
    
    

