# php_env
#### 利用Docker搭建的php开发环境

默认操作系统os x，如果win10所有命令均在PowerShell终端完成
---

&emsp;&emsp;进入到*docker-compose.yml*根路径，执行`docker-compose up -d` 构建完容器后
查看`docker ps -a`查看安装的容器是否正常运行

容器启动成功后通过sshd来连接:
   
&emsp;&emsp;主机地址为127.0.0.1 端口号为22

&emsp;&emsp;用户身份验证方法选择public key 用户密钥选择phpenv文件夹下的insecure_id_rsa文件

启动container
 ```
 docker-compose start
 ```
重启container
```
docker-compose restart
```
停止container
```
docker-compose stop
```
卸载container
```
docker-compose down -v
```

---

#### 使用docker-sync来实现本地文件与虚拟机文件同步

download docker-sync，gem install docker-sync(osx/linux/windows)
```
docker-sync start 进入phpenv目录启动sync
```
```
docker-sync list 查看是否启动成功
```
（osx）出现command not found: docker-sync，请将docker-sync加入环境变量，具体操作：
/etc/bashrc 是针对系统所有用户的全局变量，只有root用户才能修改这两个文件，对一般用户来说是他们是只读的,
所以对于一般用户而言，通常我们修改~/.bash_profile来设置环境变量，设置为
```
export PATH=$PATH:~/.gem/ruby/2.3.0/bin
```
需要source才能立即生效






