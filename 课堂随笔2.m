

一、了解XMPP
协议(标准)
XMPP 即时通讯协议
SGIP 短信网关协议 这手机发短信

移动支付和网页支付

0x23232[0,1] 0x23232 0x23232 0x23232

只有协议，必须会有协议文档


二、环境配置
1.安装mysql
2.修改mysql的帐户的密码
》sqlite（移动平台） ，是没有密码直接连接数据库
》mysql sqlServer （服务端的数据库） 是有帐户和密码
  默认安装完mysql,他的帐户是root 密码为空

"使用命令登录mysql"
mysql 用来登录
//mysql -u root -p

查询Mysql里的数据库
//show databases;


mysqladmin 管理帐号
"mysqladmin 修改root的密码 123456"


3.安装openfire服务
》opnfire服务器是基于java语言写，也就意味着你的电脑有java运行环境
》怎么查看电脑有没有安装java的运行环境
在终端使用 java -version
如果有信息显示，代表安装。
如果没有，怎么办？安装java运行环境 安装文件在"服务器/jdk-7u45-macosx-x64.dmg"


4.配置Openfire
》要配置数据库(在mysql创建一个openfire数据库专门给openfire服务器)
》导入Openfire里数据库表脚本文件

》配置openfire的管理员密码



5.使用客户端登录Openfire的服务器
》系统的"信息" 帐户名称 ＝ 用户名 + @ +服务器名称：teacher.local
  zhangsan@teacher.local

》登录的时候，可以自己配置下域名
修改/ect/hosts;
打终端，使用命令 "sudo vi /etc/hosts"

6.学习xmmpframework的框架的目录结构
》当学习第三方框架的时候是怎么学习？
a> demo 示例程序
b> 文档
c> readMe


三、学习异步Socket框架GCDAsyncSokcet
1.昨天写个聊天室，用GCDAsyncSokcet 来实现聊天室


四、xmppframework框架的导入


五、XMPP用户登录

六、微信项目(ipad/iphone版本) ios7

1.创建项目，用git版控制
2.导入xmppframwork框架
3.导入APPICON 启动图片
4.简单的做下登录界面(iphone / ipad 适配)
5.实现登录
6.注册
7.实现主界面
8.获取个人信息(头像、电话、邮箱....)
9.获取好友列表 添加添加好友 删除好
10.发送聊天消息
11.实现文件传输




