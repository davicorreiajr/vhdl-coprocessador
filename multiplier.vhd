library ieee;
use ieee.std_logic_1164.all;
library ieee_proposed;
use ieee_proposed.fixed_pkg.all;

entity multiplier is
  port (
    multiplier, multiplicand: in STD_LOGIC_VECTOR(31 downto 0);
    result: out STD_LOGIC_VECTOR(31 downto 0)
  );
end multiplier;

architecture multiplier of multiplier is
  type fixed is sfixed(19 downto -12);
  signal multiplier_fixed: fixed;
  signal multiplicand_fixed: fixed;
begin
  multiplier_fixed <= to_sfixed(multiplier, multiplier_fixed);
  multiplicand_fixed <= to_sfixed(multiplicand, multiplicand_fixed);
  result <= to_slv(multiplier_fixed * multiplicand_fixed);
end;