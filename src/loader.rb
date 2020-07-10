# frozen_string_literal: true

module YourName
  # # #
  module ExtensionName
    Sketchup.require 'PluginName/toolname'

    unless file_loaded?(__FILE__)
      model = Sketchup.active_model
      # --------------------------------
      # Add menu...
      # --------------------------------
      menu = UI.menu('Plugins')
      menu.add_item('ToolName') do
        model.select_tool YourName::PluginName::ToolName.new
      end
      # --------------------------------
      # Add toolbar...
      # --------------------------------
      tb = UI::Toolbar.new 'PluginName'
      # --------------------------------
      # Add Command...
      # --------------------------------
      cmd = UI::Command.new('ToolName') do
        model.select_tool YourName::PluginName::ToolName.new
      end
      cmd.small_icon = 'assets/ToolName16.png'
      cmd.large_icon = 'assets/ToolName24.png'
      cmd.tooltip = 'Write tooltip text here.'
      cmd.status_bar_text = 'Write status bar text here.'
      cmd.menu_text = 'Write menu text here.'
      tb = tb.add_item cmd
      # --------------------------------
      tb.get_last_state == TB_NEVER_SHOWN ? tb.show : tb.restore
      file_loaded(__FILE__)

    end
  end
end
