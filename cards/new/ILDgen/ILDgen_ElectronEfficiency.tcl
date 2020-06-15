
  # set EfficiencyFormula {efficiency formula as a function of eta and pt}

# efficiency formula for electrons (ECAL and LumiCal)
# LumiCal added for consistency: not in tracking range

  set EfficiencyFormula {
                         (abs(eta) <= 3.0)                   * (0.95) +
                         (abs(eta) > 3.0 && abs(eta) <= 4.0) * (0.90) 
  }
