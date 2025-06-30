+++
title = 'Understanding AI One Step at a Time: My Personal Learning Journey'
date = 2024-07-30T20:16:04+13:00
draft = true
tags = ["AI"]
description = "As a programmer stepping into the world of artificial intelligence, I quickly realized that understanding the sequence of learning matters just as much as the content itself. In this post, I’ll share the step-by-step path I followed—from grasping basic concepts to working with key algorithms like decision trees, neural networks, and transformers. If you're new to AI and wondering where to start or how to avoid getting lost in theory, this roadmap might save you some time and frustration."
+++


帮助理解：机器学习的算法和入门
传统机器学习：逻辑回归、决策树、随机森林、朴素贝叶斯、XGBoost

基于神经网络的机器学习：
6个方向：CV、NLP、多模态、搜索广告推广、语音、强化学习

基础：CNN（CV），NLP（RNN）
然后:Transformer(架构图，手画，底层源代码手写一遍)

具体问题，具体分析

# Case 1: A Learning Path Starting with CNN

Convolutional Neural Networks (CNNs) are a powerful entry point into the world of artificial intelligence, especially for those interested in computer vision. However, to fully understand and apply CNNs effectively, it's important to build up foundational knowledge in several key areas.

## 1.1 Math Foundations

- **Linear Algebra**  
  Understand vectors, matrices, matrix multiplication, and tensors. These are crucial for implementing convolutions and understanding how data flows through layers.

- **Calculus**  
  Learn partial derivatives and the chain rule, which are essential for understanding backpropagation.

- **Basic Probability & Statistics**  
  Grasp the basics of distributions, expectations, and cross-entropy loss for classification tasks.

## 1.2 Core Machine Learning Concepts

- **Supervised Learning Basics**  
  Know the difference between classification and regression, and how data is labeled and split.

- **Common Algorithms**  
  Understand linear/logistic regression, decision trees, and the idea of loss functions and optimization.

- **Overfitting & Regularization**  
  Learn why models overfit and how to use techniques like L2 regularization to reduce it.

## 1.3 Neural Network Fundamentals

- **Neuron Structure**  
  Inputs, weights, bias, and activation functions.

- **Activation Functions**  
  ReLU, Sigmoid, Tanh—how they work and when to use them.

- **Multilayer Perceptrons (MLPs)**  
  Understand their architecture and limitations, which CNNs aim to solve.

- **Backpropagation**  
  The mechanism by which neural networks learn.

## 1.4 Image Processing Basics

- **Image Representation**  
  Learn how images are stored as pixel matrices with color channels (RGB).

- **Basic Filters**  
  Concepts like edge detection (Sobel, Laplacian) and blurring (Gaussian filters).

## 🧱 CNN-Specific Concepts

- **Convolutional Layers**  
  Learn how filters slide over input images to extract features.

- **Pooling Layers**  
  Understand max pooling and average pooling for dimensionality reduction.

- **Padding & Stride**  
  Learn how these affect output size and information preservation.

- **Feature Maps**  
  Visualizing what CNNs learn from images.

## 1.5 Hands-on Practice

- **Use PyTorch or TensorFlow**  
  Start with simple CNNs on MNIST or CIFAR-10 datasets.

- **Jupyter Notebook or Google Colab**  
  Leverage free GPU resources and visualize outputs layer by layer.

---

By following this structured path, you not only build a solid foundation in AI fundamentals but also quickly reach hands-on applications with real datasets. Starting with CNNs can be motivating and practical—just make sure you reinforce the basics along the way.
