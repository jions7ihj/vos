#首先判断系统安装的sshd是否支持tcp_wrappers（默认都支持）
ldd /usr/sbin/sshd | grep libwrap.so
#若没有显示，执行一下安装命令应该就解决
yum install -y tcp_wrappers tcp_wrappers-libs
python -V
#若版本低于2.4，建议升级一下 命令如下
yum update -y python
#install
wget http://nchc.dl.sourceforge.net/project/denyhosts/denyhosts/2.6/DenyHosts-2.6.tar.gz
tar xf DenyHosts-2.6.tar.gz
cd DenyHosts-2.6
python setup.py install
#程序脚本自动安装到/usr/share/denyhosts   库文件自动安装到/usr/lib/python2.3/site-packages/DenyHosts    denyhosts.py自动安装到/usr/bin

#设置启动脚本
cd /usr/share/denyhosts/
#grep -v "^#" denyhosts.cfg-dist > denyhosts.cfg
cp daemon-control-dist daemon-control 
cp denyhosts.cfg-dist denyhosts.cfg 
chown root daemon-control
chmod 700 daemon-control 

cat denyhosts.cfg
—————-denyhosts.cfg————————
SECURE_LOG = /var/log/secure
#ssh日志文件HOSTS_DENY = /etc/hosts.deny
#将阻止IP写入到hosts.denyPURGE_DENY = 5m
#过多久后清除已经禁止的，其中w代表周，d代表天，h代表小时，s代表秒，m代表分钟BLOCK_SERVICE = sshd
#阻止服务名DENY_THRESHOLD_INVALID = 5
#允许无效用户（在/etc/passwd未列出）登录失败次数,允许无效用户登录失败的次数.DENY_THRESHOLD_VALID = 5
#允许普通用户登录失败的次数
DENY_THRESHOLD_ROOT = 5
#允许root登录失败的次数

DENY_THRESHOLD_RESTRICTED = 1
#设定 deny host 写入到该资料夹

WORK_DIR = /usr/share/denyhosts/data
#将deny的host或ip纪录到Work_dir中
SUSPICIOUS_LOGIN_REPORT_ALLOWED_HOSTS = YES

HOSTNAME_LOOKUP=YES
#是否做域名反解

LOCK_FILE = /var/lock/subsys/denyhosts
#将DenyHOts启动的pid纪录到LOCK_FILE中，已确保服务正确启动，防止同时启动多个服务。

ADMIN_EMAIL = denyhosts@163.com
#设置管理员邮件地址

SMTP_HOST = localhost
SMTP_PORT = 25
SMTP_FROM = DenyHosts <nobody@jishuyiliu.com>
SMTP_SUBJECT = DenyHosts Report

AGE_RESET_VALID=1d
#有效用户登录失败计数归零的时间

AGE_RESET_ROOT=1d
#root用户登录失败计数归零的时间

AGE_RESET_RESTRICTED=5d
#用户的失败登录计数重置为0的时间(/usr/share/denyhosts/data/restricted-usernames)

AGE_RESET_INVALID=10d
#无效用户登录失败计数归零的时间

DAEMON_LOG = /var/log/denyhosts
#自己的日志文件
—————-denyhosts.cfg————————

cd /etc/init.d
ln -s /usr/share/denyhosts/daemon-control /etc/init.d/denyhosts
chkconfig --add denyhosts
chkconfig denyhosts on
service denyhosts start