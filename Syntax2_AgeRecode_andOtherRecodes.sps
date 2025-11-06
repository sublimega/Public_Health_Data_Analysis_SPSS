RECODE Age
  (Lowest THRU 24 = 1)
  (25 THRU 34 = 2)
  (35 THRU Highest = 3)
  INTO age_group.

VARIABLE LABELS age_group 'Age group: 1=<25, 2=25-34, 3=>34'.
VALUE LABELS age_group
  1 '<25'
  2 '25-34'
  3 '>34'.
EXECUTE.

RECODE Awareness_1 Awareness_2 Awareness_3 Awareness_4 Awareness_5 Awareness_6 Awareness_7 Awareness_8 Awareness_9
    ("Strongly agree" = 1) ("Agree" = 1)
    ("Disagree" = 0) ("Strongly disagree" = 0)
    INTO Aware1_YN Aware2_YN Aware3_YN Aware4_YN Aware5_YN Aware6_YN Aware7_YN Aware8_YN Aware9_YN.

VARIABLE LABELS
    Aware1_YN 'Awareness1 (Yes/No)'
    Aware2_YN 'Awareness2 (Yes/No)'
    Aware3_YN 'Awareness3 (Yes/No)'
    Aware4_YN 'Awareness4 (Yes/No)'
    Aware5_YN 'Awareness5 (Yes/No)'
    Aware6_YN 'Awareness6 (Yes/No)'
    Aware7_YN 'Awareness7 (Yes/No)'
    Aware8_YN 'Awareness8 (Yes/No)'
    Aware9_YN 'Awareness9 (Yes/No)'.

VALUE LABELS
    Aware1_YN Aware2_YN Aware3_YN Aware4_YN Aware5_YN Aware6_YN Aware7_YN Aware8_YN Aware9_YN
    1 'Yes' 0 'No'.

COMPUTE Total_Yes = 
  (Aware1_YN = 1) + (Aware2_YN = 1) + (Aware3_YN = 1) + (Aware4_YN = 1) + (Aware5_YN = 1) +
  (Aware6_YN = 1) + (Aware7_YN = 1) + (Aware8_YN = 1) + (Aware9_YN = 1).
EXECUTE.

COMPUTE Total_No = 
   (Aware1_YN = 0) + (Aware2_YN = 0) + (Aware3_YN = 0) + (Aware4_YN = 0) + (Aware5_YN = 0) +
  (Aware6_YN = 0) + (Aware7_YN = 0) + (Aware8_YN = 0) + (Aware9_YN = 0).
EXECUTE.

COMPUTE Overall_Awareness = (Total_Yes > Total_No).
VARIABLE LABELS Overall_Awareness 'Overall Awareness (1=Yes, 0=No)'.
VALUE LABELS Overall_Awareness 1 'Yes' 0 'No'.
EXECUTE.

RECODE ParentsPerception_1 ParentsPerception_2 ParentsPerception_3 ParentsPerception_4 ParentsPerception_5
    ("Strongly agree" = 1) ("Agree" = 1)
    ("Disagree" = 0) ("Strongly disagree" = 0)
    INTO Perc1_PN Perc2_PN Perc3_PN Perc4_PN Perc5_PN. 

VARIABLE LABELS
    Perc1_PN 'Perception1 (Positive/Negative)'
    Perc2_PN 'Perception2 (Positive/Negative)'
    Perc3_PN 'Perception3 (Positive/Negative)'
    Perc4_PN 'Perception4 (Positive/Negative)'
    Perc5_PN 'Perception5 (Positive/Negative)'.

VALUE LABELS
    Perc1_PN Perc2_PN Perc3_PN Perc4_PN Perc5_PN
    1 'Positive' 0 'Negative'.

COMPUTE Total_Positive = 
  (Perc1_PN = 1) + (Perc2_PN = 1) + (Perc3_PN = 1) + (Perc4_PN = 1) + (Perc5_PN = 1).
EXECUTE.

COMPUTE Total_Negative = 
  (Perc1_PN = 0) + (Perc2_PN = 0) + (Perc3_PN = 0) + (Perc4_PN = 0) + (Perc5_PN = 0).
EXECUTE.

COMPUTE Overall_Perception = (Total_Positive > Total_Negative).
VARIABLE LABELS Overall_Perception 'Overall Perception (1=Positive, 0=Negative)'.
VALUE LABELS Overall_Perception 1 'Positive' 0 'Negative'.
EXECUTE.
