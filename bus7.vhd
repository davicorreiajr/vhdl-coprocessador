library IEEE; 
use IEEE.STD_LOGIC_1164.all;

entity bus7 is
  port (
    in1: in STD_LOGIC_VECTOR(31 downto 0);
    in2: in STD_LOGIC_VECTOR(31 downto 0);
    in3: in STD_LOGIC_VECTOR(31 downto 0);
    in4: in STD_LOGIC_VECTOR(31 downto 0);
    in5: in STD_LOGIC_VECTOR(31 downto 0);
    in6: in STD_LOGIC_VECTOR(31 downto 0);
    in7: in STD_LOGIC_VECTOR(31 downto 0);
    control: out STD_LOGIC_VECTOR(2 downto 0);
    output: out STD_LOGIC_VECTOR(31 downto 0)
  );
end bus7;

architecture arch of bus7 is
  process(all)
  begin
    case control is
      when "000" => output <= in1;
      when "001" => output <= in2;
      when "010" => output <= in3;
      when "011" => output <= in4;
      when "100" => output <= in5;
      when "101" => output <= in6;
      when "110" => output <= in7;
      when "111" => output <= (others => '0');
    end case;
  end process;
end;