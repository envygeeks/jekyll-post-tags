# Frozen-string-literal: true
# Copyright: 2016 - 2018 - MIT License
# Author: Jordon Bedwell
# Encoding: utf-8

# --
# Register a hook to create the configuration
# @return [nil]
# --
Jekyll::Hooks.register :site, :after_init do |s|
  s.config["tags"] ||= {
    "layout" => nil, "path" => nil
  }
end

# --
# Register a hook to generate the tags.
# @return [nil]
# --
Jekyll::Hooks.register :site, :pre_render, priority: 99 do |s, _|
  tags = Jekyll::Post::Tags::Drop.to_tags(site: s)
  s.posts.docs.each do |d|
    d.data["tags"] = d.data["tags"].map do |t|
      o = tags.find do |v|
        v == t
      end

      o
    end
  end
end
