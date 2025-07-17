# Continuous time Markov chain for Smart watch sensors

This code implements the model discussed in the paper on detecting human activity from smartwatch sensors such as walking or running. Data collected from sensors is prone to noise due to external disturbances during movement. We consider a continouse time Markov chain that controls the model and also ensures that it is detectable. The control model is adapted from a simulink spark engine model that aims to maximise the engine efficiency from inputs such as throttle and brake level. 

Requirements
---
This code is based on the Text classifier code found at:

https://au.mathworks.com/help/sdl/ug/single-cylinder-engine.html

Smartwatch Dataset
---

<img width="400" height="200" alt="Image" src="https://github.com/user-attachments/assets/9c8a7739-5899-471b-bbc6-663c4698997e" />

<img width="400" height="200" alt="Image" src="https://github.com/user-attachments/assets/7f399511-d2e3-4e81-bf48-c0cdcc8fb0be" />
