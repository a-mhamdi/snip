-- -------------------------------------------------------------
--
-- Module: filter
--
-- Generated by MATLAB(R) 7.14 and the Filter Design HDL Coder 2.9.1.
--
-- Generated on: 2012-09-16 23:43:00
--
-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- HDL Code Generation Options:
--
-- TargetLanguage: VHDL
-- HDLSynthTool: ISE
-- HDLSynthCmd: xfile add $src_dir/%s\n
-- HDLSynthFilePostfix: _ise.tcl
-- HDLSynthInit: set src_dir [pwd]\nset prj_dir "synprj"\nfile mkdir ../$prj_dir\ncd ../$prj_dir\nproject new %s.xise\nproject set family Virtex4\nproject set device xc4vsx35\nproject set package ff668\nproject set speed -10\n
-- HDLSynthTerm: process run "Synthesize - XST"
-- TargetDirectory: C:\Users\MHAMDI\Desktop\FIR
-- TestBenchStimulus: impulse step ramp chirp noise 
-- GenerateCoSimModel: ModelSim

-- -------------------------------------------------------------
-- HDL Implementation    : Fully parallel
-- Multipliers           : 51
-- Folding Factor        : 1
-- -------------------------------------------------------------
-- Filter Settings:
--
-- Discrete-Time FIR Filter (real)
-- -------------------------------
-- Filter Structure  : Direct-Form FIR
-- Filter Length     : 51
-- Stable            : Yes
-- Linear Phase      : Yes (Type 1)
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;
ENTITY filter IS
   PORT( clk                             :   IN    std_logic; 
         clk_enable                      :   IN    std_logic; 
         reset                           :   IN    std_logic; 
         filter_in                       :   IN    real; -- double
         filter_out                      :   OUT   real  -- double
         );

END filter;


----------------------------------------------------------------
--Module Architecture: filter
----------------------------------------------------------------
ARCHITECTURE rtl OF filter IS
  -- Local Functions
  -- Type Definitions
  TYPE delay_pipeline_type IS ARRAY (NATURAL range <>) OF real; -- double
  -- Constants
  CONSTANT coeff1                         : real := -9.1909820846825603E-04; -- double
  CONSTANT coeff2                         : real := -2.7176960265955000E-03; -- double
  CONSTANT coeff3                         : real := -2.4869527598323101E-03; -- double
  CONSTANT coeff4                         : real := 3.6614383835070902E-03; -- double
  CONSTANT coeff5                         : real := 1.3650925230662400E-02; -- double
  CONSTANT coeff6                         : real := 1.7351165901093299E-02; -- double
  CONSTANT coeff7                         : real := 7.6653061904216804E-03; -- double
  CONSTANT coeff8                         : real := -6.5547188696423999E-03; -- double
  CONSTANT coeff9                         : real := -7.6967840370653602E-03; -- double
  CONSTANT coeff10                        : real := 6.1054594213943601E-03; -- double
  CONSTANT coeff11                        : real := 1.3873915748635401E-02; -- double
  CONSTANT coeff12                        : real := 3.5086172829091000E-04; -- double
  CONSTANT coeff13                        : real := -1.6908925436690501E-02; -- double
  CONSTANT coeff14                        : real := -8.9056427491586796E-03; -- double
  CONSTANT coeff15                        : real := 1.7441129500854899E-02; -- double
  CONSTANT coeff16                        : real := 2.0745044527609901E-02; -- double
  CONSTANT coeff17                        : real := -1.2296494251940300E-02; -- double
  CONSTANT coeff18                        : real := -3.4240865909578401E-02; -- double
  CONSTANT coeff19                        : real := -1.0345296055723999E-03; -- double
  CONSTANT coeff20                        : real := 4.7790305520801497E-02; -- double
  CONSTANT coeff21                        : real := 2.7363037914847999E-02; -- double
  CONSTANT coeff22                        : real := -5.9379518831046599E-02; -- double
  CONSTANT coeff23                        : real := -8.2307025929229102E-02; -- double
  CONSTANT coeff24                        : real := 6.7186909432870506E-02; -- double
  CONSTANT coeff25                        : real := 3.1001517709025100E-01; -- double
  CONSTANT coeff26                        : real := 4.3004788034351699E-01; -- double
  CONSTANT coeff27                        : real := 3.1001517709025100E-01; -- double
  CONSTANT coeff28                        : real := 6.7186909432870506E-02; -- double
  CONSTANT coeff29                        : real := -8.2307025929229102E-02; -- double
  CONSTANT coeff30                        : real := -5.9379518831046599E-02; -- double
  CONSTANT coeff31                        : real := 2.7363037914847999E-02; -- double
  CONSTANT coeff32                        : real := 4.7790305520801497E-02; -- double
  CONSTANT coeff33                        : real := -1.0345296055723999E-03; -- double
  CONSTANT coeff34                        : real := -3.4240865909578401E-02; -- double
  CONSTANT coeff35                        : real := -1.2296494251940300E-02; -- double
  CONSTANT coeff36                        : real := 2.0745044527609901E-02; -- double
  CONSTANT coeff37                        : real := 1.7441129500854899E-02; -- double
  CONSTANT coeff38                        : real := -8.9056427491586796E-03; -- double
  CONSTANT coeff39                        : real := -1.6908925436690501E-02; -- double
  CONSTANT coeff40                        : real := 3.5086172829091000E-04; -- double
  CONSTANT coeff41                        : real := 1.3873915748635401E-02; -- double
  CONSTANT coeff42                        : real := 6.1054594213943601E-03; -- double
  CONSTANT coeff43                        : real := -7.6967840370653602E-03; -- double
  CONSTANT coeff44                        : real := -6.5547188696423999E-03; -- double
  CONSTANT coeff45                        : real := 7.6653061904216804E-03; -- double
  CONSTANT coeff46                        : real := 1.7351165901093299E-02; -- double
  CONSTANT coeff47                        : real := 1.3650925230662400E-02; -- double
  CONSTANT coeff48                        : real := 3.6614383835070902E-03; -- double
  CONSTANT coeff49                        : real := -2.4869527598323101E-03; -- double
  CONSTANT coeff50                        : real := -2.7176960265955000E-03; -- double
  CONSTANT coeff51                        : real := -9.1909820846825603E-04; -- double

  -- Signals
  SIGNAL delay_pipeline                   : delay_pipeline_type(0 TO 50) := (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0, 0.0); -- double
  SIGNAL product51                        : real := 0.0; -- double
  SIGNAL product50                        : real := 0.0; -- double
  SIGNAL product49                        : real := 0.0; -- double
  SIGNAL product48                        : real := 0.0; -- double
  SIGNAL product47                        : real := 0.0; -- double
  SIGNAL product46                        : real := 0.0; -- double
  SIGNAL product45                        : real := 0.0; -- double
  SIGNAL product44                        : real := 0.0; -- double
  SIGNAL product43                        : real := 0.0; -- double
  SIGNAL product42                        : real := 0.0; -- double
  SIGNAL product41                        : real := 0.0; -- double
  SIGNAL product40                        : real := 0.0; -- double
  SIGNAL product39                        : real := 0.0; -- double
  SIGNAL product38                        : real := 0.0; -- double
  SIGNAL product37                        : real := 0.0; -- double
  SIGNAL product36                        : real := 0.0; -- double
  SIGNAL product35                        : real := 0.0; -- double
  SIGNAL product34                        : real := 0.0; -- double
  SIGNAL product33                        : real := 0.0; -- double
  SIGNAL product32                        : real := 0.0; -- double
  SIGNAL product31                        : real := 0.0; -- double
  SIGNAL product30                        : real := 0.0; -- double
  SIGNAL product29                        : real := 0.0; -- double
  SIGNAL product28                        : real := 0.0; -- double
  SIGNAL product27                        : real := 0.0; -- double
  SIGNAL product26                        : real := 0.0; -- double
  SIGNAL product25                        : real := 0.0; -- double
  SIGNAL product24                        : real := 0.0; -- double
  SIGNAL product23                        : real := 0.0; -- double
  SIGNAL product22                        : real := 0.0; -- double
  SIGNAL product21                        : real := 0.0; -- double
  SIGNAL product20                        : real := 0.0; -- double
  SIGNAL product19                        : real := 0.0; -- double
  SIGNAL product18                        : real := 0.0; -- double
  SIGNAL product17                        : real := 0.0; -- double
  SIGNAL product16                        : real := 0.0; -- double
  SIGNAL product15                        : real := 0.0; -- double
  SIGNAL product14                        : real := 0.0; -- double
  SIGNAL product13                        : real := 0.0; -- double
  SIGNAL product12                        : real := 0.0; -- double
  SIGNAL product11                        : real := 0.0; -- double
  SIGNAL product10                        : real := 0.0; -- double
  SIGNAL product9                         : real := 0.0; -- double
  SIGNAL product8                         : real := 0.0; -- double
  SIGNAL product7                         : real := 0.0; -- double
  SIGNAL product6                         : real := 0.0; -- double
  SIGNAL product5                         : real := 0.0; -- double
  SIGNAL product4                         : real := 0.0; -- double
  SIGNAL product3                         : real := 0.0; -- double
  SIGNAL product2                         : real := 0.0; -- double
  SIGNAL product1_cast                    : real := 0.0; -- double
  SIGNAL product1                         : real := 0.0; -- double
  SIGNAL sum1                             : real := 0.0; -- double
  SIGNAL sum2                             : real := 0.0; -- double
  SIGNAL sum3                             : real := 0.0; -- double
  SIGNAL sum4                             : real := 0.0; -- double
  SIGNAL sum5                             : real := 0.0; -- double
  SIGNAL sum6                             : real := 0.0; -- double
  SIGNAL sum7                             : real := 0.0; -- double
  SIGNAL sum8                             : real := 0.0; -- double
  SIGNAL sum9                             : real := 0.0; -- double
  SIGNAL sum10                            : real := 0.0; -- double
  SIGNAL sum11                            : real := 0.0; -- double
  SIGNAL sum12                            : real := 0.0; -- double
  SIGNAL sum13                            : real := 0.0; -- double
  SIGNAL sum14                            : real := 0.0; -- double
  SIGNAL sum15                            : real := 0.0; -- double
  SIGNAL sum16                            : real := 0.0; -- double
  SIGNAL sum17                            : real := 0.0; -- double
  SIGNAL sum18                            : real := 0.0; -- double
  SIGNAL sum19                            : real := 0.0; -- double
  SIGNAL sum20                            : real := 0.0; -- double
  SIGNAL sum21                            : real := 0.0; -- double
  SIGNAL sum22                            : real := 0.0; -- double
  SIGNAL sum23                            : real := 0.0; -- double
  SIGNAL sum24                            : real := 0.0; -- double
  SIGNAL sum25                            : real := 0.0; -- double
  SIGNAL sum26                            : real := 0.0; -- double
  SIGNAL sum27                            : real := 0.0; -- double
  SIGNAL sum28                            : real := 0.0; -- double
  SIGNAL sum29                            : real := 0.0; -- double
  SIGNAL sum30                            : real := 0.0; -- double
  SIGNAL sum31                            : real := 0.0; -- double
  SIGNAL sum32                            : real := 0.0; -- double
  SIGNAL sum33                            : real := 0.0; -- double
  SIGNAL sum34                            : real := 0.0; -- double
  SIGNAL sum35                            : real := 0.0; -- double
  SIGNAL sum36                            : real := 0.0; -- double
  SIGNAL sum37                            : real := 0.0; -- double
  SIGNAL sum38                            : real := 0.0; -- double
  SIGNAL sum39                            : real := 0.0; -- double
  SIGNAL sum40                            : real := 0.0; -- double
  SIGNAL sum41                            : real := 0.0; -- double
  SIGNAL sum42                            : real := 0.0; -- double
  SIGNAL sum43                            : real := 0.0; -- double
  SIGNAL sum44                            : real := 0.0; -- double
  SIGNAL sum45                            : real := 0.0; -- double
  SIGNAL sum46                            : real := 0.0; -- double
  SIGNAL sum47                            : real := 0.0; -- double
  SIGNAL sum48                            : real := 0.0; -- double
  SIGNAL sum49                            : real := 0.0; -- double
  SIGNAL sum50                            : real := 0.0; -- double
  SIGNAL output_register                  : real := 0.0; -- double


BEGIN

  -- Block Statements
  Delay_Pipeline_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delay_pipeline(0 TO 50) <= (OTHERS => 0.0000000000000000E+00);
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        delay_pipeline(0) <= filter_in;
        delay_pipeline(1 TO 50) <= delay_pipeline(0 TO 49);
      END IF;
    END IF; 
  END PROCESS Delay_Pipeline_process;


  product51 <= delay_pipeline(50) * coeff51;

  product50 <= delay_pipeline(49) * coeff50;

  product49 <= delay_pipeline(48) * coeff49;

  product48 <= delay_pipeline(47) * coeff48;

  product47 <= delay_pipeline(46) * coeff47;

  product46 <= delay_pipeline(45) * coeff46;

  product45 <= delay_pipeline(44) * coeff45;

  product44 <= delay_pipeline(43) * coeff44;

  product43 <= delay_pipeline(42) * coeff43;

  product42 <= delay_pipeline(41) * coeff42;

  product41 <= delay_pipeline(40) * coeff41;

  product40 <= delay_pipeline(39) * coeff40;

  product39 <= delay_pipeline(38) * coeff39;

  product38 <= delay_pipeline(37) * coeff38;

  product37 <= delay_pipeline(36) * coeff37;

  product36 <= delay_pipeline(35) * coeff36;

  product35 <= delay_pipeline(34) * coeff35;

  product34 <= delay_pipeline(33) * coeff34;

  product33 <= delay_pipeline(32) * coeff33;

  product32 <= delay_pipeline(31) * coeff32;

  product31 <= delay_pipeline(30) * coeff31;

  product30 <= delay_pipeline(29) * coeff30;

  product29 <= delay_pipeline(28) * coeff29;

  product28 <= delay_pipeline(27) * coeff28;

  product27 <= delay_pipeline(26) * coeff27;

  product26 <= delay_pipeline(25) * coeff26;

  product25 <= delay_pipeline(24) * coeff25;

  product24 <= delay_pipeline(23) * coeff24;

  product23 <= delay_pipeline(22) * coeff23;

  product22 <= delay_pipeline(21) * coeff22;

  product21 <= delay_pipeline(20) * coeff21;

  product20 <= delay_pipeline(19) * coeff20;

  product19 <= delay_pipeline(18) * coeff19;

  product18 <= delay_pipeline(17) * coeff18;

  product17 <= delay_pipeline(16) * coeff17;

  product16 <= delay_pipeline(15) * coeff16;

  product15 <= delay_pipeline(14) * coeff15;

  product14 <= delay_pipeline(13) * coeff14;

  product13 <= delay_pipeline(12) * coeff13;

  product12 <= delay_pipeline(11) * coeff12;

  product11 <= delay_pipeline(10) * coeff11;

  product10 <= delay_pipeline(9) * coeff10;

  product9 <= delay_pipeline(8) * coeff9;

  product8 <= delay_pipeline(7) * coeff8;

  product7 <= delay_pipeline(6) * coeff7;

  product6 <= delay_pipeline(5) * coeff6;

  product5 <= delay_pipeline(4) * coeff5;

  product4 <= delay_pipeline(3) * coeff4;

  product3 <= delay_pipeline(2) * coeff3;

  product2 <= delay_pipeline(1) * coeff2;

  product1_cast <= product1;


  product1 <= delay_pipeline(0) * coeff1;

  sum1 <= product1_cast + product2;

  sum2 <= sum1 + product3;

  sum3 <= sum2 + product4;

  sum4 <= sum3 + product5;

  sum5 <= sum4 + product6;

  sum6 <= sum5 + product7;

  sum7 <= sum6 + product8;

  sum8 <= sum7 + product9;

  sum9 <= sum8 + product10;

  sum10 <= sum9 + product11;

  sum11 <= sum10 + product12;

  sum12 <= sum11 + product13;

  sum13 <= sum12 + product14;

  sum14 <= sum13 + product15;

  sum15 <= sum14 + product16;

  sum16 <= sum15 + product17;

  sum17 <= sum16 + product18;

  sum18 <= sum17 + product19;

  sum19 <= sum18 + product20;

  sum20 <= sum19 + product21;

  sum21 <= sum20 + product22;

  sum22 <= sum21 + product23;

  sum23 <= sum22 + product24;

  sum24 <= sum23 + product25;

  sum25 <= sum24 + product26;

  sum26 <= sum25 + product27;

  sum27 <= sum26 + product28;

  sum28 <= sum27 + product29;

  sum29 <= sum28 + product30;

  sum30 <= sum29 + product31;

  sum31 <= sum30 + product32;

  sum32 <= sum31 + product33;

  sum33 <= sum32 + product34;

  sum34 <= sum33 + product35;

  sum35 <= sum34 + product36;

  sum36 <= sum35 + product37;

  sum37 <= sum36 + product38;

  sum38 <= sum37 + product39;

  sum39 <= sum38 + product40;

  sum40 <= sum39 + product41;

  sum41 <= sum40 + product42;

  sum42 <= sum41 + product43;

  sum43 <= sum42 + product44;

  sum44 <= sum43 + product45;

  sum45 <= sum44 + product46;

  sum46 <= sum45 + product47;

  sum47 <= sum46 + product48;

  sum48 <= sum47 + product49;

  sum49 <= sum48 + product50;

  sum50 <= sum49 + product51;

  Output_Register_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      output_register <= 0.0000000000000000E+00;
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        output_register <= sum50;
      END IF;
    END IF; 
  END PROCESS Output_Register_process;

  -- Assignment Statements
  filter_out <= output_register;
END rtl;
