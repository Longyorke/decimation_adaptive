-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "02/22/2025 21:13:21"
                                                            
-- Vhdl Test Bench template for design  :  decimation_filter_FilterSystem
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY decimation_filter_FilterSystem_vhd_tst IS
END decimation_filter_FilterSystem_vhd_tst;
ARCHITECTURE decimation_filter_FilterSystem_arch OF decimation_filter_FilterSystem_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL a : STD_LOGIC_VECTOR(16 DOWNTO 0);
SIGNAL ac : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL areset : STD_LOGIC;
SIGNAL av : STD_LOGIC_VECTOR(0 DOWNTO 0);
SIGNAL busIn_address : STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL busIn_read : STD_LOGIC_VECTOR(0 DOWNTO 0);
SIGNAL busIn_write : STD_LOGIC_VECTOR(0 DOWNTO 0);
SIGNAL busIn_writedata : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL busOut_readdata : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL busOut_readdatavalid : STD_LOGIC_VECTOR(0 DOWNTO 0);
SIGNAL busOut_waitrequest : STD_LOGIC_VECTOR(0 DOWNTO 0);
SIGNAL clk : STD_LOGIC;
SIGNAL h_areset : STD_LOGIC;
SIGNAL q : STD_LOGIC_VECTOR(16 DOWNTO 0);
SIGNAL qc : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL qv : STD_LOGIC_VECTOR(0 DOWNTO 0);
COMPONENT decimation_filter_FilterSystem
	PORT (
	a : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
	ac : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	areset : IN STD_LOGIC;
	av : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	busIn_address : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
	busIn_read : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	busIn_write : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	busIn_writedata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	busOut_readdata : BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0);
	busOut_readdatavalid : BUFFER STD_LOGIC_VECTOR(0 DOWNTO 0);
	busOut_waitrequest : BUFFER STD_LOGIC_VECTOR(0 DOWNTO 0);
	clk : IN STD_LOGIC;
	h_areset : IN STD_LOGIC;
	q : BUFFER STD_LOGIC_VECTOR(16 DOWNTO 0);
	qc : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	qv : BUFFER STD_LOGIC_VECTOR(0 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : decimation_filter_FilterSystem
	PORT MAP (
-- list connections between master ports and signals
	a => a,
	ac => ac,
	areset => areset,
	av => av,
	busIn_address => busIn_address,
	busIn_read => busIn_read,
	busIn_write => busIn_write,
	busIn_writedata => busIn_writedata,
	busOut_readdata => busOut_readdata,
	busOut_readdatavalid => busOut_readdatavalid,
	busOut_waitrequest => busOut_waitrequest,
	clk => clk,
	h_areset => h_areset,
	q => q,
	qc => qc,
	qv => qv
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END decimation_filter_FilterSystem_arch;
