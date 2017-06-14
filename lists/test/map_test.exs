defmodule MapTestTest do
  use ExUnit.Case
  doctest MapTest

  test "Map.get" do
    assert Map.get(MapTest.sample, :name) == "Luis"#get 
  end

  test "[]" do
    #?any attribute using []
    assert MapTest.sample[:name] == "Luis"
    #?non exist attribute using []
    assert MapTest.sample[:non_existent] == nil
  end

#   test "." do
#     assert #?any attribute using .
#     assert #?non exist attribute using . using assert raise
#   end

#   test "Map.fetch" do
#     {:ok, val} = #?
#     assert val == #Value
#     :error = #error
#   end

#   test "Map.put" do
#     assert #?
#   end

#   test "Update map using pattern matching syntax" do
#     assert #?
#     # It doesn't work if you want to add new keys. Use  using assert raise
#   end

#   test "Map.values ordered" do
#     assert #?
#   end
end
