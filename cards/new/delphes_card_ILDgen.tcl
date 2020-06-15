
#######################################
# Order of execution of various modules
#######################################

set ExecutionPath {
  ParticlePropagator

  ChargedHadronTrackingEfficiency
  ElectronTrackingEfficiency
  MuonTrackingEfficiency

  ChargedHadronMomentumSmearing
  ElectronMomentumSmearing
  MuonMomentumSmearing

  TrackMerger
  
  ECal
  LumiCal

  EMTrackMerger
    
  HCal
  LHCal
    
  HCTrackMerger
    
  BeamCal
    
  Calorimeters

  EFlowMerger
  EFlowFilter

  NeutralMerger
  PhotonMerger
    
  BCalEfficiency
   
  PhotonEfficiency
  PhotonIsolation
    
  ElectronFilter
  ElectronEfficiency
  ElectronIsolation

  ChargedHadronFilter

  MuonEfficiency
  MuonIsolation

  NeutrinoFilter

  GenJetFinder

  FastJetFinder
  JetEnergyScale

  JetFlavorAssociation
  BTagging
  TauTagging
    
  UniqueObjectFinder

  MissingET
  GenMissingET
  ScalarHT


    
  MainCalorimeters

  EFlowMerger_MainCal
  EFlowFilter_MainCal

  PhotonEfficiency_MainCal
  PhotonIsolation_MainCal

  FastJetFinder_MainCal

  JetEnergyScale_MainCal

  JetFlavorAssociation_MainCal

  BTagging_MainCal
  
  TauTagging_MainCal

  UniqueObjectFinder_MainCal

  MissingET_MainCal
  ScalarHT_MainCal

  TreeWriter
}

#################################
# Propagate particles in cylinder
#################################
module ParticlePropagator ParticlePropagator {
    set InputArray Delphes/stableParticles

    set OutputArray stableParticles
    set ChargedHadronOutputArray chargedHadrons
    set ElectronOutputArray electrons
    set MuonOutputArray muons
    
    source ILDgen/ILDgen_Propagator.tcl
    
}

####################################
# Charged hadron tracking efficiency
####################################
module Efficiency ChargedHadronTrackingEfficiency {
    set InputArray ParticlePropagator/chargedHadrons
    set OutputArray chargedHadrons


    source ILDgen/ILDgen_ChrgHadTrackingEff.tcl 
}
##############################
# Electron tracking efficiency
##############################
module Efficiency ElectronTrackingEfficiency {
    set InputArray ParticlePropagator/electrons
    set OutputArray electrons

    source ILDgen/ILDgen_ElectronTrackingEff.tcl 
}
##########################
# Muon tracking efficiency
##########################
module Efficiency MuonTrackingEfficiency {
    set InputArray ParticlePropagator/muons
    set OutputArray muons

    source ILDgen/ILDgen_MuonTrackingEff.tcl 
}
########################################
# Momentum resolution for charged tracks
########################################
module MomentumSmearing ChargedHadronMomentumSmearing {
  set InputArray ChargedHadronTrackingEfficiency/chargedHadrons
  set OutputArray chargedHadrons

    source ILDgen/ILDgen_ChrgHadMomentumSmearing.tcl

}

###################################
# Momentum resolution for electrons
###################################
module MomentumSmearing ElectronMomentumSmearing {
    set InputArray ElectronTrackingEfficiency/electrons
    set OutputArray electrons

    source ILDgen/ILDgen_ElectronMomentumSmearing.tcl 
}
###############################
# Momentum resolution for muons
###############################
module MomentumSmearing MuonMomentumSmearing {
    set InputArray MuonTrackingEfficiency/muons
    set OutputArray muons

    source ILDgen/ILDgen_MuonMomentumSmearing.tcl 
}

##############
# Track merger
##############
module Merger TrackMerger {
# add InputArray InputArray
  add InputArray ChargedHadronMomentumSmearing/chargedHadrons
  add InputArray ElectronMomentumSmearing/electrons
  add InputArray MuonMomentumSmearing/muons
  set OutputArray tracks
}

#############
#   ECAL
#############
module SimpleCalorimeter ECal {
    set ParticleInputArray ParticlePropagator/stableParticles
    set TrackInputArray TrackMerger/tracks

    set TowerOutputArray ecalTowers
    
    set EFlowTrackOutputArray eflowTracks
    set EFlowTowerOutputArray eflowPhotons
    
    set IsEcal true
    
    set EnergyMin 0.5
    set EnergySignificanceMin 1.0
    
    set SmearTowerCenter true
    
    source ILDgen/ILDgen_ECAL_Binning.tcl
    source ILDgen/ILDgen_ECAL_EnergyFractions.tcl
    source ILDgen/ILDgen_ECAL_Resolution.tcl 
}

##############
# LumiCal
##############
module SimpleCalorimeter LumiCal {
    set ParticleInputArray ParticlePropagator/stableParticles
    set TrackInputArray TrackMerger/tracks
    
    set TowerOutputArray lumicalTowers
    
    set EFlowTrackOutputArray eflowTracks
    set EFlowTowerOutputArray eflowPhotons
    
    set IsEcal true 
    
    set EnergyMin 1.0
    set EnergySignificanceMin 1.0
    
    set SmearTowerCenter true
    
    source ILDgen/ILDgen_LumiCal_Binning.tcl
    source ILDgen/ILDgen_ECAL_EnergyFractions.tcl
    source ILDgen/ILDgen_ECAL_Resolution.tcl
}

#######################################
# ECAL+LumiCal energy flow track merger
#    for HCAL and LHCAL input
#######################################

module Merger EMTrackMerger {
# add InputArray InputArray
  add InputArray ECal/eflowTracks
  add InputArray LumiCal/eflowTracks
  set OutputArray eflowTracks
}

#############
#   HCAL 
#############
module SimpleCalorimeter HCal {
    set ParticleInputArray ParticlePropagator/stableParticles
    set TrackInputArray EMTrackMerger/eflowTracks
    
    set TowerOutputArray hcalTowers
    set EFlowTrackOutputArray eflowTracks
    set EFlowTowerOutputArray eflowNeutralHadrons

    set IsEcal false
    
    set EnergyMin 1.0
    set EnergySignificanceMin 1.0
    
    set SmearTowerCenter true
    
    source ILDgen/ILDgen_HCAL_Binning.tcl
    source ILDgen/ILDgen_HCAL_EnergyFractions.tcl
    source ILDgen/ILDgen_HCAL_Resolution.tcl 
}

##############
# LHCal
##############
module SimpleCalorimeter LHCal {
    set ParticleInputArray ParticlePropagator/stableParticles
    set TrackInputArray EMTrackMerger/eflowTracks
    
    set TowerOutputArray lhcalTowers
    set EFlowTrackOutputArray eflowTracks
    set EFlowTowerOutputArray eflowNeutralHadrons
    
    set IsEcal false 
    
    set EnergyMin 1.0

    set EnergySignificanceMin 1.0
    
    set SmearTowerCenter true
    
    source ILDgen/ILDgen_LHCal_Binning.tcl
    source ILDgen/ILDgen_HCAL_EnergyFractions.tcl
    source ILDgen/ILDgen_HCAL_Resolution.tcl
}

#######################################
# HCAL+LHCAL energy flow track merger
#    for particle filters' input
#######################################

module Merger HCTrackMerger {
# add InputArray InputArray
  add InputArray HCal/eflowTracks
  add InputArray LHCal/eflowTracks
  set OutputArray eflowTracks
}

##############
# BeamCal
##############
module SimpleCalorimeter BeamCal {
    set ParticleInputArray ParticlePropagator/stableParticles
    set TrackInputArray TrackMerger/tracks
    
    set TowerOutputArray bcalTowers
    set EFlowTowerOutputArray bcalPhotons
    
    set IsEcal true 
    
    set EnergyMin 2.0

    set EnergySignificanceMin 1.0
    
    set SmearTowerCenter true
    
    source ILDgen/ILDgen_BeamCal_Binning.tcl
    source ILDgen/ILDgen_BeamCal_EnergyFractions.tcl
    source ILDgen/ILDgen_BeamCal_Resolution.tcl
}

#################
# Electron filter
#################

module PdgCodeFilter ElectronFilter {
  set InputArray HCTrackMerger/eflowTracks
  set OutputArray electrons
  set Invert true

  add PdgCode {11}
  add PdgCode {-11}
}

######################
# ChargedHadronFilter
######################

module PdgCodeFilter ChargedHadronFilter {
  set InputArray HCTrackMerger/eflowTracks
  set OutputArray chargedHadrons
  
  add PdgCode {11}
  add PdgCode {-11}
  add PdgCode {13}
  add PdgCode {-13}
}



###################################################
# Tower Merger (in case not using e-flow algorithm)
###################################################

module Merger Calorimeters {
# add InputArray InputArray
  add InputArray ECal/ecalTowers
  add InputArray HCal/hcalTowers
  add InputArray LumiCal/lumicalTowers
  add InputArray LHCal/lhcalTowers
  set OutputArray towers
}

############################################
# Tower Merger for central calorimeters only
############################################

module Merger MainCalorimeters {
# add InputArray InputArray
  add InputArray ECal/ecalTowers 
  add InputArray HCal/hcalTowers
  set OutputArray towers
}


####################
# Energy flow merger
####################

module Merger EFlowMerger {
# add InputArray InputArray
  add InputArray HCal/eflowTracks
  add InputArray LHCal/eflowTracks
  add InputArray ECal/eflowPhotons
  add InputArray LumiCal/eflowPhotons
  add InputArray HCal/eflowNeutralHadrons
  add InputArray LHCal/eflowNeutralHadrons
  set OutputArray eflow
}

##################################################
# Energy flow merger for central calorimeters only
##################################################

module Merger EFlowMerger_MainCal {
# add InputArray InputArray
  add InputArray HCal/eflowTracks
  add InputArray ECal/eflowPhotons
  add InputArray HCal/eflowNeutralHadrons
  set OutputArray eflow
}

###############
# Photon merger
###############

module Merger PhotonMerger {
# add InputArray InputArray
  add InputArray ECal/eflowPhotons
  add InputArray LumiCal/eflowPhotons

  set OutputArray eflowPhotons
}

#######################
# Neutral hadron merger
#######################

module Merger NeutralMerger {
# add InputArray InputArray
  add InputArray HCal/eflowNeutralHadrons
  add InputArray LHCal/eflowNeutralHadrons
  set OutputArray eflowNeutralHadrons
}

##############################
# BeamCal photon efficiency
##############################
module Efficiency BCalEfficiency {
    set InputArray  BeamCal/bcalPhotons
    set OutputArray beamcalPhotons

    source ILDgen/ILDgen_BeamCalEfficiency.tcl
}


######################
# EFlowFilter
######################

module PdgCodeFilter EFlowFilter {
  set InputArray EFlowMerger/eflow
  set OutputArray eflow
  
  add PdgCode {11}
  add PdgCode {-11}
  add PdgCode {13}
  add PdgCode {-13}
}

######################################
# EFlowFilter for central calorimeters
######################################

module PdgCodeFilter EFlowFilter_MainCal {
  set InputArray EFlowMerger_MainCal/eflow
  set OutputArray eflow
  
  add PdgCode {11}
  add PdgCode {-11}
  add PdgCode {13}
  add PdgCode {-13}
}


###################
# Missing ET merger
###################

module Merger MissingET {
  add InputArray EFlowMerger/eflow
  set MomentumOutputArray momentum
}

module Merger MissingET_MainCal {
  add InputArray EFlowMerger_MainCal/eflow
  set MomentumOutputArray momentum
}


##################
# Scalar HT merger
##################

module Merger ScalarHT {
  add InputArray EFlowMerger/eflow
  set EnergyOutputArray energy
}
module Merger ScalarHT_MainCal {
  add InputArray EFlowMerger_MainCal/eflow
  set EnergyOutputArray energy
}

#################
# Neutrino Filter
#################

module PdgCodeFilter NeutrinoFilter {

  set InputArray Delphes/stableParticles
  set OutputArray filteredParticles

  set PTMin 0.0

  add PdgCode {12}
  add PdgCode {14}
  add PdgCode {16}
  add PdgCode {-12}
  add PdgCode {-14}
  add PdgCode {-16}

}


#####################
# MC truth jet finder
#####################

module FastJetFinder GenJetFinder {
  set InputArray NeutrinoFilter/filteredParticles

  set OutputArray jets

  # algorithm: 1 CDFJetClu, 2 MidPoint, 3 SIScone, 4 kt, 5 Cambridge/Aachen, 6 antikt
  set JetAlgorithm 6
  set ParameterR 0.5

  set JetPTMin 20.0
}

#########################
# Gen Missing ET merger
########################

module Merger GenMissingET {
# add InputArray InputArray
  add InputArray NeutrinoFilter/filteredParticles
  set MomentumOutputArray momentum
}



############
# Jet finder
############
module FastJetFinder FastJetFinder {
    #set InputArray TowerMerger/towers
    set InputArray EFlowMerger/eflow
    set OutputArray jets
    
    source ILDgen/ILDgen_JetFinder.tcl
}

#######################################
# Jet finder for central detectors only
#######################################

module FastJetFinder FastJetFinder_MainCal {
    #set InputArray TowerMerger/towers
    set InputArray EFlowMerger_MainCal/eflow
    set OutputArray jets
    
    source ILDgen/ILDgen_JetFinder.tcl
}

##################
# Jet Energy Scale
##################

module EnergyScale JetEnergyScale {
  set InputArray FastJetFinder/jets
  set OutputArray jets

 # scale formula for jets
  set ScaleFormula {1.00}
}

############################################
# Jet Energy Scale for central detector jets
############################################

module EnergyScale JetEnergyScale_MainCal {
  set InputArray FastJetFinder_MainCal/jets
  set OutputArray jets

 # scale formula for jets
  set ScaleFormula {1.00}
}


########################
# Jet Flavor Association
########################
module JetFlavorAssociation JetFlavorAssociation {

    set PartonInputArray Delphes/partons
    set ParticleInputArray Delphes/allParticles
    set ParticleLHEFInputArray Delphes/allParticlesLHEF
    set JetInputArray JetEnergyScale/jets

    source ILDgen/ILDgen_JetFlavourAssoc.tcl
}

#########################################
# Jet Flavor Association for central jets
#########################################
module JetFlavorAssociation JetFlavorAssociation_MainCal {

    set PartonInputArray Delphes/partons
    set ParticleInputArray Delphes/allParticles
    set ParticleLHEFInputArray Delphes/allParticlesLHEF
    set JetInputArray JetEnergyScale_MainCal/jets

    source ILDgen/ILDgen_JetFlavourAssoc.tcl
}

###################
# Photon efficiency
###################
module Efficiency PhotonEfficiency {
    set InputArray PhotonMerger/eflowPhotons
    set OutputArray photons

    source ILDgen/ILDgen_PhotonEfficiency.tcl
}

##################
# Photon isolation
##################
module Isolation PhotonIsolation {
    set CandidateInputArray PhotonEfficiency/photons
    set IsolationInputArray EFlowMerger/eflow
    set OutputArray photons

    source ILDgen/ILDgen_PhotonIsolation.tcl
}

####################################
# Photon efficiency central detector
####################################
module Efficiency PhotonEfficiency_MainCal {
    set InputArray ECal/eflowPhotons
    set OutputArray photons

    source ILDgen/ILDgen_PhotonEfficiency.tcl
}

####################################
# Photon isolation central detectors
####################################

module Isolation PhotonIsolation_MainCal {
    set CandidateInputArray PhotonEfficiency_MainCal/photons
    set IsolationInputArray EFlowMerger_MainCal/eflow
    set OutputArray photons

    source ILDgen/ILDgen_PhotonIsolation.tcl
}

#####################
# Electron efficiency
#####################
module Efficiency ElectronEfficiency {
    set InputArray ElectronFilter/electrons
    set OutputArray electrons

    source ILDgen/ILDgen_ElectronEfficiency.tcl
}

####################
# Electron isolation
####################
module Isolation ElectronIsolation {
    set CandidateInputArray ElectronEfficiency/electrons
    set IsolationInputArray EFlowMerger/eflow
    set OutputArray electrons
    
    source ILDgen/ILDgen_ElectronIsolation.tcl
}

#################
# Muon efficiency
#################
module Efficiency MuonEfficiency {
    set InputArray MuonMomentumSmearing/muons
    set OutputArray muons

    source ILDgen/ILDgen_MuonEfficiency.tcl
}

################
# Muon isolation
################
module Isolation MuonIsolation {
    set CandidateInputArray MuonEfficiency/muons
    set IsolationInputArray EFlowMerger/eflow
    set OutputArray muons
    
    source ILDgen/ILDgen_MuonIsolation.tcl
}


###########
# b-tagging
###########
module BTagging BTagging {
    set JetInputArray JetEnergyScale/jets
    set BitNumber 0

    source ILDgen/ILDgen_BTagging_80.tcl
}


############################
# b-tagging for central jets
############################
module BTagging BTagging_MainCal {
    set JetInputArray JetEnergyScale_MainCal/jets
    set BitNumber 0

    source ILDgen/ILDgen_BTagging_80.tcl
}

#############
# tau-tagging
#############
module TauTagging TauTagging {
    set ParticleInputArray Delphes/allParticles
    set PartonInputArray Delphes/partons
    set JetInputArray JetEnergyScale/jets

    source ILDgen/ILDgen_TauTagging.tcl
}

##########################
# tau-tagging central jets
##########################
module TauTagging TauTagging_MainCal {
    set ParticleInputArray Delphes/allParticles
    set PartonInputArray Delphes/partons
    set JetInputArray JetEnergyScale_MainCal/jets

    source ILDgen/ILDgen_TauTagging.tcl
}


#####################################################
# Find uniquely identified photons/electrons/tau/jets
#####################################################

module UniqueObjectFinder UniqueObjectFinder {
# earlier arrays take precedence over later ones
# add InputArray InputArray OutputArray
    add InputArray ElectronIsolation/electrons electrons
    add InputArray MuonIsolation/muons muons
    add InputArray PhotonIsolation/photons photons
    add InputArray JetEnergyScale/jets jets
}


#####################################################
# Find uniquely identified object in central detector
#####################################################

module UniqueObjectFinder UniqueObjectFinder_MainCal {
# earlier arrays take precedence over later ones
# add InputArray InputArray OutputArray
    add InputArray ElectronIsolation/electrons electrons
    add InputArray MuonIsolation/muons muons
    add InputArray PhotonIsolation_MainCal/photons photons_MainCal
    add InputArray JetEnergyScale_MainCal/jets jets_MainCal
}


##################
# ROOT tree writer
##################

module TreeWriter TreeWriter {
# add Branch InputArray BranchName BranchClass
  add Branch Delphes/allParticles Particle GenParticle
  
  add Branch GenJetFinder/jets GenJet Jet
  add Branch GenMissingET/momentum GenMissingET MissingET

  add Branch TrackMerger/tracks Track Track
  add Branch Calorimeters/towers Tower Tower
  add Branch MainCalorimeters/towers Tower_MainCal Tower

  add Branch HCal/eflowTracks EFlowTrack Track
  add Branch ECal/eflowPhotons EFlowPhoton_MainCal Tower
  add Branch HCal/eflowNeutralHadrons EFlowNeutralHadron_MainCal Tower
  
  add Branch PhotonMerger/eflowPhotons EFlowPhoton Tower
  add Branch NeutralMerger/eflowNeutralHadrons EFlowNeutralHadron Tower

  add Branch UniqueObjectFinder/electrons Electron Electron
  add Branch UniqueObjectFinder/muons Muon Muon
  add Branch UniqueObjectFinder/photons Photon Photon
  add Branch UniqueObjectFinder/jets Jet Jet

  add Branch UniqueObjectFinder_MainCal/photons_MainCal Photon_MainCal Photon
  add Branch UniqueObjectFinder_MainCal/jets_MainCal Jet_MainCal Jet
  
  add Branch MissingET/momentum MissingET MissingET
  add Branch ScalarHT/energy ScalarHT ScalarHT
  add Branch MissingET_MainCal/momentum MissingET_MainCal MissingET
  add Branch ScalarHT_MainCal/energy ScalarHT_MainCal ScalarHT

  add Branch BeamCal/bcalTowers BCalTower Tower
  add Branch BCalEfficiency/beamcalPhotons beamcalPhotons Photon

}

