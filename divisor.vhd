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
  signal numerator_fixed: sfixed(19 downto -12);
  signal denominator_fixed: sfixed(19 downto -12);
begin
  numerator_fixed <= to_sfixed(numerator, numerator_fixed);
  denominator_fixed <= to_sfixed(denominator, denominator_fixed);
  result <= to_slv(numerator_fixed / denominator_fixed);
end;