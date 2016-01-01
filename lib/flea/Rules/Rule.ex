defmodule Flea.Rule do
    defstruct premise: nil, conculsion: nil 

    def if(conditions) do
        %Flea.Premise{}
    end
    
    def then(premise, conculsion) do
        %Flea.Rule{ premise: premise, conculsion: conculsion}
    end
end
