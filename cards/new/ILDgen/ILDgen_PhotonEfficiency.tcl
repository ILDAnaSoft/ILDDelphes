
  # set EfficiencyFormula {efficiency formula as a function of eta and pt}

  # efficiency formula for photons (ECAL + LumiCal)

  set EfficiencyFormula {
     (energy > 0.5 ) * (abs(eta) <= 3.0)                   * (0.95) +
     (energy > 1.0 ) * (abs(eta) > 3.0 && abs(eta) <= 4.0) * (0.90)
  }
