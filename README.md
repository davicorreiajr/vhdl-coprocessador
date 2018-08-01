# vhdl-coprocessador
Projeto de Organização e Arquitetura de Computadores 2 - implementação de um coprocessador de sin/cos

## Detalhes
O coprocessador aceita como entrada (e também devolve como saída) 16 bits, sendo 4 para parte inteira e 12 para decimal. Internamente, ele trabalha com uma quantia maior de bits, a fim de garantir precisão: 32 bits, sendo 20 para parte inteira e 12 para decimal.

## Como simular o projeto no vivado
Para testarmos o código e rodar as simulações utilizamos a versão 2018.2 do Vivado

Inicialmente precisamos criamos um projeto no Vivado. Criamos um projeto do tipo "RTL Project", adicionamos o arquivo "toplevel-testbench-coprocessor.vhd" e colocamos "Target language" e "Simulator Language" como "VHDL". A placa usada foi a "xc7a100tcsg324-3".

Para rodarmos o projeto, precisamos adicionar algumas bibliotecas manualmente ao Vivado:
```
	fixed_float_types_c.vhd
	fixed_pkg_2008.vdh
```
Para adicioná-las vá na parte "Sources" -> "Library", clique com o botão direito e selecione "Add sources" (ou clique no símbolo "+"). Selecione "Add or create design sources" e depois "Add Files". Essas bibliotecas vem junto do Vivado 2018.2, elas estão localizadas em `C:\Xilinx\Vivado\2018.2\scripts\rt\data`

Após isso, você deve encontrar o arquivo do coprocessador e as bibliotecas adicionadas em "Sources" -> "Libraries" na pasta "Design Sources/VHDL/xil_defaultlib". Agora precisamos mudar o tipo de todos os arquivos para "VHDL 2008" e a biblioteca para "work", isso pode ser feito em "Properties". Após isso, o arquivo do coprocessador e as libs adicionadas devem estar na pasta "Design Sources/VHDL 2008/work".

Após isso, basta rodar a síntese do projeto (Run Synthesis) e após isso, rodar a simulação (Run Simulation)