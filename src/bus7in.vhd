library IEEE; 
use IEEE.STD_LOGIC_1164.all;

entity bus7in is
  port (
    in1: in STD_LOGIC_VECTOR(31 downto 0);
    in2: in STD_LOGIC_VECTOR(31 downto 0);
    in3: in STD_LOGIC_VECTOR(31 downto 0);
    in4: in STD_LOGIC_VECTOR(31 downto 0);
    in5: in STD_LOGIC_VECTOR(31 downto 0);
    in6: in STD_LOGIC_VECTOR(31 downto 0);
    in7: in STD_LOGIC_VECTOR(31 downto 0);
    control: in STD_LOGIC_VECTOR(2 downto 0);
    out1: out STD_LOGIC_VECTOR(31 downto 0)
  );
end bus7in;

architecture bus7in of bus7in is
begin
  process(all)
  begin
    case control is
      when "000" => out1 <= in1;
      when "001" => out1 <= in2;
      when "010" => out1 <= in3;
      when "011" => out1 <= in4;
      when "100" => out1 <= in5;
      when "101" => out1 <= in6;
      when "110" => out1 <= in7;
      when "111" => out1 <= (others => '0');
    end case;
  end process;
end;