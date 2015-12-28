defmodule Flea.CoGDefuzzification do
	def defuzzify(memfuncs, premise_modifiers) do
		
		memfuncsmods = memfuncs |> Enum.map(fn {name, mf} -> { name, mf.__struct__, mf } end)
		
        #mod = module that has the membership function fuzzify
		minX = memfuncsmods |> Enum.map(fn {_, mod, f} -> mod.min(f) end) |> Enum.min
		maxX = memfuncsmods |> Enum.map(fn {_, mod, f} -> mod.max(f) end) |> Enum.max
		
		{sum_total, sumx_total} = 
		minX..maxX 
		|> Enum.map(fn i ->
            max_at_x = memfuncsmods
				|> Enum.map(fn {name, mod, f} -> Enum.min([premise_modifiers[name], mod.fuzzify(i, f)]) end)
				|> Enum.max
			{max_at_x, i * max_at_x}
		end)
		|> Enum.reduce(fn {sum, sumx}, {sum_acc, sumx_acc} -> 
			{sum + sum_acc, sumx + sumx_acc}
		end)
		
		sumx_total / sum_total
	end
end