defmodule BattleshipWeb.Layouts.SwiftUI do
  use BattleshipNative, [:layout, format: :swiftui]

  embed_templates "layouts_swiftui/*"
end
