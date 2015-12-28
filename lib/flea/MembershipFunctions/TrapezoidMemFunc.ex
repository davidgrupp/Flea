defmodule Flea.TrapezoidMemFunc do
	defstruct a: 0, b: 0, c: 0, d: 0 
	
	def fuzzify(input_value, %Flea.TrapezoidMemFunc{a: a, b: b, c: c, d: d}) do
        _fuzzify(input_value, a, b, c, d)
	end
	
	def _fuzzify(input_value, a, b, _c, _d) when a <= input_value and input_value < b do
		(input_value - a) / (b - a)
	end
	
	def _fuzzify(input_value, _a, b, c, _d) when b<= input_value and input_value <= c do
		1
	end
	
	def _fuzzify(input_value, _a, _b, c, d) when c < input_value and input_value <= d do
		(d - input_value) / (d - c)
	end
	
	def _fuzzify(_input_value, _a, _b, _c, _d), do: 0
	
	def min(%{a: a}), do: a
	
	def max(%{d: d}), do: d
end