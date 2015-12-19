defmodule Flea.TriangleMemFunc do
	defstruct a: 0, b: 0, c: 0
	
	def fuzzify(input_value, params) do
		trap_params = %Flea.TrapezoidMemFunc{ a: params.a, b: params.b, c: params.b, d: params.c}
		Flea.TrapezoidMemFunc.fuzzify(input_value, trap_params)
	end 
	
	def min(params), do: params.a
	
	def max(params), do: params.c
end