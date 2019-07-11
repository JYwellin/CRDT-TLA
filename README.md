# `CRDT-TLA`
CRDT协议的TLA+描述与验证

## 项目说明
无冲突复制数据类型(Conflict-free Replicated Data Types,CRDTs)是一种抽象分布式数据类型,它封装了并发冲突的消解策略,向上层应用提供所需的强最终一致性.

本项目基于TLA+语言和TLC模型检验工具给出了一个可复用的、模块化的 CRDT 协议描述与验证框架,它包括网络通信层、协议接口层、具体协议层与规约层.

## TLA+模块说明
下图显示了项目中关键模块之间的关系:
从模块A指向模块B的实线表示A扩展了B,
从模块A指向模块B的虚线表示A实例化了B.

![Module Graph](https://raw.githubusercontent.com/JYwellin/CRDT-TLA/master/fig/modules.png)

层次|模块|作用
:---:|:--:|:---:
规约层|SEC|强最终一致性|
规约层|OpSEC|基于操作的协议的SEC|
规约层|StateSEC|基于状态的协议的SEC|

层次|模块|作用
:---:|:--:|:---:
协议层|OpCounter|基于操作的Counter协议
协议层|StateCounter|基于状态的Counter协议
协议层|OpAWSet|基于操作的AWSet协议
协议层|StateAWSet|基于状态的AWSet协议33

层次|模块|作用
:---:|:--:|:---:
接口层|CRDTInterface|为协议提供统一的接口

层次|模块|作用
:---:|:--:|:---:
网络层|SystemModel|系统模型
网络层|BasicNetwork|基础网络
网络层|ReliableNetwork|可靠网络
网络层|CausalNetwork|因果网络
网络层|ReliableCausalNetwork|可靠因果网络

## 如何运行？
1. 单独运行.

创建并运行TLC模型 [方法](https://tla.msr-inria.inria.fr/tlatoolbox/doc/model/model.html).

2. 批量运行(***推荐***).

我们编写了可以自动批量执行实验模型的脚本.

详见[JYwellin/crdt-experiments](https://github.com/JYwellin/crdt-experiment).
