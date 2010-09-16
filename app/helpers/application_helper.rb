module ApplicationHelper
  def content_block(options = {}, &block)
    options[:title] ||= ''
    options[:class] ||= ''
    
    content_tag(:div, :class => "block #{options[:class]}") do
      content_tag(:div, 
        content_tag(:div,'',:class => 'bheadl') +
        content_tag(:div,'',:class => 'bheadr') +
        content_tag(:h2, options[:title]) + ((options[:links] && options[:links].size > 0) ? content_tag(:ul, options[:links].collect { |a| content_tag(:li,a)}.to_s.html_safe) : ''),
      :class => "block_head") +
      content_tag(:div,:class => 'block_content') do
        yield
      end +
      content_tag(:div,'',:class => 'bendl') +
      content_tag(:div,'',:class => 'bendr')
    end
  end
  
  def button_link_to(text,url,options ={})
    options[:method] ||= :get
    options[:class] ||= 'small'
    options[:class] << ' submit'
    button_to(text,url,options)
  end
end
