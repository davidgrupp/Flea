defmodule VariableTest do
  use ExUnit.Case

  test "init" do
    result = Flea.Variable.init("temperature")
    assert result.name == "temperature"
  end
  
  test "addfunc" do
    low_memfunc = %Flea.TrapezoidMemFunc{ a: 0, b: 0, c: 20, d: 40 } 
	  expected = 1
    var = Flea.Variable.init("temperature")
    |> Flea.Variable.add_func(:low, low_memfunc)
	  assert Enum.count(var.memfuncs) == expected
  end
end
