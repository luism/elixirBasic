ExUnit.start

defmodule ListTest do
  use ExUnit.Case

  def sample do
    ["Lucho", "Juan Pi", "Carlos", "Isaias", "Luis", "Matias", "Ale"] #Complete with rest of members
  end

  test "sigil" do
    assert #?
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
    assert #? == 37.5
  end


  test "wrap" do
    assert  #?
  end

  # Enum names with contains 'c'
  test "Enum.filter_map" do
     assert #?
  end

  test "list comprehension" do
    assert #?
  end

  #? Create a hug list >1MM and make the revert
  test "manual reverse speed" do
    assert #reversed == Enum.to_list(1MM..1)
    IO.puts "manual reverse took #{microsec} microsecs"
  end

   test "speed of inserting at the end of a list" do
    assert #reversed == Enum.to_list(1..1MM+1)
    IO.puts "inserting at the end of a list took #{microsec} microsecs"
  end

  test "Enum.reverse speed" do
    assert #reversed == Enum.to_list(1MM..1)
    IO.puts "Enum.reverse took #{microsec} microsecs"
  end
end
