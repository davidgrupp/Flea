defmodule Flea.TrapezoidMemFuncTest do
  use ExUnit.Case

  test "Fuzzify1" do
    params = %Flea.TrapezoidMemFunc{ a: 0, b: 0, c: 20, d: 40 }
	  input_value = 0
	  expected = 1
	  assert Flea.TrapezoidMemFunc.fuzzify(input_value, params) == expected
  end
  
  test "Fuzzify2" do
    params = %Flea.TrapezoidMemFunc{ a: 0, b: 0, c: 20, d: 40 }
	  input_value = 1
	  expected = 1
	  assert Flea.TrapezoidMemFunc.fuzzify(input_value, params) == expected
  end
  
  test "Fuzzify3" do
    params = %Flea.TrapezoidMemFunc{ a: 0, b: 0, c: 20, d: 40 }
	  input_value = 100
	  expected = 0
	  assert Flea.TrapezoidMemFunc.fuzzify(input_value, params) == expected
  end

  test "Fuzzify4" do
    params = %Flea.TrapezoidMemFunc{ a: 0, b: 0, c: 20, d: 40 }
	  input_value = 30
	  expected = 0.5
	  assert Flea.TrapezoidMemFunc.fuzzify(input_value, params) == expected
  end
  
  test "Fuzzify5" do
    params = %Flea.TrapezoidMemFunc{ a: 10, b: 20, c: 30, d: 40 }
	  input_value = 0
	  expected = 0
	  assert Flea.TrapezoidMemFunc.fuzzify(input_value, params) == expected
  end
end
