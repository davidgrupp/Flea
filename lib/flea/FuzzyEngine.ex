defmodule Flea.FuzzyEngine do
    def defuzzify(rules, input_values) do
        rules
        |> Enum.map(fn %{ premise_conditions: premise_conditions, conculsion: conculsion } ->
            premise_value = Flea.RuleEvaluator.evaluate(premise_conditions, input_values)
            { :asdf, premise_value }
        end)
    end
end