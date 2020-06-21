
  # set EfficiencyFormula {efficiency formula as a function of eta and pt}

# efficiency formula for muons
# Identification based on tracking only

  set EfficiencyFormula {
        (energy <= 2 ) * (0.00) +
        (energy > 2 )  * (0.95)
  }
