module ApplicationHelper

    def full_title(page_title = "")
        base_title = "sample app page"
        if page_title.empty?
            base_title
        else
            "#{page_title} #{base_title}"
        end
    end

end
