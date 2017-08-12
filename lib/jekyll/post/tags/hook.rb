# Frozen-String-Literal: true
# Copyright 2016 - 2017 Jordon Bedwell - MIT License
# Encoding: UTF-8

Jekyll::Hooks.register :site, :pre_render, priority: 99 do |s, p|
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
