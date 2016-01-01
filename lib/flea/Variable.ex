defmodule Flea.Variable do
  defstruct name: nil, memfuncs: HashDict.new
  
  def init(name) do
    %Flea.Variable { name: name }
  end
  
  def add_func(var, name, memfunc) do
     memfuncs = Dict.put(var.memfuncs, name, memfunc)
     Map.put(var, :memfuncs, memfuncs )
  end
  
end