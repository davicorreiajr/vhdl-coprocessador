library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.fixed_float_types.all;
use work.fixed_pkg.all;

entity divisor is
  port (
    numerator, denominator: in STD_LOGIC_VECTOR(31 downto 0);
    result: out STD_LOGIC_VECTOR(31 downto 0)
  );
end divisor;

architecture divisor of divisor is
  signal numerator_fixed: sfixed(19 downto -12);
  signal denominator_fixed: sfixed(19 downto -12);
  signal sResult: sfixed(19 downto -12);
begin
  numerator_fixed <= to_sfixed(numerator, numerator_fixed);
  denominator_fixed <= to_sfixed(denominator, denominator_fixed);
  sResult <= numerator_fixed / denominator_fixed;
  result <= to_slv(sResult(38 downto 7));
end;
