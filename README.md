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

Simulink 
---

Stability Constraint
---

Classification
---
