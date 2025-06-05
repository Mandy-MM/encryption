# encryption

# 🔐 PRESENT 加密算法 Verilog 实现 | Verilog Implementation of the PRESENT Cipher

本项目使用 Verilog 实现了轻量级加密算法 **PRESENT Cipher**，适用于嵌入式系统和物联网设备的安全通信场景。

This project implements the lightweight **PRESENT block cipher** in Verilog, which is widely used in embedded and IoT security systems.

---

## 📁 模块结构 | Module Structure
```
question/
├── encrypt_v1.v           # 第一版加密模块
├── encrypt_v1_test.v      # 对应的测试模块
├── encrypt_v2.v
├── encrypt_v2_test.v
├── encrypt_v3.v
├── encrypt_v3_test.v
├── key_schedule.v         # 密钥调度模块
├── key_schedule_test.v
├── round.v                # 单轮加密模块
├── round_test.v
├── sbox.v                 # S盒模块
├── sbox_test.v
├── util.v                 # 工具模块
├── params.h               # 参数头文件
├── vectors_k.txt/m/c.txt  # 测试向量（Key/Message/Cipher）
├── Makefile               # 编译用
├── LICENSE.txt
├── question.txt           # 可能是题目说明
```

- `encrypt_v1.v` / `encrypt_v2.v` / `encrypt_v3.v`  
  三个版本的加密模块，功能逐步增强。  
  Three versions of the encryption logic with increasing features and complexity.

- `key_schedule.v`  
  密钥调度模块，负责为每一轮生成子密钥。  
  Generates round keys from the master key for each round.

- `round.v`  
  单轮加密模块，包含 S-box、置换、异或操作。  
  A single round of encryption, including S-box, permutation, and XOR.

- `sbox.v`  
  S盒模块，实现非线性代换操作。  
  The substitution box providing non-linear transformation.

- `util.v`  
  工具函数集合，如位拼接、分割等操作。  
  Utility functions for bit manipulation.

- `params.h`  
  参数头文件，定义密钥长度、轮数等常量。  
  Parameter definitions such as key size and round number.

---

## 🧪 测试说明 | Testing

每个模块均配有独立测试文件（`*_test.v`），并使用如下测试向量：

- `vectors_k.txt`: 测试用密钥 Key
- `vectors_m.txt`: 测试用明文 Message
- `vectors_c.txt`: 测试用密文 Ciphertext

可通过 `Makefile` 编译并运行所有测试。

Each module has a corresponding testbench (`*_test.v`) with test vectors provided in:
- `vectors_k.txt`: Key inputs
- `vectors_m.txt`: Message inputs
- `vectors_c.txt`: Expected ciphertexts

Run tests using the included `Makefile`.

---

## 👩‍💻 作者 | Author

Implemented by Mandy Liu.

---

## 📄 License

本项目遵循 LICENSE.txt 中所述的许可协议。  
This project is licensed under the terms described in `LICENSE.txt`.
