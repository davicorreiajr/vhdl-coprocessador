library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.NUMERIC_STD_UNSIGNED.all;

entity subtractor is
  port(
    a, b: in  STD_LOGIC_VECTOR(31 downto 0);
    y:    out STD_LOGIC_VECTOR(31 downto 0)
  );
end;

architecture subtractor of subtractor is
begin
  y <= a + not b + '1';
end;
