defmodule FleaTest do
  use ExUnit.Case

  test "the truth" do
    assert 1 + 1 == 2
  end
  
  test "usage example" do
    temp_var = Flea.Variable.init("temperature")
    |> Flea.Variable.add_func(:cold, %Flea.TrapezoidMemFunc{ a: 0, b: 0, c: 20, d: 40 })
    |> Flea.Variable.add_func(:warm, %Flea.TriangleMemFunc{ a: 30, b: 50, c: 70 })
    |> Flea.Variable.add_func(:hot, %Flea.TrapezoidMemFunc{ a: 50, b: 80, c: 100, d: 100 })
    
    power_var = Flea.Variable.init("power")
    |> Flea.Variable.add_func(:low, %Flea.TrapezoidMemFunc{ a: 0, b: 25, c: 50 })
    |> Flea.Variable.add_func(:high, %Flea.TriangleMemFunc{ a: 25, b: 50, c: 75 })
    
    #engine
    
    #create rules
    
    #defuz
    
    assert Enum.count(temp_var.memfuncs) == 3
    assert Enum.count(power_var.memfuncs) == 2
  end
  
end
