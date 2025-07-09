+++
title = 'LLM concepts'
date = 2025-07-09T08:00:00+12:00
draft = false
tags = ["LLM", "AI"]
description = "Summarize LLMs from the following aspects: lifecycle, historical evolution, core concepts, and model architectures of varying complexity."
+++


# 1 Basic concepts
An LLM goes through two main phases(Lifecycle of an LLM): **Training** and **Inference**:

* **Pre-training** : it learns to predict the next word or token from large amounts of unlabeled text.
* **Fine-tuning** : The model is adapted to specific tasks or domains using labeled datasets.
* **Post-training**(Alignment) : it learns useful behaviors such as following instructions, tool use, and reasoning.
* **Inference** : The trained model responds to user inputs in real time without updating its internal parameters.  

Foundational Techniques that Underpin LLM Architecture :  

| Module / Capability          | Key Paper                                                                                         | Authors                          | Contribution to LLMs                                                      |
|-----------------------------|----------------------------------------------------------------------------------------------------|----------------------------------|----------------------------------------------------------------------------|
| Deep Representation (CNN)   | [ImageNet Classification with Deep Convolutional Neural Networks (2012)](https://proceedings.neurips.cc/paper_files/paper/2012/file/c399862d3b9d6b76c8436e924a68c45b-Paper.pdf) | Alex Krizhevsky et al.          | Demonstrated the power of deep learning via CNNs on large-scale data      |
| Residual Connection          | [Deep Residual Learning for Image Recognition (2015)](https://arxiv.org/abs/1512.03385)            | Kaiming He et al.               | Enabled training of very deep networks; essential in Transformer sublayers |
| Sequence Modeling (RNN)     | [Sequence to Sequence Learning with Neural Networks (2014)](https://arxiv.org/abs/1409.3215)        | Ilya Sutskever et al.           | Introduced encoder-decoder architecture for NLP tasks                     |
| Attention Mechanism         | [Attention Is All You Need (2017)](https://arxiv.org/abs/1706.03762)                               | Vaswani et al.                  | Introduced the Transformer, replacing recurrence with self-attention      |
| Normalization               | [Layer Normalization (2016)](https://arxiv.org/abs/1607.06450)                                     | Jimmy Ba et al.                 | Improved training stability in sequence models                            |
| Language Representation     | [BERT: Pre-training of Deep Bidirectional Transformers (2018)](https://arxiv.org/abs/1810.04805)    | Devlin et al.                   | Enabled bidirectional contextual language understanding                    |
| Generative Pretraining      | [Improving Language Understanding by Generative Pre-Training (2018)](https://cdn.openai.com/research-covers/language-unsupervised/language_understanding_paper.pdf) | Radford et al. (OpenAI)         | Introduced GPT framework for generative language modeling                  |
| Scaling Laws                | [Scaling Laws for Neural Language Models (2020)](https://arxiv.org/abs/2001.08361)                  | Jared Kaplan et al. (OpenAI)    | Quantified model performance growth with scale in parameters and data     |


## 1.0 Initial input processing 

| Concept            | Description                                               | Problem Solved                                         |
|--------------------|-----------------------------------------------------------|--------------------------------------------------------|
| Tokenization       | Breaks text into tokens such as subwords, characters, or word pieces | Converts natural language into discrete units understandable by models |
| Vocabulary         | A predefined set of tokens                                | Reduces Out-Of-Vocabulary (OOV) issues and standardizes encoding |

## 1.1 Vector Representation (Embedding Space)
| Component               | Description                                              | Problem Solved                                |
|------------------------|----------------------------------------------------------|------------------------------------------------|
| Token Embedding Lookup | Each token is mapped to a high-dimensional vector (e.g., 768 or 1536 dimensions) | Captures basic semantic relationships between tokens |
| Sentence/Paragraph Pooling | Techniques like Mean Pooling, Attention Pooling        | Aggregates token-level vectors into sentence-level representation |

**Multilingual Embedding Alignment** is a capability that must be actively built during the training process through the use of specific data, model architectures, and objective functions—it is not something the model acquires naturally on its own. Its implementation relies on training strategies such as shared tokenizers, multilingual corpora, contrastive learning, and parallel sentence alignment mechanisms.

## 1.2 Contextual Modeling and Semantic Understanding (Transformer Backbone)

| Component                          | Description                                                 | Problem Solved                                                  |
|-----------------------------------|-------------------------------------------------------------|------------------------------------------------------------------|
| Multi-layer Transformer Encoder   | Multi-head self-attention mechanism to encode context       | Understand long-range dependencies, capture syntax and semantics |
| Feed-Forward Network (FFN)        | Enhances non-linear representation ability                  | Improves diversity and depth of model representations            |
| Residual Connection & LayerNorm   | Stabilizes training, alleviates gradient vanishing          | Improves trainability of deep networks                           |
![transformer](/images/2025-07/transformer.png)

## 1.3 Output Decoding / Generation

| Component                          | Description                                                        | Problem Solved                                      |
|-----------------------------------|--------------------------------------------------------------------|-----------------------------------------------------|
| Linear Projection + Softmax       | Maps the Transformer output to a probability distribution over the vocabulary | Enables prediction and generation of the next token |
| Greedy / Beam / Sampling Decoding | Strategies to select the next word/token from the probability distribution | Controls the quality, diversity, and coherence of generated text |


# LLM Solution from simple to complect