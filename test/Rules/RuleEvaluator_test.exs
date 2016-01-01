  defmodule RuleEvaluatorTest do
  use ExUnit.Case
  
    test "evaluate single - v IS f - 0.5", do: evaluate_single({ 0, 0, 10, 20, :is, 15, 0.5 })
    test "evaluate single - v NOT f - 0.5", do: evaluate_single({ 0, 0, 10, 20, :isnot, 15, 0.5 })
    test "evaluate single - v IS f - 0.75", do: evaluate_single({ 0, 0, 10, 20, :is, 12.5, 0.75 })
    test "evaluate single - v NOT f - 0.25", do: evaluate_single({ 0, 0, 10, 20, :isnot, 12.5, 0.25 })
    test "evaluate single - v IS f - 1", do: evaluate_single({ 0, 0, 10, 20, :is, 5, 1 })
    test "evaluate single - v NOT f - 0", do: evaluate_single({ 0, 0, 10, 20, :isnot, 5, 0 })
  
    def evaluate_single({ a, b, c, d, is_op, val, expected_result }) do

        mem_func = %Flea.TrapezoidMemFunc{ a: a, b: b, c: c, d: d }
        cond1 = %Flea.RuleCondition{ clause: %Flea.RuleClause{ variable: :v, operator: is_op, mem_func: mem_func } }
        
        input_values = [{ :v, val }]
        conditions = [cond1]
        
        result = Flea.RuleEvaluator.evaluate(conditions, input_values)
        
        assert result == expected_result
    end
    
    
    test "evaluate double - v1 IS f1 AND v2 IS f2", do: evaluate_double({ 0, 10, 20, :is, :and, 0, 10, 30, :is, 15, 0.5 })
    test "evaluate double - v1 IS f1 AND v2 NOT f2", do: evaluate_double({ 0, 10, 20, :is, :and, 0, 10, 30, :isnot, 15, 0.25 })
    test "evaluate double - v1 IS f1 OR v2 IS f2", do: evaluate_double({ 0, 10, 20, :is, :or, 0, 10, 30, :is, 15, 0.75 })
    test "evaluate double - v1 IS f1 OR v2 NOT f2", do: evaluate_double({ 0, 10, 20, :is, :or, 0, 10, 30, :isnot, 15, 0.5 })
  
    def evaluate_double({ a1, b1, c1, is_op1, conj, a2, b2, c2, is_op2, val, expected_result }) do

        mem_func1 = %Flea.TriangleMemFunc{ a: a1, b: b1, c: c1 }
        cond1 = %Flea.RuleCondition{ clause: %Flea.RuleClause{ variable: :v1, operator: is_op1, mem_func: mem_func1 } }
        
        mem_func2 = %Flea.TriangleMemFunc{ a: a2, b: b2, c: c2 }
        cond2 = %Flea.RuleCondition{ conjunction: conj, clause: %Flea.RuleClause{ variable: :v2, operator: is_op2, mem_func: mem_func2 } }
    
        input_values = [{ :v1, val }, { :v2, val }]
        conditions = [cond1, cond2]
        
        result = Flea.RuleEvaluator.evaluate(conditions, input_values)
        
        assert result == expected_result
    end
  
  end