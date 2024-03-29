defmodule BinarySearchTree do
  @type bst_node :: %{data: any, left: bst_node | nil, right: bst_node | nil}

  @doc """
  Create a new Binary Search Tree with root's value as the given 'data'
  """
  @spec new(any) :: bst_node
  def new(data) do
    %{data: data, left: nil, right: nil}
  end

  @doc """
  Creates and inserts a node with its value as 'data' into the tree.
  """
  @spec insert(bst_node, any) :: bst_node
  def insert(nil, data) do
    new(data)
  end

  def insert(tree, data) do
    if tree.data >= data do
      Map.put(tree, :left, insert(tree.left, data))
    else
      Map.put(tree, :right, insert(tree.right, data))
    end
  end

  @doc """
  Traverses the Binary Search Tree in order and returns a list of each node's data.
  """
  @spec in_order(bst_node) :: [any]
  def in_order(nil) do
    []
  end

  def in_order(%{data: data, left: nil, right: nil}) do
    [data]
  end

  def in_order(%{data: data, left: left_tree, right: right_tree}) do
    in_order(left_tree) ++ [data | in_order(right_tree)]
  end
end
