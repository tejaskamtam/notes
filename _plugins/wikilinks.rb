Jekyll::Hooks.register :pages, :post_render do |page|
    page.output.gsub!('![[', '<img src="/Attachments/')
    page.output.gsub!(']]', '">')
    page.output.gsub!('[[', '<a href="')
end
