defmodule EctoExamplesWeb.ComponentTestLive.Components do
  use Phoenix.Component

  @doc """
  When the unused @c assign changes, this component is re-rendered _anyway_ because
  the diff tracker doesn't know if @c is used in the variable assignment
  """
  def sum_with_variable_in_heex(assigns) do
    ~H"""
      <% sum = @a + @b %>
      <p>The total is <%= sum %></p>
    """
  end

  @doc """
  When the unused @c assign changes, this component is re-rendered _anyway_ because
  the diff tracker doesn't know if @c is used in the variable assignment
  """
  def sum_with_variable_in_function(assigns) do
    sum = assigns.a + assigns.b

    ~H"""
      <p>The total is <%= sum %></p>
    """
  end

  @doc """
  When the unused @c assign changes, this component is re-rendered _anyway_ because
  the diff tracker doesn't know if @c is used in the calculation of the assigns
  """
  def sum_with_modified_assigns(assigns) do
    assigns = assign(assigns, :sum, assigns.a + assigns.b)

    ~H"""
      <p>The total is <%= @sum %></p>
    """
  end

  @doc """
  When the unused @c assign changes, this component is NOT re-rendered
  because the diff tracker knows that only @a and @b are used in the HEEX
  """
  def sum_with_inline_computation(assigns) do
    ~H"""
      <p>The total is <%= @a + @b %></p>
    """
  end

  @doc """
  When the unused @c assign changes, this component is NOT re-rendered
  because the diff tracker knows that only @a and @b are used in the HEEX
  and assumes that the `sum/2` function is deterministic and only needs to be
  called again if its arguments change
  """
  def sum_with_helper_function(assigns) do
    ~H"""
      <p>The total is <%= sum(@a, @b) %></p>
    """
  end

  defp sum(a, b), do: a + b
end
