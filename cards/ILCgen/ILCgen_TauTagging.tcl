
  set DeltaR 0.5

  set TauPTMin 1.0

  set TauEtaMax 4.0

  # default efficiency formula (misidentification rate)
  add EfficiencyFormula {0} {
     (abs(eta) <= 3 ) * (energy <= 15 )                *   0.000 +
     (abs(eta) <= 3 ) * (energy  > 15 && energy <=27 ) *  (0.055 - 0.0025  * (energy - 15 ) ) +
     (abs(eta) <= 3 ) * (energy  > 27 && energy <=52 ) *  (0.025 - 0.00028 * (energy - 27 ) ) +
     (abs(eta) <= 3 ) * (energy  > 52 )                *   0.018 +
     (abs(eta)  > 3 )                                  *   0.000 
  }

  # efficiency formula for tau-jets
  add EfficiencyFormula {15} {
     (abs(eta) <= 3 ) * (energy <=15 )                 *   0.000 +
     (abs(eta) <= 3 ) * (energy  > 15 && energy <=27 ) *  (0.080 + 0.0355  * (energy - 15 ) ) +
     (abs(eta) <= 3 ) * (energy  > 27 && energy <=52 ) *  (0.506 + 0.00436 * (energy - 27 ) ) +
     (abs(eta) <= 3 ) * (energy  > 52 )                *   0.615 +
     (abs(eta)  > 3 )                                  *   0.000 
  }
