# CRDT-TLA+
CRDT协议的TLA+描述与验证
## 模块说明
层次|模块|作用
:---:|:--:|:---:
规约层|SEC|强最终一致性|

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
网络层|Message|模拟消息
网络层|Network|模拟任意网络
网络层|ReliableNetwork|模拟一个reliable delivery的网络
网络层|CausalNetwork|模拟一个causal delivery的网络
网络层|ReliableCausalNetwork|同时满足reliable delivery和causal delivery