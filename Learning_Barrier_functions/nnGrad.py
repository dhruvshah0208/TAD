# In this file we need to implement finding the gradient of the learnt function 
import torch
from torch import nn
import numpy as np
from tqdm import tqdm
import matplotlib.pyplot as plt
import torch.optim as optim

from nnClassPractice import NeuralNetwork

model = NeuralNetwork()

xInput = np.array([1])
x_in = torch.tensor(xInput.reshape(len(xInput),1),dtype=torch.float32, requires_grad=True)

f = model(x_in)
f.backward(retain_graph = True) # Required if one wants to backprop a second time
print(x_in.grad)

g = f + x_in.grad.mean()
g.backward()