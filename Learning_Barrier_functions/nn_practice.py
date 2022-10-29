#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Oct 13 15:21:31 2022

@author: dhruv
"""

import torch

x = torch.tensor([1.,2.,3.], requires_grad=True)
w = torch.tensor([3.,4.,5.], requires_grad=True)

f = torch.dot(w.reshape(3,),x.reshape(3,))**2
f.backward()
print(w.grad)