defmodule ListTestTest do
  use ExUnit.Case
  doctest ListTest

  test "sigil" do
    list = ~w(JuanPi Luis Nico)
    assert list == ["JuanPi", "Luis", "Nico"]
  end

  test "head" do
    [head | _tail] = ListTest.sample
    assert head == "Lucho"
  end

  test "tail" do
    [_head | tail] = ListTest.sample
    assert tail == ["Juan Pi", "Carlos", "Isaias", "Luis", "Matias", "Ale"]
  end

  test "last item" do
    assert List.last(ListTest.sample) == "Ale"
  end

  test "delete item" do
    new_list = List.delete(ListTest.sample, "Isaias")
    assert new_list == ["Lucho", "Juan Pi", "Carlos", "Luis", "Matias", "Ale"]
  end

  test "List.fold" do
    list = [20, 10, 5, 2.5]
    assert List.foldl(list, 0, fn(x, acc) -> x + acc end) == 37.5
  end

  test "Enum.reduce" do
    list = [20, 10, 5, 2.5]
    assert Enum.reduce(list, fn(x, acc) -> x + acc end) == 37.5
  end

  test "wrap" do
    assert List.wrap(ListTest.sample) == ListTest.sample
  end

  # Enum names with contains 'c'
  test "Enum.filter_map" do
    list = 1..10
    odd_square = Enum.filter_map(list, fn(x) -> rem(x,2) == 0 end, &(&1 * &1))
    assert odd_square == [4, 16, 36, 64, 100]
  end

  test "list comprehension" do
    hello_list = for k <- ListTest.sample, do: "Hello " <> k <>"!"
    assert hello_list == ["Hello Lucho!", "Hello Juan Pi!", "Hello Carlos!", "Hello Isaias!", "Hello Luis!", "Hello Matias!", "Hello Ale!"]
  end

  #? Create a hug list >1MM and make the revert
  test "manual reverse speed" do
    reversed = Enum.to_list(1000000..1)
    {microsecs, _} = :timer.tc fn ->
      Enum.reduce(reversed,[], fn (x, acc) -> List.insert_at(acc, 0, x) end)
    end
    IO.puts "manual reverse took #{microsecs} microsecs"
    assert 1 == 1
  end

   test "speed of inserting at the end of a list" do
    reversed = Enum.to_list(1..1000000)
    {microsecs, _} = :timer.tc fn -> List.insert_at(reversed, -1, -1) end
    IO.puts "inserting at the end of a list took #{microsecs} microsecs"
    assert 1 == 1
  end

  test "Enum.reverse speed" do
    reversed = Enum.to_list(1000000..1)
    {microsecs, _} = :timer.tc fn -> Enum.reverse(reversed) end
    IO.puts "Enum.reverse took #{microsecs} microsecs"
    assert 1 == 1
  end
end
