library ieee;
use ieee.std_logic_1164.all;
library ieee_proposed;
use ieee_proposed.fixed_pkg.all;

entity divisor is
  port (
    numerator, denominator: in STD_LOGIC_VECTOR(31 downto 0);
    result: out STD_LOGIC_VECTOR(31 downto 0)
  );
end divisor;

architecture divisor of divisor is
  type fixed is sfixed(19 downto -12);
  signal numerator_fixed: fixed;
  signal denominator_fixed: fixed;
begin
  numerator_fixed <= to_sfixed(numerator, numerator_fixed);
  denominator_fixed <= to_sfixed(denominator, denominator_fixed);
  result <= to_slv(numerator_fixed / denominator_fixed);
end;