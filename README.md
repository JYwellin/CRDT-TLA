# `CRDT-TLA+`
CRDT协议的TLA+描述与验证

## TLA+模块说明

下图显示了项目中的关键模块之间的关系

![Module Graph](https://github.com/JYwellin/CRDT-TLA/tree/master/fig/modules.bmp)

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
协议层|StateAWSet|基于状态的AWSet协议
协议层|OptimizedAWSet|优化版本的State-based AWSet协议
协议层|RGA|RGA协议(基于操作的列表协议）
协议层|InsertTree|模拟RGA协议的数据结构

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
