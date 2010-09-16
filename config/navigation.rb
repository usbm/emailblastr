# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|  
  # Specify a custom renderer if needed. 
  # The default renderer is SimpleNavigation::Renderer::List which renders HTML lists.
  # The renderer can also be specified as option in the render_navigation call. 
  # navigation.renderer = Your::Custom::Renderer
  
  # Specify the class that will be applied to active navigation items. Defaults to 'selected'
  navigation.selected_class = 'active'
    
  # Item keys are normally added to list items as id.
  # This setting turns that off
  # navigation.autogenerate_item_ids = false
  
  # You can override the default logic that is used to autogenerate the item ids.
  # To do this, define a Proc which takes the key of the current item as argument.
  # The example below would add a prefix to each key.
  # navigation.id_generator = Proc.new {|key| "my-prefix-#{key}"}

  # The auto highlight feature is turned on by default.
  # This turns it off globally (for the whole plugin)
  # navigation.auto_highlight = false

  # Define the primary navigation
  navigation.items do |primary|
    # Add an item to the primary navigation. The following params apply:
    # key - a symbol which uniquely defines your navigation item in the scope of the primary_navigation
    # name - will be displayed in the rendered navigation. This can also be a call to your I18n-framework.
    # url - the address that the generated item links to. You can also use url_helpers (named routes, restful routes helper, url_for etc.)
    # options - can be used to specify attributes that will be included in the rendered navigation item (e.g. id, class etc.)
    #           some special options that can be set:
    #           :if - Specifies a proc to call to determine if the item should
    #                 be rendered (e.g. <tt>:if => Proc.new { current_user.admin? }</tt>). The
    #                 proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :unless - Specifies a proc to call to determine if the item should not
    #                     be rendered (e.g. <tt>:unless => Proc.new { current_user.admin? }</tt>). The
    #                     proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :method - Specifies the http-method for the generated link - default is :get.
    #           :highlights_on - if autohighlighting is turned off and/or you want to explicitly specify 
    #                            when the item should be highlighted, you can set a regexp which is matched 
    #                            against the current URI.
    #
    primary.item :home, "Home", root_path
    primary.item :dashboard, "Dashboard", dashboard_path, :if => Proc.new { current_user }
    primary.item :lists, "My Lists", lists_path, :if => Proc.new { current_user } do |subnav|
      current_user.lists.where('created_at IS NOT ?', nil).each do |list|
        subnav.item dom_id(list), list.name, list_path(list) do |subsubnav|
          subsubnav.item "#{dom_id(list)}_subscribers", "Subscribers", list_subscribers_path(list)
        end
      end
      subnav.item :new_list, "New List", new_list_path
    end
    primary.item :messages, "My Messages", blast_messages_path, :if => Proc.new { current_user } do |subnav|
      subnav.item :blast_messages, "Blast messages", blast_messages_path do |subsubnav|
        subsubnav.item :new_blast_message, "New message", new_blast_message_path
      end
      subnav.item :autoresponders, "Autoresponders", '#' do |subsubnav|
        current_user.lists.where('created_at IS NOT ?', nil).each do |list|
          subsubnav.item "#{dom_id(list)}_autoresponders", list.name, list_autoresponders_path(list)
        end
      end
      subnav.item :reply_tos, "Reply-to Addresses", reply_tos_path do |subsubnav|
        subsubnav.item :new_reply_to, "New Reply-to Address", new_reply_to_path
      end
    end
    
    primary.dom_id = 'nav'

    # you can also specify a css id or class to attach to this particular level
    # works for all levels of the menu
    # primary.dom_id = 'menu-id'
    # primary.dom_class = 'menu-class'
    
    # You can turn off auto highlighting for a specific level
    # primary.auto_highlight = false
  
  end
  
end