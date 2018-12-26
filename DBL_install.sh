yum install httpd mariadb mariadb-server php-mysql php-gd  php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-bcmath php-mhash php glibc.i686  zlib.i686 zlib.x86_64  krb5-libs.i686 krb5-libs.x86_64 -y
wget http://118.142.51.162/update/smb_scheduler_install-v1.9.2.tar.gz
tar -zxvf smb_scheduler_install-v1.9.2.tar.gz
cd smb_scheduler_install
./smb_scheduler_install.sh 
systemctl start mariadb
./smb_scheduler_install.sh 
cd
systemctl restart httpd
ip addr
systemctl enable httpd.service
systemctl disable httpd
systemctl enable httpd.service
systemctl stop firewalld
systemctl disable firewalld
systemctl enable mariadb
setenforce 0
chmod +x /etc/rc.d/rc.local 
ip addr
vi /etc/rc.local 