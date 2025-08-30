-- (C) 2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions and other
-- software and tools, and its AMPP partner logic functions, and any output
-- files any of the foregoing (including device programming or simulation
-- files), and any associated documentation or information are expressly subject
-- to the terms and conditions of the Altera Program License Subscription
-- Agreement, Altera MegaCore Function License Agreement, or other applicable
-- license agreement, including, without limitation, that your use is for the
-- sole purpose of programming logic devices manufactured by Altera and sold by
-- Altera or its authorized distributors.  Please refer to the applicable
-- agreement for further details.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;

package dspba_sim_library_package is
  -- fixed point function for compare; similar to = in VHDL except if one input (only) is don't care and other is not ZXU, function returns True
  function vFXPisExactEqual(a : STD_LOGIC_VECTOR; b: STD_LOGIC_VECTOR) return BOOLEAN;
 
  -- auxiliary function for FP compare
  function isDontCare(a :std_logic_vector) return boolean;
  function vIEEEisSubnormal (a : STD_LOGIC_VECTOR; expWidth, fracWidth : INTEGER) return BOOLEAN;
  function vIEEEisZero (a : STD_LOGIC_VECTOR; expWidth, fracWidth : INTEGER) return BOOLEAN;
 
  -- single and double precision fuzzy compare
  function sIEEEisEqual (a, b : STD_LOGIC_VECTOR(31 DOWNTO 0); threshold : REAL := 0.001; zero_threshold : REAL := 0.0000001) return BOOLEAN;
  function dIEEEisEqual (a, b : STD_LOGIC_VECTOR(63 DOWNTO 0); threshold : REAL := 0.000001; zero_threshold : REAL := 0.0000000001) return BOOLEAN;

  -- variable precision fuzzy compare
  function vIEEEisEqual (a, b : STD_LOGIC_VECTOR; expWidth, fracWidth : INTEGER; threshold : REAL := 0.001; zero_threshold : REAL := 0.0000001) return BOOLEAN;
  
  -- variable precision exact compare
  function vIEEEisExactEqual (a, b : STD_LOGIC_VECTOR; expWidth, fracWidth : INTEGER; subnormal : BOOLEAN := false) return BOOLEAN;

  -- printing real value in simulation
  -- single and double FPC to real number values
  function sIEEE_2_real (arg : STD_LOGIC_VECTOR(31 DOWNTO 0)) return REAL;
  function sNorm_2_real (arg : STD_LOGIC_VECTOR(44 DOWNTO 0)) return REAL;
  function sInternal_2_real (arg : STD_LOGIC_VECTOR(44 DOWNTO 0)) return REAL;
  function sInternalSM_2_real (arg : STD_LOGIC_VECTOR(44 DOWNTO 0)) return REAL;
  function dIEEE_2_real (arg : STD_LOGIC_VECTOR(63 DOWNTO 0)) return REAL;
  function dNorm_2_real (arg : STD_LOGIC_VECTOR(69 DOWNTO 0)) return REAL;
  function dInternal_2_real (arg : STD_LOGIC_VECTOR(79 DOWNTO 0)) return REAL;
  
  -- variable precision to real
  function vIEEE_2_real (arg : STD_LOGIC_VECTOR; expWidth : INTEGER; fracWidth : INTEGER; subnormal : BOOLEAN := false) return REAL;
end dspba_sim_library_package;

PACKAGE BODY dspba_sim_library_package is
    function isDontCare (a : STD_LOGIC_VECTOR) return BOOLEAN is
    begin
		for i in A'range loop
	        if (A(i)/='-') then
				return false;
	        end if;
		end loop;
		return true;
	end isDontCare;
	
	function vFXPisExactEqual(a : STD_LOGIC_VECTOR; b: STD_LOGIC_VECTOR) return BOOLEAN is
	begin
	-- if any are don't while others are anything else but ZXU etc return true
	-- if one is Z,X,U etc then return false
	-- return a==b otherwise
        if (isDontCare(a) and (not is_x(b))) or (isDontCare(b) and (not is_x(a))) or (isDontCare(a) and isDontCare(b)) then
          return TRUE;
        end if;

		-- if either contains XUZ etc then mismatch
        if is_x(a) or is_x(b) then
          return FALSE;
        end if;	

		if (a = b) then 
			return TRUE;
        else 
			return FALSE;
		end if;
	end vFXPisExactEqual;
	
  function sIEEEisNegative (a : STD_LOGIC_VECTOR(31 DOWNTO 0)) return BOOLEAN is
  begin
        return a(31) = '1';
  end sIEEEisNegative;
  
  function sIEEEisNan (a : STD_LOGIC_VECTOR(31 DOWNTO 0)) return BOOLEAN is
  begin
        return a(30 downto 23) = "11111111" and a(22 downto 0) /= "00000000000000000000000";
  end sIEEEisNan;

  function sIEEEisInf (a : STD_LOGIC_VECTOR(31 DOWNTO 0)) return BOOLEAN is
  begin
        -- ignore sign bit since this returns true for -inf and +inf
        if a(30 downto 0) = "1111111100000000000000000000000" then
        --if a(30 downto 23) = "11111111" then
          return TRUE;
        else
          return FALSE;
        end if;
  end sIEEEisInf;
  

  function sIEEEisEqual (a, b : STD_LOGIC_VECTOR(31 DOWNTO 0); threshold : REAL := 0.001; zero_threshold : REAL := 0.0000001) return BOOLEAN is
    variable a_real : REAL;
    variable b_real : REAL;
    variable max_real : REAL;
  begin
        -- if either contains XUZ etc then mismatch
        if is_x(a) or is_x(b) then
          return FALSE;
        end if;

        -- treat all NaNs as equal
        if sIEEEisNan(a) and sIEEEisNan(b) then
          return TRUE;
        end if;

        -- if they're both infinite then they match assuming the sign is right
        if sIEEEisInf(a) and sIEEEisInf(b) then
          return sIEEEisNegative(a) = sIEEEisNegative(b);
        end if;

        -- if only one is infinite then mismatch
        if sIEEEisInf(a) or sIEEEisInf(b) then
          return FALSE;
        end if;
        a_real := sIEEE_2_real(a);
        b_real := sIEEE_2_real(b);

        -- find the max of the two numbers
        if abs(a_real) > abs(b_real) then
            max_real := abs(a_real);
        else
            max_real := abs(b_real);
        end if;

        -- if the max number is less than the zero threshold (then so is the other) and so we declare them to be "equal"
        if max_real < zero_threshold then
            return TRUE;
        end if;

        -- now we're comparing two numbers that aren't too close to zero so we can compare them by scaling the threshold by
        -- the largest of the two
        if abs(a_real - b_real) > threshold * max_real then
            return FALSE;   -- significant difference
        else
            return TRUE;   -- match
        end if;
  end sIEEEisEqual;

  function dIEEEisNan (a : STD_LOGIC_VECTOR(63 DOWNTO 0)) return BOOLEAN is
  begin
        return a(62 downto 52) = "11111111111" and a(51 downto 0) /= "0000000000000000000000000000000000000000000000000000";
  end dIEEEisNan;

  function dIEEEisInf (a : STD_LOGIC_VECTOR(63 DOWNTO 0)) return BOOLEAN is
  begin
        -- ignore sign bit since this returns true for -inf and +inf
        if a(62 downto 0) = "111111111110000000000000000000000000000000000000000000000000000" then
        --if a(62 downto 52) = "11111111111" then
          return TRUE;
        else
          return FALSE;
        end if;
  end dIEEEisInf;

  function dIEEEisNegative (a : STD_LOGIC_VECTOR(63 DOWNTO 0)) return BOOLEAN is
  begin
        return a(63) = '1';
  end dIEEEisNegative;


  function dIEEEisEqual (a, b : STD_LOGIC_VECTOR(63 DOWNTO 0); threshold : REAL := 0.000001; zero_threshold : REAL := 0.0000000001) return BOOLEAN is
    variable a_real : REAL;
    variable b_real : REAL;
    variable max_real : REAL;
  begin
        -- if either contains XUZ etc then mismatch
        if is_x(a) or is_x(b) then
          return FALSE;
        end if;

        -- treat all NaNs as equal
        if dIEEEisNan(a) and dIEEEisNan(b) then
          return TRUE;
        end if;

        -- if they're both infinite then they match assuming the sign is right
        if dIEEEisInf(a) and dIEEEisInf(b) then
          return dIEEEisNegative(a) = dIEEEisNegative(b);
        end if;

        -- if only one is infinite then mismatch
        if dIEEEisInf(a) or dIEEEisInf(b) then
          return FALSE;
        end if;
        a_real := dIEEE_2_real(a);
        b_real := dIEEE_2_real(b);

        -- find the max of the two numbers
        if abs(a_real) > abs(b_real) then
            max_real := abs(a_real);
        else
            max_real := abs(b_real);
        end if;

        -- if the max number is less than the zero threshold (then so is the other) and so we declare them to be "equal"
        if max_real < zero_threshold then
            return TRUE;
        end if;

        -- now we're comparing two numbers that aren't too close to zero so we can compare them by scaling the threshold by
        -- the largest of the two
        if abs(a_real - b_real) > threshold * max_real then
            return FALSE;   -- significant difference
        else
            return TRUE;   -- match
        end if;
  end dIEEEisEqual;

  function vIEEEisNan (arg : STD_LOGIC_VECTOR; expWidth, fracWidth : INTEGER) return BOOLEAN is
    variable expon : INTEGER;
    variable expmax : INTEGER;
    variable frac : INTEGER;
  begin
    expon := to_integer (UNSIGNED(arg ((arg'high - 1) downto fracWidth)));
    expmax := 2**expWidth - 1;
    if (expon /= expmax) then
        return FALSE;
    end if;
    if fracWidth > 31 then
        frac := to_integer(UNSIGNED(arg((fracWidth - 1) DOWNTO (fracWidth - 31))));
        if (frac /= 0) then
            return TRUE;
        end if;
        frac := to_integer(UNSIGNED(arg((fracWidth - 32) DOWNTO 0)));
        return (frac /= 0);
    end if;

    frac := to_integer (UNSIGNED(arg((fracWidth - 1) DOWNTO 0)));
    return (frac /= 0);
  end vIEEEisNan;

  function vIEEEisInf (arg : STD_LOGIC_VECTOR; expWidth, fracWidth : INTEGER) return BOOLEAN is
    variable expon : INTEGER;
    variable expmax : INTEGER;
    variable frac : INTEGER;
  begin
        -- ignore sign bit since this returns true for -inf and +inf
    expon := to_integer (UNSIGNED(arg ((arg'high - 1) downto fracWidth)));
    expmax := 2**expWidth - 1;
    if (expon /= expmax) then
        return FALSE;
    end if;
    if fracWidth > 31 then
        frac := to_integer(UNSIGNED(arg((fracWidth - 1) DOWNTO (fracWidth - 31))));
        if (frac /= 0) then
            return FALSE;
        end if;
        frac := to_integer(UNSIGNED(arg((fracWidth - 32) DOWNTO 0)));
        return (frac = 0);
    end if;

    frac := to_integer (UNSIGNED(arg((fracWidth - 1) DOWNTO 0)));
    return (frac = 0);
  end vIEEEisInf;

  function vIEEEisNegative (arg : STD_LOGIC_VECTOR; we, wf : INTEGER) return BOOLEAN is
  begin
        return arg(arg'high) = '1';
  end vIEEEisNegative;


  function vIEEEisEqual (a, b : STD_LOGIC_VECTOR; expWidth, fracWidth : INTEGER; threshold : REAL := 0.001; zero_threshold : REAL := 0.0000001) return BOOLEAN is
    variable a_real : REAL;
    variable b_real : REAL;
    variable max_real : REAL;
  begin
        -- if either contains XUZ etc then mismatch
        if is_x(a) or is_x(b) then
          return FALSE;
        end if;

        -- treat all NaNs as equal
        if vIEEEisNan(a, expWidth, fracWidth) and vIEEEisNan(b, expWidth, fracWidth) then
          return TRUE;
        end if;

        -- if they're both infinite then they match assuming the sign is right
        if vIEEEisInf(a, expWidth, fracWidth) and vIEEEisInf(b, expWidth, fracWidth) then
          return vIEEEisNegative(a, expWidth, fracWidth) = vIEEEisNegative(b, expWidth, fracWidth);
        end if;

        -- if only one is infinite then mismatch
        if vIEEEisInf(a, expWidth, fracWidth) or vIEEEisInf(b, expWidth, fracWidth) then
          return FALSE;
        end if;
        a_real := vIEEE_2_real(a, expWidth, fracWidth);
        b_real := vIEEE_2_real(b, expWidth, fracWidth);

        -- find the max of the two numbers
        if abs(a_real) > abs(b_real) then
            max_real := abs(a_real);
        else
            max_real := abs(b_real);
        end if;

        -- if the max number is less than the zero threshold (then so is the other) and so we declare them to be "equal"
        if max_real < zero_threshold then
            return TRUE;
        end if;

        -- now we're comparing two numbers that aren't too close to zero so we can compare them by scaling the threshold by
        -- the largest of the two
        if abs(a_real - b_real) > threshold * max_real then
            return FALSE;   -- significant difference
        else
            return TRUE;   -- match
        end if;
  end vIEEEisEqual;

    function vIEEEisExactEqual (a, b : STD_LOGIC_VECTOR; expWidth, fracWidth : INTEGER; subnormal : BOOLEAN := false) return BOOLEAN is
    begin
        if (isDontCare(a) and (not is_x(b))) or (isDontCare(b) and (not is_x(a))) or (isDontCare(a) and isDontCare(b)) then
          return TRUE;
        end if;

		-- if either contains XUZ etc then mismatch
        if is_x(a) or is_x(b) then
          return FALSE;
        end if;

        -- treat all NaNs as equal
        if vIEEEisNan(a, expWidth, fracWidth) and vIEEEisNan(b, expWidth, fracWidth) then
          return TRUE;
        end if;

        -- if they're both infinite then they match assuming the sign is right
        if vIEEEisInf(a, expWidth, fracWidth) and vIEEEisInf(b, expWidth, fracWidth) then
          return vIEEEisNegative(a, expWidth, fracWidth) = vIEEEisNegative(b, expWidth, fracWidth);
        end if;

        -- if only one is infinite then mismatch
        if vIEEEisInf(a, expWidth, fracWidth) or vIEEEisInf(b, expWidth, fracWidth) then
            return FALSE;
        end if;

		if (subnormal) then
			if (vIEEEisZero(a, expWidth, fracWidth)) and 
			   (vIEEEisZero(b, expWidth, fracWidth)) then
				return vIEEEisNegative(a, expWidth, fracWidth) = vIEEEisNegative(b, expWidth, fracWidth);
			end if;
		else
			if (vIEEEisSubnormal(a, expWidth, fracWidth) or vIEEEisZero(a, expWidth, fracWidth)) and 
			   (vIEEEisSubnormal(b, expWidth, fracWidth) or vIEEEisZero(b, expWidth, fracWidth)) then
				return vIEEEisNegative(a, expWidth, fracWidth) = vIEEEisNegative(b, expWidth, fracWidth);
			end if;
		end if;

        if (a = b) then
            return TRUE;
        end if;

        return FALSE;
    end vIEEEisExactEqual;

    function vIEEEisSubnormal (a : STD_LOGIC_VECTOR; expWidth, fracWidth : INTEGER) return BOOLEAN is
    variable fracA, fracB: integer;
    variable expA : integer;
    begin
        -- if either contains XUZ etc then mismatch
        if is_x(a) then
          return FALSE;
        end if;
        
        if (fracWidth > 31) then
	        fracA := to_integer (UNSIGNED(a(fracWidth-1 downto fracWidth-31)));
	        fracB := to_integer (UNSIGNED(a(fracWidth-31-1 downto 0)));
	    else
	        fracA := to_integer (UNSIGNED(a(fracWidth-1 downto 0)));	    
	        fracB := 0;
    	end if;
        expA  := to_integer (UNSIGNED(a(expWidth+fracWidth-1 downto fracWidth)));

        if (expA = 0 and (fracA /= 0 or fracB /= 0) ) then 
           return TRUE;
        end if;

        return FALSE;
    end vIEEEisSubnormal;

    function vIEEEisZero (a : STD_LOGIC_VECTOR; expWidth, fracWidth : INTEGER) return BOOLEAN is
    variable fracA, fracB: integer;
    variable expA : integer;
    begin
        -- if either contains XUZ etc then mismatch
        if is_x(a) then
          return FALSE;
        end if;

        if (fracWidth > 31) then
	        fracA := to_integer (UNSIGNED(a(fracWidth-1 downto fracWidth-31)));
	        fracB := to_integer (UNSIGNED(a(fracWidth-31-1 downto 0)));
	    else
	        fracA := to_integer (UNSIGNED(a(fracWidth-1 downto 0)));	    
	        fracB := 0;
    	end if;
        expA  := to_integer (UNSIGNED(a(expWidth+fracWidth-1 downto fracWidth)));

        if (expA = 0 and fracA = 0 and fracB = 0) then 
           return TRUE;
        end if;

        return FALSE;

    end vIEEEisZero;
	
  function sIEEE_2_real (arg : STD_LOGIC_VECTOR(31 DOWNTO 0)) return REAL is
    variable sign           : REAL;     -- Sign, + or - 1
    variable exp            : INTEGER;  -- Exponent
    variable expon_base     : INTEGER;  -- exponent offset
    variable exponent_width : INTEGER := 8;
    variable frac           : REAL    := 0.0;       -- Fraction
    variable expon          : INTEGER;
  begin
        if is_x(arg) then
          return 0.0;
        end if;
        expon_base              := 2**(exponent_width-1) -1;
        if arg(31) = '0' then
          sign := 1.0;
        else
          sign := -1.0;
        end if;
        frac                    := REAL(to_integer (UNSIGNED(arg(22 DOWNTO 0)))) / (2.0 ** 23);
        expon                   := to_integer (UNSIGNED(arg (30 downto 23)));
        exp                     := expon - expon_base;
        if exp > expon_base then
            sign := sign * 9.999e+307; -- NaN or Inf
        elsif expon = 0 then
            sign                := 0.0; -- denormalized rounded to zero
        else
            sign                := sign * (2.0 ** exp) * (1.0 + frac);
        end if;
        return sign;
  end sIEEE_2_real;

  function sNorm_2_real (arg : STD_LOGIC_VECTOR(44 DOWNTO 0)) return REAL is
    variable sign           : REAL;     -- Sign, + or - 1
    variable exp            : INTEGER;  -- Exponent
    variable expon_base     : INTEGER;  -- exponent offset
    variable exponent_width : INTEGER := 8; -- the binary point is at 8 even though there are 2 extra bits for overflow
    variable frac           : REAL    := 0.0;       -- Fraction
    variable expon          : INTEGER;
  begin
        if is_x(arg) then
          return 0.0;
        end if;
        expon_base := 2**(exponent_width-1) -1;
        frac                    := REAL(to_integer (SIGNED(arg(41 DOWNTO 10)))) / (2.0 ** 30); -- SS.FFFFF...FF
        expon                   := to_integer (UNSIGNED(arg (9 downto 0)));
        exp                     := expon - expon_base;
        sign                    := (2.0 ** exp) * frac;
        return sign;
  end sNorm_2_real;

  function sInternal_2_real (arg : STD_LOGIC_VECTOR(44 DOWNTO 0)) return REAL is
    variable sign           : REAL;     -- Sign, + or - 1
    variable exp            : INTEGER;  -- Exponent
    variable expon_base     : INTEGER;  -- exponent offset
    variable exponent_width : INTEGER := 8; -- the binary point is at 8 even though there are 2 extra bits for overflow
    variable frac           : REAL    := 0.0;       -- Fraction
    variable expon          : INTEGER;
  begin
        if is_x(arg) then
          return 0.0;
        end if;
        expon_base              := 2**(exponent_width-1) -1;
        frac                    := REAL(to_integer (SIGNED(arg(41 DOWNTO 10)))) / (2.0 ** 26); -- SSSSSS.FFF...FF
        expon                   := to_integer (UNSIGNED(arg (9 downto 0)));
        exp                     := expon - expon_base;
        sign                    := (2.0 ** exp) * frac;
        return sign;
  end sInternal_2_real;

  -- sInternalSM has:
  -- 10 bit exponent
  -- 31 bit unsigned mantissa (32 bits for v31 version, which needs a separate function)
  -- 1 bit sign
  -- 3 flags
  function sInternalSM_2_real (arg : STD_LOGIC_VECTOR(44 DOWNTO 0)) return REAL is
    variable sign           : REAL;     -- Sign, + or - 1
    variable exp            : INTEGER;  -- Exponent
    variable expon_base     : INTEGER;  -- exponent offset
    variable exponent_width : INTEGER := 8; -- the binary point is at 8 even though there are 2 extra bits for overflow
    variable frac           : REAL    := 0.0;       -- Fraction
    variable expon          : INTEGER;
  begin
        if is_x(arg) then
          return 0.0;
        end if;
        expon_base              := 2**(exponent_width-1) -1;

        if arg(41) = '0' then
          sign := 1.0;
        else
          sign := -1.0;
        end if;

        frac                    := REAL(to_integer (UNSIGNED(arg(40 DOWNTO 10)))) / (2.0 ** 26); -- SSSSSS.FFF...FF
        expon                   := to_integer (UNSIGNED(arg (9 downto 0)));
        exp                     := expon - expon_base;

        sign                    := sign * (2.0 ** exp) * frac;
        return sign;
  end sInternalSM_2_real;

  function dIEEE_2_real (arg : STD_LOGIC_VECTOR(63 DOWNTO 0)) return REAL is
    variable sign           : REAL;     -- Sign, + or - 1
    variable exp            : INTEGER;  -- Exponent
    variable expon_base     : INTEGER;  -- exponent offset
    variable exponent_width : INTEGER := 11;
    variable frac           : REAL    := 0.0;       -- Fraction
    variable fraclo         : REAL    := 0.0;       -- Fraction (low order bits)
    variable expon          : INTEGER;
  begin
        if is_x(arg) then
          return 0.0;
        end if;
        expon_base              := 2**(exponent_width-1) -1;
        if arg(63) = '0' then
          sign := 1.0;
        else
          sign := -1.0;
        end if;
        frac                    := REAL(to_integer (SIGNED('0' & arg(51 DOWNTO 21)))) / (2.0 ** 31); -- ignore low bits to fit within VHDL types
        fraclo                  := REAL(to_integer (SIGNED('0' & arg(20 DOWNTO 0)))) / (2.0 ** 52);
        expon                   := to_integer (SIGNED('0' & arg (62 downto 52)));
        exp                     := expon - expon_base;
        -- Fatal error (vsim-3421) if outside range -1e+308 +1e+308 which can still happen if exp = 1023
        if exp >= 1023 then
            sign                := sign * 9.999e+307;
        elsif expon = 0 then
            sign                := 0.0;
            -- ignore denormalized mantissa
        else
            sign                := sign * (2.0 ** exp) * (1.0 + frac + fraclo);
        end if;
        return sign;
  end dIEEE_2_real;

  function dNorm_2_real (arg : STD_LOGIC_VECTOR(69 DOWNTO 0)) return REAL is
    variable sign           : REAL;     -- Sign, + or - 1
    variable exp            : INTEGER;  -- Exponent
    variable expon_base     : INTEGER;  -- exponent offset
    variable exponent_width : INTEGER := 11; -- the binary point is at 10 even though there are 2 extra bits for overflow
    variable frac           : REAL    := 0.0;       -- Fraction
    variable expon          : INTEGER;
  begin
        if is_x(arg) then
          return 0.0;
        end if;
        expon_base              := 2**(exponent_width-1) -1;
        frac                    := REAL(to_integer (SIGNED(arg(66 DOWNTO 35)))) / (2.0 ** 30); -- SS.FFFFF...FF
        expon                   := to_integer (UNSIGNED(arg (12 downto 0)));
        exp                     := expon - expon_base;
        if exp >= 1024 then
            sign                := 0.0;
        else
            sign                := (2.0 ** exp) * frac;
        end if;
        return sign;
  end dNorm_2_real;

  function dInternal_2_real (arg : STD_LOGIC_VECTOR(79 DOWNTO 0)) return REAL is
    variable sign           : REAL;     -- Sign, + or - 1
    variable exp            : INTEGER;  -- Exponent
    variable expon_base     : INTEGER;  -- exponent offset
    variable exponent_width : INTEGER := 11; -- the binary point is at 10 even though there are 2 extra bits for overflow
    variable frac           : REAL    := 0.0;       -- Fraction
    variable expon          : INTEGER;
    variable sign_bit       : STD_LOGIC;
  begin
        if is_x(arg) then
          return 0.0;
        end if;
        expon_base              := 2**(exponent_width-1) -1;
        frac                    := REAL(to_integer (SIGNED(arg(76 DOWNTO 45)))) / (2.0 ** 26); -- SSSSSS.FFF...FF
        expon                   := to_integer (UNSIGNED(arg (12 downto 0)));
        exp                     := expon - expon_base;
        sign_bit                := arg(76);
        if exp >= 1024 then
        -- perhaps 
        -- or (arg(74) /= sign_bit and exp >= 1023) or (arg(74) /= sign_bit and arg(75) /= sign_bit and exp >= 1022) then
            sign                := 0.0;
        else
            sign                := (2.0 ** exp) * frac;
        end if;
        return sign;
  end dInternal_2_real;

  function vIEEE_2_real (arg : STD_LOGIC_VECTOR; expWidth : INTEGER; fracWidth : INTEGER; subnormal : BOOLEAN := false) return REAL is
    variable sign           : REAL;     -- Sign, + or - 1
    variable exp            : INTEGER;  -- Exponent
    variable exponBase      : INTEGER;  -- exponent offset
    variable frac           : REAL    := 0.0;       -- Fraction
    variable fraclo         : REAL    := 0.0;       -- Fraction (low order bits)
    variable expon          : INTEGER;
  begin
        if is_x(arg) then
          return 0.0;
        end if;
        exponBase              := 2**(expWidth-1) -1;
        if arg(arg'high) = '0' then
          sign := 1.0;
        else
          sign := -1.0;
        end if;
        if fracWidth > 31 then
            frac   := REAL(to_integer(UNSIGNED(arg((fracWidth - 1) DOWNTO (fracWidth - 31))))) / (2.0 ** 31);
            fraclo := REAL(to_integer(UNSIGNED(arg((fracWidth - 32) DOWNTO 0)))) / (2.0 ** fracWidth);
        else
            frac   := REAL(to_integer (UNSIGNED(arg((fracWidth - 1) DOWNTO 0)))) / (2.0 ** fracWidth);
            fraclo := 0.0;
        end if;
		-- unbiased exponent 
        expon      := to_integer (UNSIGNED(arg ((arg'high - 1) downto fracWidth)));
        exp        := expon - exponBase;
        if exp > exponBase or exp >= 1023 then
            sign   := sign * 9.999e+307; -- NaN or Inf
        elsif expon = 0 then
			if ( (NOT subnormal)  OR (frac = 0.0 AND  fraclo = 0.0 )) then 
				sign   := 0.0; -- denormalized rounded to zero
			else
				sign   := sign * (2.0 ** (exp + 1) ) * (frac + fraclo);
			end if;
        else
            sign   := sign * (2.0 ** exp) * (1.0 + frac + fraclo);
        end if;
        return sign;
  end vIEEE_2_real;
END dspba_sim_library_package;	