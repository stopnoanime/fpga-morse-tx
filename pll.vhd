--------------------------------------------------------------
 --  Copyright (c) 2011-2021 Anlogic, Inc.
 --  All Right Reserved.
--------------------------------------------------------------
 -- Log	:	This file is generated by Anlogic IP Generator.
 -- File	:	C:/Users/mbere/Documents/GitHub/fpga-psk-tx/pll.vhd
 -- Date	:	2022 03 26
 -- TD version	:	4.6.18154
--------------------------------------------------------------

-------------------------------------------------------------------------------
--	Input frequency:             24.000Mhz
--	Clock multiplication factor: 97
--	Clock division factor:       2
--	Clock information:
--		Clock name	| Frequency 	| Phase shift
--		C0        	| 145.500000MHZ	| 0  DEG     
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;
LIBRARY eagle_macro;
USE eagle_macro.EAGLE_COMPONENTS.ALL;

ENTITY pll IS
	PORT ( refclk	: IN	STD_LOGIC;
		reset	: IN	STD_LOGIC;
		clk0_out	: OUT	STD_LOGIC);
END pll;

ARCHITECTURE rtl OF pll IS
	SIGNAL clkc_wire	: STD_LOGIC_VECTOR (4 DOWNTO 0);
BEGIN
	pll_inst : EG_PHY_PLL	GENERIC MAP ( DPHASE_SOURCE => "DISABLE",
		DYNCFG => "DISABLE",
		FIN => "24.000",
		FEEDBK_MODE => "NOCOMP",
		FEEDBK_PATH => "VCO_PHASE_0",
		STDBY_ENABLE => "DISABLE",
		PLLRST_ENA => "ENABLE",
		SYNC_ENABLE => "DISABLE",
		DERIVE_PLL_CLOCKS => "DISABLE",
		GEN_BASIC_CLOCK => "DISABLE",
		GMC_GAIN => 0,
		ICP_CURRENT => 9,
		KVCO => 2,
		LPF_CAPACITOR => 2,
		LPF_RESISTOR => 8,
		REFCLK_DIV => 2,
		FBCLK_DIV => 97,
		CLKC0_ENABLE => "ENABLE",
		CLKC0_DIV => 8,
		CLKC0_CPHASE => 7,
		CLKC0_FPHASE => 0)
		PORT MAP ( refclk => refclk,
			reset => reset,
			stdby => '0',
			psclk => '0',
			psdown => '0',
			psstep => '0',
			psclksel => "000",
			dclk => '0',
			dcs => '0',
			dwe => '0',
			di => "00000000",
			daddr => "000000",
			fbclk => '0',
			clkc => clkc_wire);

		clk0_out <= clkc_wire(0);

END rtl;
