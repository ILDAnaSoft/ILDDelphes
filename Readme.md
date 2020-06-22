# ILDDelphes
### ILD detector model for Delphes  


New version of the ILD detector model is aviable for test. 
The main structure should is not expected to change. 
However, minor changes and improvements are still expected 
depending also on test results.

### Motivation

[Delphes](https://github.com/delphes/delphes) is a framework 
for fast simulation of a generic collider experiment. It allows to take
into account basic experimental effects as acceptance, efficiency 
and detector resolution, and provides also expected results of event 
reconstruction (as lepton identification, flavour taging and jet 
clustering). 

ILD detector description which is currently distributed as a part of 
the Delphes framework is extremply simplified and outdated - 
**it should not be used!**
As a part of the [2021 Snowmass](https://snowmass21.org/start) study 
the new model has been developed, based on the detailed ILD detector 
simulation results presented in [ILD IDR](https://arxiv.org/abs/2003.01116).
 
More information on the implementation can be found in 
[doc/](https://github.com/ILDAnaSoft/ILDDelphes/tree/master/doc)

### Installation

No dedicated installation of the model is required. You just need to:

 1. Select model version (subcatalog) from 
[cards/](https://github.com/ILDAnaSoft/ILDDelphes/tree/master/cards) 
([cards/new/](https://github.com/ILDAnaSoft/ILDDelphes/tree/master/cards/new)
 for the most recent version).
 2. Download the main model file (`delphes_card_ILDgen.tcl`) 
and the include file catalog (`ILDgen/`) into `cards/` catalog 
of your Delphes installation.
 3. Run Delphes specifying `delphes_card_ILDgen.tcl` as the detector model.

### How to run it

Delphes support many input file formats, so it can be used to process
event samples generated with different event generators, 
including Whizard and Madgraph.
More information about Delphes installation and running can be 
found on [GitHub](https://github.com/delphes/delphes)

### Issues and contact

In case of problems, questions or requests, please:

- use Github [issue interface](https://github.com/ILDAnaSoft/ILDDelphes/issues)
- or try to contact us directly by e-mail:
    - [Aleksander Filip Zarnecki](mailto:zarnecki@fuw.edu.pl)


