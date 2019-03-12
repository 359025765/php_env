# php_env
#### 利用Docker搭建的php开发环境

默认操作系统os x，如果win10所有命令均在PowerShell终端完成

---

&emsp;&emsp;进入到*docker-compose.yml*根路径，执行`docker-compose up -d --build` 构建完容器后
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

#### 使用phpstorm来实现本地文件与虚拟机文件同步

&emsp;&emsp;打开phpstorm的settings->Deployment->添加类型为sftp
prot设置22
```
Root path 为Nginx配置的项目路径
```
private key file 私钥路径
```
选中*Mappings*选项卡，配置*Local path*本地项目路径，*Deployment path on server* 一栏中填入"/"
```
在修改Deployment->options中的*Upload changed files automatically to default sercer*为"Always"
```
最后在测试一下"Test SFTP connection"连接是否成功
```
&emsp;&emsp;文件共享成功后只需要右键文件夹，选择“Deployment”后
可以执行“Upload to xxx”同步本地文件至虚拟机，
“Download from xxx”同步虚拟机文件至本地，
“Sync with Deployed to xxx”弹出一个本机文件与虚拟机文件对比的弹窗，可以进行选择性的同步文件





