library IEEE;
use IEEE.std_logic_1164.all;

entity register is
  port(
    clock, enable, clear: in STD_LOGIC;
    in1: in STD_LOGIC_VECTOR(31 downto 0);
    out1: out STD_LOGIC_VECTOR(31 downto 0)
  );
end register;

architecture register of register is
begin
  process(clock, enable, clear)
  begin
    if rising_edge(clock) then
      if clear = '1' then
        out1 <= (others => '0');
      elsif enable = '1' then
        out1 <= in1;
      end if;
    end if;
  end process;
end;