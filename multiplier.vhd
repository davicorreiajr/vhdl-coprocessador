library IEEE;
use IEEE.std_logic_1164.all;

entity multiplier is
  port (
    multiplier, multiplicand: in STD_LOGIC_VECTOR(31 downto 0);
    result: out STD_LOGIC_VECTOR(31 downto 0)
  );
end multiplier;

architecture multiplier of multiplier is
  type float32 is float(19 downto -12);
  signal multiplier_float: float32;
  signal multiplicand_float: float32;
begin
  multiplier_float <= to_float(multiplier, multiplier_float);
  multiplicand_float <= to_float(multiplicand, multiplicand_float);
  result <= to_std_logic_vector(multiplier_float * multiplicand_float);
end;