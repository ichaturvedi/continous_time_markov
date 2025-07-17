# Continuous time Markov chain for Smart watch sensors

This code implements the model discussed in the paper on detecting human activity from smartwatch sensors such as walking or running. Data collected from sensors is prone to noise due to external disturbances during movement. We consider a continouse time Markov chain that controls the model and also ensures that it is detectable. The control model is adapted from a simulink spark engine model that aims to maximise the engine efficiency from inputs such as throttle and brake level. 

Requirements
---
This code is based on the Text classifier code found at:

https://au.mathworks.com/help/sdl/ug/single-cylinder-engine.html

Smartwatch Dataset
---

Data collected from Smartwatch for a single participant every few minutes for different activities : 

![Image](https://github.com/user-attachments/assets/31126fc9-f2bd-4dbf-8673-2dc3d149bc4f)

Hidden Markov Model
---
- The training data contains the heart rate, number of steps and intensity for different participants and the activity label
- Hidden markov models are used to extract the transition probabilities between different activities

We can run the script in hmm folder as follows : 

get_hmm_prob(inputfile)
- Input is the training data
- Output is a file containing the transition and emission probabilities

Simulink 
---

- We extract features using a simulink control model

We can run the simulink script as follows :

create_train_simulink(inputfile)
- Input is the training data
- Output is the control parameters needed for the stability constraint 

Stability Constraint
---

- We select a subset of training samples using a stability constraint
- This requires the Yalmip package at https://yalmip.github.io/

We can select the samples using the following script in semidef folder:

select_samples(inputfile)
- Input is the training data, probability matrix and the simulink parameter matrices
- Output is a subset of training samples

Classification
---
