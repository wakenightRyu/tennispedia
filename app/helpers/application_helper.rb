module ApplicationHelper

    def self.find_by_slug(slug)
        self.all.find{|var| var.slug == slug}
    end

end
