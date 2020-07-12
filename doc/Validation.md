# ILCDelphes/doc/Validation.md

Only selected validation results are presented here, showing 
main performance aspects of the model. 

### Track momentum resolution

Momentum resolution for isolated muons: 
Delphes simulation results compared with results presented in 
[ILD IDR](https://arxiv.org/abs/2003.01116)

![Track momentum resolution](track_momentum_resolution.png)

### Jet energy resolution 

Jet energy resolution for exclusive Durham clustering into two jets, 
for e<sup>+</sup>e<sup>-</sup>&rarr;qq events and different flavours of produced primary quarks.

![Jet energy resolution](jet_energy_resolution.png)

### Flavour tagging

Probability of passing tight b-tag selection for jets resulting from different quark flavours, 
for e<sup>+</sup>e<sup>-</sup>&rarr;qq events and exclusive Durham clustering into two jets.


![b-tagging efficiency](btag_eta_plot_jet_4_log.png)

Probability of passing tight c-tag selection for jets resulting from different quark flavours, 
for e<sup>+</sup>e<sup>-</sup>&rarr;qq events and exclusive Durham clustering into two jets.


![c-tagging efficiency](btag_eta_plot_jet_64_log.png)


### Detector acceptance

Average number of reconstructed final state objects 
for e<sup>+</sup>e<sup>-</sup>&rarr;e<sup>+</sup>e<sup>-</sup> events at 250 GeV, 
as a function of electron direction. Note that electrons are reconstructed as 
photons when outside tracking detector acceptance. BeamCal photons are stored in a
separate output branch/collection and are not included in particle flow or 
jet clustering.

![Detector acceptance](electron_response_250.png)

