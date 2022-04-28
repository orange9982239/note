# 安裝
1. 下載mc.exe
2. 複製到 C:\Windows\System32

# 設定
```sh
mc config host add {serverAliasName} {URL} {ACC} {PW}
mc config host add minio-server http://192.168.1.1:9000 #account# #password#
```

# 操作
1. 列出所有桶
```sh
mc tree {serverAliasName}
mc tree minio-server
```
