# This file will basically implement the previous file in a more organised way by defining classes
import torch
from torch import nn
import numpy as np
from tqdm import tqdm
import matplotlib.pyplot as plt
import torch.optim as optim


class NeuralNetwork(nn.Module):
    def __init__(self):
        super(NeuralNetwork, self).__init__()
        self.flatten = nn.Flatten()
        self.linear_relu_stack = nn.Sequential(
            nn.Linear(1, 10),
            nn.ReLU(),
            nn.Linear(10, 10),
            nn.ReLU(),
            nn.Linear(10, 1),
        )

    def forward(self, x):
        x = self.flatten(x)
        output = self.linear_relu_stack(x)
        return output
    
    def train_network_GD(self,x_in,y_in,lr,n_epochs):
        info = np.zeros(n_epochs)
        for epoch in tqdm(range(n_epochs)):
            yOut = model(x_in) 
            loss = ((yOut - y_in) ** 2).mean()
            # Define custom loss function here.

            model.zero_grad()     # zeroes the gradient buffers of all parameters
            loss.backward()
            for f in model.parameters():
                f.data.sub_(f.grad.data * lr ) # Update the weights            
            info[epoch] = loss
        
        return yOut
    
    def train_network_SGD(self,x_in,y_in,lr,n_epochs):
        info = np.zeros(n_epochs)
        for epoch in tqdm(range(n_epochs)):
            yOut = model(x_in) 
            loss = ((yOut - y_in) ** 2).mean()
            
            
            # create your optimizer
            optimizer = optim.SGD(model.parameters(), lr=0.01)

            optimizer.zero_grad()   # zero the gradient buffers
            loss.backward()
            optimizer.step()    # Does the update

            info[epoch] = loss
        
        return yOut
    
        
if __name__ == "__main__":
        
    model = NeuralNetwork()
    lr = 0.1
    n_epochs = 2000
    
    # Create input and output data
    xInput = np.arange(-3,3,0.004)
    x_in = torch.tensor(xInput.reshape(len(xInput),1),dtype=torch.float32)
    y = np.sin(xInput)
    y_in = torch.tensor(y.reshape(len(y),1),dtype=torch.float32)
    
    yOut_GD = model.train_network_GD(x_in,y_in,lr,n_epochs)    
    y_out_GD = np.array(yOut_GD.detach().numpy()) # convert yhat back to numpy array
    
    yOut_SGD = model.train_network_SGD(x_in,y_in,lr,n_epochs)    
    y_out_SGD = np.array(yOut_SGD.detach().numpy()) # convert yhat back to numpy array
    
    # Plot the results
    fig, (ax0, ax1) = plt.subplots(nrows=1, ncols=2, sharex=True,
                                        figsize=(12, 6))
    
    ax0.set_title('SGD Results')
    ax0.plot(xInput, y_out_SGD.flatten())
    ax0.plot(xInput,y)
    
    ax1.set_title('GD Results')
    ax1.plot(xInput, y_out_GD.flatten())
    ax1.plot(xInput,y)
    
    fig.suptitle('SGD vs GD with ReLU activation n_epochs = ' + str(n_epochs))
    plt.show()
    
    
    
    
    
    
    



