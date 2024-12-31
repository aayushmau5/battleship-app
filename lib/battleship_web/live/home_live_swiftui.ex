defmodule BattleshipWeb.HomeLive.SwiftUI do
  use BattleshipNative, [:render_component, format: :swiftui]

  def render(assigns, _) do
    ~LVN"""
    <VStack>
      <Text>
        Hello from battleship LVN app
      </Text>
      <Button><Text>Text Button</Text></Button>
    </VStack>
    """
  end
end
