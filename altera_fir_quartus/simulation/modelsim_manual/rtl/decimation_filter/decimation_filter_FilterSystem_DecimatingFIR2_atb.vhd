-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 18.1 (Release Build #625)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2018 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from decimation_filter_FilterSystem_DecimatingFIR2
-- VHDL created on Thu Jan 23 17:48:41 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity decimation_filter_FilterSystem_DecimatingFIR2_atb is
end;

architecture normal of decimation_filter_FilterSystem_DecimatingFIR2_atb is

component decimation_filter_FilterSystem_DecimatingFIR2 is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(16 downto 0);  -- sfix17
        busIn_writedata : in std_logic_vector(15 downto 0);  -- sfix16
        busIn_address : in std_logic_vector(10 downto 0);  -- sfix11
        busIn_write : in std_logic_vector(0 downto 0);  -- sfix1
        busIn_read : in std_logic_vector(0 downto 0);  -- sfix1
        busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- sfix1
        busOut_readdata : out std_logic_vector(15 downto 0);  -- sfix16
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(37 downto 0);  -- sfix38
        clk : in std_logic;
        areset : in std_logic;
        h_areset : in std_logic
    );
end component;

component decimation_filter_FilterSystem_DecimatingFIR2_stm is
    port (
        xIn_v_stm : out std_logic_vector(0 downto 0);
        xIn_c_stm : out std_logic_vector(7 downto 0);
        xIn_0_stm : out std_logic_vector(16 downto 0);
        busIn_writedata_stm : out std_logic_vector(15 downto 0);
        busIn_address_stm : out std_logic_vector(10 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(15 downto 0);
        xOut_v_stm : out std_logic_vector(0 downto 0);
        xOut_c_stm : out std_logic_vector(7 downto 0);
        xOut_0_stm : out std_logic_vector(37 downto 0);
        clk : out std_logic;
        areset : out std_logic;
        h_areset : out std_logic
    );
end component;

signal xIn_v_stm : STD_LOGIC_VECTOR (0 downto 0);
signal xIn_c_stm : STD_LOGIC_VECTOR (7 downto 0);
signal xIn_0_stm : STD_LOGIC_VECTOR (16 downto 0);
signal busIn_writedata_stm : STD_LOGIC_VECTOR (15 downto 0);
signal busIn_address_stm : STD_LOGIC_VECTOR (10 downto 0);
signal busIn_write_stm : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_stm : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_stm : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_stm : STD_LOGIC_VECTOR (15 downto 0);
signal xOut_v_stm : STD_LOGIC_VECTOR (0 downto 0);
signal xOut_c_stm : STD_LOGIC_VECTOR (7 downto 0);
signal xOut_0_stm : STD_LOGIC_VECTOR (37 downto 0);
signal xIn_v_dut : STD_LOGIC_VECTOR (0 downto 0);
signal xIn_c_dut : STD_LOGIC_VECTOR (7 downto 0);
signal xIn_0_dut : STD_LOGIC_VECTOR (16 downto 0);
signal busIn_writedata_dut : STD_LOGIC_VECTOR (15 downto 0);
signal busIn_address_dut : STD_LOGIC_VECTOR (10 downto 0);
signal busIn_write_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_dut : STD_LOGIC_VECTOR (15 downto 0);
signal xOut_v_dut : STD_LOGIC_VECTOR (0 downto 0);
signal xOut_c_dut : STD_LOGIC_VECTOR (7 downto 0);
signal xOut_0_dut : STD_LOGIC_VECTOR (37 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;
        signal h_areset : std_logic;

begin

-- Channelized data in real output
checkxIn : process (clk, areset, xIn_0_dut, xIn_0_stm)
begin
END PROCESS;


-- Channelized data out check
checkxOut : process (clk, areset, xOut_0_dut, xOut_0_stm)
variable mismatch_xOut_v : BOOLEAN := FALSE;
variable mismatch_xOut_c : BOOLEAN := FALSE;
variable mismatch_xOut_0 : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_xOut_v := FALSE;
        mismatch_xOut_c := FALSE;
        mismatch_xOut_0 := FALSE;
        IF ( (xOut_v_dut /= xOut_v_stm)) THEN
            mismatch_xOut_v := TRUE;
            report "mismatch in xOut_v signal" severity Failure;
        END IF;
        IF (xOut_v_dut = "1") THEN
            IF ( (xOut_c_dut /= xOut_c_stm)) THEN
                mismatch_xOut_c := TRUE;
                report "mismatch in xOut_c signal" severity Warning;
            END IF;
            IF ( (xOut_0_dut /= xOut_0_stm)) THEN
                mismatch_xOut_0 := TRUE;
                report "mismatch in xOut_0 signal" severity Warning;
            END IF;
        END IF;
        IF (mismatch_xOut_v = TRUE or mismatch_xOut_c = TRUE or mismatch_xOut_0 = TRUE) THEN
            ok := FALSE;
        END IF;
        IF (ok = FALSE) THEN
            report "Mismatch detected" severity Failure;
        END IF;
    END IF;
END PROCESS;


dut : decimation_filter_FilterSystem_DecimatingFIR2 port map (
    xIn_v_stm,
    xIn_c_stm,
    xIn_0_stm,
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_dut,
    busOut_readdata_dut,
    xOut_v_dut,
    xOut_c_dut,
    xOut_0_dut,
        clk,
        areset,
        h_areset
);

sim : decimation_filter_FilterSystem_DecimatingFIR2_stm port map (
    xIn_v_stm,
    xIn_c_stm,
    xIn_0_stm,
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_stm,
    busOut_readdata_stm,
    xOut_v_stm,
    xOut_c_stm,
    xOut_0_stm,
        clk,
        areset,
        h_areset
);

end normal;
