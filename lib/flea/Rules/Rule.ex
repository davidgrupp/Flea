defmodule Flea.Rule do
    defstruct premise_conditions: nil, conculsion: nil 

    def if(conditions) do
        # %Flea.Premise{}
        { 1 }
    end
    
    def then(premise, conculsion) do
        %Flea.Rule{ premise_conditions: premise, conculsion: conculsion}
    end
end
