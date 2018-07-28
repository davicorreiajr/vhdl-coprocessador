library IEEE;
use IEEE.std_logic_1164.all;

entity register is
  port(
    clock, enable, clear: in STD_LOGIC;
    input: in STD_LOGIC_VECTOR(31 downto 0);
    output: out STD_LOGIC_VECTOR(31 downto 0)
  );
end register;

architecture register of register is
begin
  process(clock, enable, clear)
  begin
    if rising_edge(clock) then
      if clear = '1' then
        output <= (others => '0');
      elsif enable = '1' then
        output <= input;
      end if;
    end if;
  end process;
end;