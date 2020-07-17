#!/usr/bin/python3.4
# -*-coding:utf-8 -*

import pyhh
import numpy as np
import matplotlib.pyplot as plt

# customize a neuron model if desired
model = pyhh.HHModel()
model.gNa = 120  # typically 120
model.gK = 36  # typically 36
model.EK = -12  # typically -12

# customize a stimulus waveform
stim = np.zeros(20000)
# stim[7000:13000] = 50  # add a square pulse
stim[2000:5000] = 1
stim[6000:9000] = 3
stim[10000:13000] = 20 
stim[14000:19000] = 50 

# stim[2000:19000] = 5

# simulate the model cell using the custom waveform
sim = pyhh.Simulation(model)
sim.Run(stimulusWaveform=stim, stepSizeMs=0.01)


# plot the results with MatPlotLib
plt.figure(figsize=(10, 8))

ax1 = plt.subplot(211)
ax1.plot(sim.times, sim.Vm - 70, color='b')
ax1.set_ylabel("Potential (mV)")
ax1.set_title("Hodgkin-Huxley Spiking Neuron Model", fontSize=16)

ax2 = plt.subplot(212)
ax2.plot(sim.times, stim, color='r')
ax2.set_ylabel("Stimulation (µA/cm²)")

ax2.set_xlabel("Simulation Time (milliseconds)")

plt.tight_layout()
plt.savefig("stimdep.png")
plt.show()
