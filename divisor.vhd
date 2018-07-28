library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.float_pkg.all;

entity divisor is
  port (
    numerator, denominator: in STD_LOGIC_VECTOR(31 downto 0);
    result: out STD_LOGIC_VECTOR(31 downto 0)
  );
end divisor;

architecture arch of divisor is
  type float32 is float(18 downto -13);
  signal numerator_float: float32;
  signal denominator_float: float32;
begin
  numerator_float <= to_float(numerator, numerator_float);
  denominator_float <= to_float(denominator, denominator_float);
  result <= to_std_logic_vector(numerator_float / denominator_float);
end;