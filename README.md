# `CRDT-TLA`
Specifying and Verifying CRDT Protocols using TLA+

## Specification
Conflict-free Replicated Data Types (CRDT) are replicated data types that encapsulate the mechanisms for resolving concurrent conflicts. They guarantee strong eventual consistency among replicas in distributed systems, which requires replicas that have executed the same set of updates be in the same state. However, CRDT protocols are subtle and it is difficult to ensure their correctness. 

This project leverages model checking to verify the correctness of CRDT protocols. Specifically, we propose a reusable framework for modelling and verifying CRDT protocols. The framework consists of four layers, i.e., the communication layer, the interface layer, the protocol layer, and the specification layer.

## Papers
See [paper-crdt-TLA+](https://raw.githubusercontent.com/JYwellin/CRDT-TLA/master/paper/2020-JOS-CRDT.pdf).

## TLA+ module description
The following figure shows the relationship between the key modules in the project:

The solid line from module A to module B indicates that A extends B,

The dashed line from module A to module B indicates that A instantiates B.

![Module Graph](https://raw.githubusercontent.com/JYwellin/CRDT-TLA/master/fig/modules.png =480x360)

layer|module|function
:---:|:--:|:---:
specification|Correctness|the specification of SEC and EV|
specification|OpCorrectness|the specification of SEC and EV for op-based CRDT|
specification|StateCorrectness|the specification of SEC and EV for state-based CRDT|

layer|module|function
:---:|:--:|:---:
protocol|OpCounter|the specification of op-based counter
protocol|StateCounter|the specification of state-based counter
protocol|OpAWSet|the specification of op-based AWSet
protocol|StateAWSet|the specification of state-based AWSet

layer|module|function
:---:|:--:|:---:
interface|CRDTInterface|provide a unified interface for two types of CRDT

layer|module|function
:---:|:--:|:---:
communication|SystemModel|the specification of system model
communication|BasicNetwork|the specification of basic network
communication|ReliableNetwork|the specification of reliable network
communication|CausalNetwork|the specification of casual network
communication|ReliableCausalNetwork|the specification of reliable causal network

## How to run？
1. Run separately.

Create and run TLC models [in the usual way](https://tla.msr-inria.inria.fr/tlatoolbox/doc/model/model.html).

2. Run in batch (***Recommended***).

We write scripts to automatically conduct a batch of experiments; see[JYwellin/crdt-experiments](https://github.com/JYwellin/crdt-experiment).
