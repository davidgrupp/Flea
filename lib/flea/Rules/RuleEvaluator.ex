defmodule Flea.RuleEvaluator do
    def evaluate(rule_conditions, input_values) do
        result = rule_conditions
        |> Enum.map(fn %{
                conjunction: conjunction,
                clause: %{ variable: variable, operator: operator, mem_func: mem_func }
            } -> 
            condition_value = mem_func.__struct__.fuzzify(input_values[variable], mem_func)
            
            case operator do
                :is -> { condition_value, conjunction}
                :isnot -> { 1 - condition_value, conjunction}
                _ -> raise "operator not supported. (only :is and :isnot are currently supported)"
            end
        end)
        |> Enum.reduce(0, fn {condition_value, conjunction}, acc ->
            case conjunction do
                :and when condition_value < acc -> condition_value
                :or when condition_value > acc -> condition_value
                nil -> condition_value #first condition conjunction is nil
                _ -> acc
            end
        end)
    end
end