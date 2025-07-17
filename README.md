# Continuous time Markov chain for Smart watch sensors

This code implements the model discussed in the paper on detecting human activity from smartwatch sensors such as walking or running. Data collected from sensors is prone to noise due to external disturbances during movement. We consider a continouse time Markov chain that controls the model and also ensures that it is detectable. The control model is adapted from a simulink spark engine model that aims to maximise the engine efficiency from inputs such as throttle and brake level. 

Requirements
---
This code is based on the Text classifier code found at:

https://au.mathworks.com/help/sdl/ug/single-cylinder-engine.html

Smartwatch Dataset
---

![Image](https://github.com/user-attachments/assets/b54cd449-0c6e-48c5-92ca-535b110621b9)

![Image](https://github.com/user-attachments/assets/f35ae2e7-4739-4ddd-8b2a-09e119050e94)
