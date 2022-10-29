import torch
from torch import nn
from tqdm import tqdm
import numpy as np
import matplotlib.pyplot as plt
m = nn.ReLU()
m2 = nn.ReLU() # Why are there 2 of these?

x = np.arange(-3,3,0.004, dtype = 'float')
y = np.sin(x, dtype = 'float')
x_in = torch.tensor(x.reshape([1,1500]))
y_in = torch.tensor(y)
w1 = torch.tensor(np.random.normal(0, 1, size=(10,1)), requires_grad=True)
b1 = torch.tensor(np.random.normal(0, 1, size=(10,1)), requires_grad=True)
w2 = torch.tensor(np.random.normal(0, 1, size=(10,10)), requires_grad=True)
b2 = torch.tensor(np.random.normal(0, 1, size=(10,1)), requires_grad=True)
w3 = torch.tensor(np.random.normal(0, 1, size=(1,10)), requires_grad=True)
b3 = torch.tensor(np.random.normal(0, 1, size=(1,1)), requires_grad=True)
        
lr = 0.01
n_epochs = 10000
info = np.zeros(n_epochs)

for epoch in tqdm(range(n_epochs)):
    y1 = m(torch.matmul(w1, x_in)+b1)
    yhat = torch.matmul(w3,m2(torch.matmul(w2, y1)+b2))+b3
    error = y_in - yhat
    loss = (error ** 2).mean()

    loss.backward()

    with torch.no_grad(): # Update weights
        w1 -= lr * w1.grad
        w2 -= lr * w2.grad
        w3 -= lr * w3.grad
        b1 -= lr * b1.grad
        b2 -= lr * b2.grad
        b3 -= lr * b3.grad
    
    # PyTorch is "clingy" to its computed gradients, we need to tell it to let it go...
    # What exactly is happening here?
    w1.grad.zero_()
    w2.grad.zero_()
    w3.grad.zero_()
    b1.grad.zero_()
    b2.grad.zero_()
    b3.grad.zero_()

    info[epoch] = loss
    
# Compute only a forward pass with unkown input x
y_out = np.array(yhat.detach().numpy()) # convert yhat back to numpy array
plt.plot(x, y_out.flatten())
plt.plot(x,y)
plt.show()

xInput = np.array([1,2], dtype = 'float')
x_in = torch.tensor(xInput.reshape(1,len(xInput)))
y1 = m(torch.matmul(w1, x_in)+b1)
yhat = torch.matmul(w3,m2(torch.matmul(w2, y1)+b2))+b3
y_out = np.array(yhat.detach().numpy()) # convert yhat back to numpy array
print(y_out - np.sin(xInput))
