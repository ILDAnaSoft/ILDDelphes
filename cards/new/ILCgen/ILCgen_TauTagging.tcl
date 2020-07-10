
  set DeltaR 0.5

  set TauPTMin 1.0

  set TauEtaMax 4.0

  # default efficiency formula (misidentification rate)
  add EfficiencyFormula {0} {
     (abs(eta) <= 3 ) * (energy <=10 ) *  0.00 +
     (abs(eta) <= 3 ) * (energy  >10 ) *  0.03 +
     (abs(eta)  > 3 )                  *  0.00 
  }

  # efficiency formula for tau-jets
  add EfficiencyFormula {15} {
    (abs(eta) <= 3 ) * (energy <=10 )                *  0.00 +
    (abs(eta) <= 3 ) * (energy  >10  && energy<=40 ) * (0.40 + 0.01*energy ) +
    (abs(eta) <= 3 ) * (energy  >40 )                *  0.80 +
    (abs(eta)  > 3 )                                 *  0.00 
  }
