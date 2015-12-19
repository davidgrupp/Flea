defmodule Flea.TriangleMemFunc do
	defstruct a: 0, b: 0, c: 0
	
	def fuzzify(input_value, %Flea.TriangleMemFunc{a: a, b: b, c: c}) do
		trap_params = %Flea.TrapezoidMemFunc{ a: a, b: b, c: b, d: c}
		Flea.TrapezoidMemFunc.fuzzify(input_value, trap_params)
	end 
	
	def min(%{a: a}), do: a
	
	def max(%{c: c}), do: c
end