# Efficiency formula for photons in BeamCal
# Based on IDR Figure 8.8a and Moritz Hebermehl PhD Thesis Figure 4.10
# A.F.Zarnecki,  June 2020

# set EfficiencyFormula {efficiency formula as a function of eta and pt}

set EfficiencyFormula {
    (energy <= 10 ) *                                                      (0.00) +
    
    (energy > 10 && energy <= 20 ) * (abs(eta) > 4.0 && abs(eta) <= 4.6) * (0.60) +
    (energy > 10 && energy <= 20 ) * (abs(eta) > 4.6 && abs(eta) <= 5.0) * (0.20) +
    (energy > 10 && energy <= 20 ) * (abs(eta) > 5.0 && abs(eta) <= 5.4) * (0.05) +
    (energy > 10 && energy <= 20 ) * (abs(eta) > 5.4 && abs(eta) <= 5.8) * (0.00) +
    
    (energy > 20 && energy <= 40 ) * (abs(eta) > 4.0 && abs(eta) <= 4.6) * (0.85) +
    (energy > 20 && energy <= 40 ) * (abs(eta) > 4.6 && abs(eta) <= 5.0) * (0.60) +
    (energy > 20 && energy <= 40 ) * (abs(eta) > 5.0 && abs(eta) <= 5.4) * (0.10) +
    (energy > 20 && energy <= 40 ) * (abs(eta) > 5.4 && abs(eta) <= 5.8) * (0.05) +

    (energy > 40 && energy <= 80 ) * (abs(eta) > 4.0 && abs(eta) <= 4.6) * (0.95) +
    (energy > 40 && energy <= 80 ) * (abs(eta) > 4.6 && abs(eta) <= 5.0) * (0.75) +
    (energy > 40 && energy <= 80 ) * (abs(eta) > 5.0 && abs(eta) <= 5.4) * (0.40) +
    (energy > 40 && energy <= 80 ) * (abs(eta) > 5.4 && abs(eta) <= 5.8) * (0.20) +
    
    (energy > 80 ) * (abs(eta) > 4.0 && abs(eta) <= 4.6) * (0.98) +
    (energy > 80 ) * (abs(eta) > 4.6 && abs(eta) <= 5.0) * (0.90) +
    (energy > 80 ) * (abs(eta) > 5.0 && abs(eta) <= 5.4) * (0.90) +
    (energy > 80 ) * (abs(eta) > 5.4 && abs(eta) <= 5.8) * (0.80) 
  }
