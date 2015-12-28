  defmodule CoGDefuzzificationTest do
  use ExUnit.Case
  
    test "defuzzify" do
      temp_var = Flea.Variable.init(:temperature)
      |> Flea.Variable.add_func(:cold, %Flea.TrapezoidMemFunc{ a: 0, b: 0, c: 20, d: 40 })
      |> Flea.Variable.add_func(:warm, %Flea.TriangleMemFunc{ a: 30, b: 50, c: 70 })
      |> Flea.Variable.add_func(:hot, %Flea.TrapezoidMemFunc{ a: 50, b: 80, c: 100, d: 100 })
      
      premise_modifiers = [{:cold, 1}, {:warm, 1}, {:hot, 1}] |> Enum.into(HashDict.new)
      
      result = Flea.CoGDefuzzification.defuzzify(temp_var.memfuncs, premise_modifiers)
      
      assert result == 2
    end
  
  end