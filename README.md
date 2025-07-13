# 🔥 OFT Burn Exploit Proof of Concept

This repository demonstrates a security vulnerability in LayerZero’s OFT (`Omnichain Fungible Token`) implementation. The exploit shows that tokens can be burned on the source chain even if the cross-chain message delivery fails.

---

## ⚠️ Vulnerability Summary

In `OFT.sol`, the `sendFrom()` function debits (burns) tokens on the source chain **before** ensuring message delivery success. If `_lzSend()` fails, the tokens are lost — breaking atomicity.

---

## ✅ How to Reproduce the Exploit

### 🔧 Prerequisites

- Docker installed on your system
- Basic shell/terminal usage

### 🐳 Steps

```bash
git clone https://github.com/your-name/oft-burn-poc.git
cd oft-burn-poc
docker build -t oft-burn-poc .
docker run --rm oft-burn-poc
