defmodule Flea.RuleEvaluator do
    def evaluate(rule_conditions, input_values) do
        rule_conditions
        |> Enum.map(fn %Flea.RuleCondition{
                conjunction: conjunction,
                clause: %Flea.RuleClause{ variable: variable, operator: operator, mem_func: mem_func }
            } -> 
            condition_value = mem_func.__struct__.fuzzify(input_values[variable], mem_func)
            
            if operator == :is do
                { condition_value, conjunction}
            else
                { 1 - condition_value, conjunction}
            end
        end)
        |> Enum.reduce(fn {condition_value, conjunction}, acc ->
            acc = 
            case conjunction do
                :and when condition_value < acc -> conditionValue
                :or when condition_value > acc -> conditionValue
                _ -> acc
            end
        end)
    end
end