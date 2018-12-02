yum install -y openvpn
wget https://raw.githubusercontent.com/21ki/vos/master/openvpn/openvpn.tar.gz --no-check-certificate
tar -zxvf openvpn.tar.gz -C /etc/openvpn/

#win客户端连接配置
vi vos_client.ovpn
client         #指定当前VPN是客户端
dev tun        #必须与服务器端的保持一致
proto tcp      #必须与服务器端的保持一致
remote 192.168.1.1 1094      #指定连接的远程服务器的实际IP地址和端口号
resolv-retry infinite    #断线自动重新连接，在网络不稳定的情况下(例如：笔记本电脑无线网络)非常有用。
nobind         #不绑定特定的本地端口号
persist-key
persist-tun
#ca ca.crt      #指定CA证书的文件路径
#cert client1.crt       #指定当前客户端的证书文件路径
#key client1.key    #指定当前客户端的私钥文件路径
ns-cert-type server      #指定采用服务器校验方式
#tls-auth ta.key 1     #如果服务器设置了防御DoS等攻击的ta.key，则必须每个客户端开启；如果未设置，则注释掉这一行；
#tls-auth 1
comp-lzo              #与服务器保持一致
verb 3                #指定日志文件的记录详
#redirect-gateway def1
<ca>
-----BEGIN CERTIFICATE-----
MIIEmzCCA4OgAwIBAgIJAITInYiGbcQSMA0GCSqGSIb3DQEBCwUAMIGPMQswCQYD
VQQGEwJDTjEQMA4GA1UECBMHQmVpSmluZzEQMA4GA1UEBxMHQmVpSmluZzELMAkG
A1UEChMCT1AxDDAKBgNVBAsTAzIxSzEOMAwGA1UEAxMFT1AgQ0ExEDAOBgNVBCkT
B0Vhc3lSU0ExHzAdBgkqhkiG9w0BCQEWEDIxa2l4Y0BnbWFpbC5jb20wHhcNMTgw
MjA1MDM0OTQyWhcNMjgwMjAzMDM0OTQyWjCBjzELMAkGA1UEBhMCQ04xEDAOBgNV
BAgTB0JlaUppbmcxEDAOBgNVBAcTB0JlaUppbmcxCzAJBgNVBAoTAk9QMQwwCgYD
VQQLEwMyMUsxDjAMBgNVBAMTBU9QIENBMRAwDgYDVQQpEwdFYXN5UlNBMR8wHQYJ
KoZIhvcNAQkBFhAyMWtpeGNAZ21haWwuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOC
AQ8AMIIBCgKCAQEA3ozjciJpPnjRGDO2n+QC9yfPgban3TKNBPZ1XHvIjn05pk8G
TKJ2kqU7Gr1coDni3cBIUuxG9Gq1Y108vyu4YvQF1y1CpcLyMjQNVC3mUeVzBXt5
L3kUtykykz8kSMICorfDBSwYqR6eF6lMboLEH09Qb1iCe1ynhA83eRDdlElOiz8S
wYWoGO7QfgIvcU1oNm8Wb0HfXS1NDUYzt98RcKibaVRvY2pNPaDW9n4BuwIlluU9
aEVI+PgZuFNADRjkHVhgVwJa7YUQiBICNRf6BIrFg7jY9J68J26ItVpvCsWJjvwN
YpfXAXdIYp6cufPW73GriM1VLjJ8e9B0HzPrAQIDAQABo4H3MIH0MB0GA1UdDgQW
BBTgQPEaLkLIW+mQzK4/dCcpP4pGIjCBxAYDVR0jBIG8MIG5gBTgQPEaLkLIW+mQ
zK4/dCcpP4pGIqGBlaSBkjCBjzELMAkGA1UEBhMCQ04xEDAOBgNVBAgTB0JlaUpp
bmcxEDAOBgNVBAcTB0JlaUppbmcxCzAJBgNVBAoTAk9QMQwwCgYDVQQLEwMyMUsx
DjAMBgNVBAMTBU9QIENBMRAwDgYDVQQpEwdFYXN5UlNBMR8wHQYJKoZIhvcNAQkB
FhAyMWtpeGNAZ21haWwuY29tggkAhMidiIZtxBIwDAYDVR0TBAUwAwEB/zANBgkq
hkiG9w0BAQsFAAOCAQEAws6jLkC3hebT4bphTTm1CCTJ20nzlsg2+mURh5ZqGL+I
YBQBCyCrja9r6jpNIvPBaHJsu4WniJphIZbBKM0HjapjzIZ+9bq7HsXsEFqaLVsd
nW58IJhcv3I2q5FGZpwDODPzj75ZIJIYXHPM0OdXjlWU+r2z08xWwKEWxKU3vt7H
YWz13HDoHSea8oxfeXeGlWbyAWEkbM64nQkLQ0j/4NrtHSx6vLUBmCbOb2PbjQEb
dFizLpHrFqqBYDVEDL4MzFXa5SItgJ978FxiFiRnsOzGP1us5aoT8q6NvtFQ+aaj
pce0Av3y2knjUyKEA5UF4gXC3dpaE1rd0V0FY2qSUA==
-----END CERTIFICATE-----
</ca>
<cert>
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number: 2 (0x2)
    Signature Algorithm: sha256WithRSAEncryption
        Issuer: C=CN, ST=BeiJing, L=BeiJing, O=OP, OU=21K, CN=OP CA/name=EasyRSA/emailAddress=21kixc@gmail.com
        Validity
            Not Before: Feb  5 03:51:59 2018 GMT
            Not After : Feb  3 03:51:59 2028 GMT
        Subject: C=CN, ST=BeiJing, L=BeiJing, O=OP, OU=21K, CN=client1/name=EasyRSA/emailAddress=21kixc@gmail.com
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                Public-Key: (2048 bit)
                Modulus:
                    00:dc:b1:35:55:4a:db:2a:c3:0a:58:bf:58:ac:d4:
                    46:f2:0b:0b:14:79:bc:2d:d6:85:4e:bd:c8:55:61:
                    98:99:81:48:57:06:2e:a7:99:44:bf:f9:77:ac:12:
                    e3:9b:9a:70:bf:06:a0:cd:b7:26:17:2e:6a:c8:32:
                    41:6f:d7:6c:b5:55:7f:fa:f7:73:fd:bf:c8:23:86:
                    52:0d:92:89:f4:a5:af:6d:e8:7d:8a:f6:54:89:39:
                    9d:9c:05:ed:f4:dc:6c:a5:e0:a7:4c:62:fc:da:67:
                    b4:dd:0f:cc:ae:ad:3d:dc:a2:d8:3a:e9:9a:60:de:
                    16:46:b4:c1:c3:4a:9a:9a:d3:4b:7f:0b:55:64:94:
                    a4:92:42:c5:04:aa:93:08:68:94:97:2d:e2:30:fa:
                    e8:e3:f5:44:be:01:79:bc:46:22:0e:9c:21:b5:c6:
                    01:15:5c:32:87:3d:5f:59:84:a5:a5:28:b2:e9:3e:
                    c3:05:f7:a9:6d:fd:7c:ce:f3:c1:b2:a5:0a:34:d2:
                    7a:09:0a:14:42:06:35:97:d0:e8:ad:5b:f4:10:1f:
                    5c:db:79:39:05:ee:39:e3:36:e5:d1:0c:cb:68:a7:
                    d3:94:29:85:d3:f0:93:87:dd:cf:57:79:25:f7:5f:
                    94:98:62:94:3f:8c:d1:ba:9a:06:16:f8:97:5b:19:
                    ca:b9
                Exponent: 65537 (0x10001)
        X509v3 extensions:
            X509v3 Basic Constraints: 
                CA:FALSE
            Netscape Comment: 
                Easy-RSA Generated Certificate
            X509v3 Subject Key Identifier: 
                5A:A5:42:92:23:45:EF:1D:36:6F:BD:87:6E:88:D9:2B:BD:8C:06:A9
            X509v3 Authority Key Identifier: 
                keyid:E0:40:F1:1A:2E:42:C8:5B:E9:90:CC:AE:3F:74:27:29:3F:8A:46:22
                DirName:/C=CN/ST=BeiJing/L=BeiJing/O=OP/OU=21K/CN=OP CA/name=EasyRSA/emailAddress=21kixc@gmail.com
                serial:84:C8:9D:88:86:6D:C4:12

            X509v3 Extended Key Usage: 
                TLS Web Client Authentication
            X509v3 Key Usage: 
                Digital Signature
    Signature Algorithm: sha256WithRSAEncryption
         6f:7f:b7:29:c1:cd:e6:05:b4:a7:9b:8e:c5:5c:36:58:2c:c4:
         cf:16:da:5c:3a:ac:fb:93:7d:61:88:34:59:b6:74:20:c3:e1:
         71:71:51:f3:10:c5:19:e2:80:49:dc:d6:e3:b7:66:da:5d:00:
         58:f2:7f:29:87:d5:ae:ba:9e:8c:98:71:89:ed:f8:9c:3b:ea:
         f0:c6:06:00:42:5e:76:26:73:29:64:b4:0a:6a:dc:23:ea:8d:
         3b:50:8f:45:21:a9:31:12:0d:37:94:fb:0c:a0:ff:5a:f9:39:
         11:57:4e:de:b9:0c:2e:7e:2f:ed:9f:54:37:17:c3:18:7c:eb:
         8f:d2:29:a7:08:f7:d1:3a:ba:75:c6:55:72:5a:f4:3d:96:14:
         03:40:b3:8f:2a:9f:50:b0:49:fb:8b:06:3f:e9:84:72:39:4c:
         e2:32:f9:c4:c4:38:60:d6:e9:06:12:2b:a5:9e:28:83:b4:30:
         55:21:9f:b8:81:4d:7a:e3:d1:e8:3f:20:13:54:9c:6a:2c:8c:
         f2:65:af:b8:18:7e:f2:69:b9:96:aa:a0:78:a0:33:00:20:f5:
         6a:f3:dc:6d:08:c3:a4:10:df:eb:c7:10:03:cb:17:b5:04:dc:
         61:b4:10:3c:98:f8:24:66:2e:38:cc:75:85:91:3d:43:88:4c:
         75:e6:ae:89
-----BEGIN CERTIFICATE-----
MIIE5TCCA82gAwIBAgIBAjANBgkqhkiG9w0BAQsFADCBjzELMAkGA1UEBhMCQ04x
EDAOBgNVBAgTB0JlaUppbmcxEDAOBgNVBAcTB0JlaUppbmcxCzAJBgNVBAoTAk9Q
MQwwCgYDVQQLEwMyMUsxDjAMBgNVBAMTBU9QIENBMRAwDgYDVQQpEwdFYXN5UlNB
MR8wHQYJKoZIhvcNAQkBFhAyMWtpeGNAZ21haWwuY29tMB4XDTE4MDIwNTAzNTE1
OVoXDTI4MDIwMzAzNTE1OVowgZExCzAJBgNVBAYTAkNOMRAwDgYDVQQIEwdCZWlK
aW5nMRAwDgYDVQQHEwdCZWlKaW5nMQswCQYDVQQKEwJPUDEMMAoGA1UECxMDMjFL
MRAwDgYDVQQDEwdjbGllbnQxMRAwDgYDVQQpEwdFYXN5UlNBMR8wHQYJKoZIhvcN
AQkBFhAyMWtpeGNAZ21haWwuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
CgKCAQEA3LE1VUrbKsMKWL9YrNRG8gsLFHm8LdaFTr3IVWGYmYFIVwYup5lEv/l3
rBLjm5pwvwagzbcmFy5qyDJBb9dstVV/+vdz/b/II4ZSDZKJ9KWvbeh9ivZUiTmd
nAXt9NxspeCnTGL82me03Q/Mrq093KLYOumaYN4WRrTBw0qamtNLfwtVZJSkkkLF
BKqTCGiUly3iMPro4/VEvgF5vEYiDpwhtcYBFVwyhz1fWYSlpSiy6T7DBfepbf18
zvPBsqUKNNJ6CQoUQgY1l9DorVv0EB9c23k5Be454zbl0QzLaKfTlCmF0/CTh93P
V3kl91+UmGKUP4zRupoGFviXWxnKuQIDAQABo4IBRjCCAUIwCQYDVR0TBAIwADAt
BglghkgBhvhCAQ0EIBYeRWFzeS1SU0EgR2VuZXJhdGVkIENlcnRpZmljYXRlMB0G
A1UdDgQWBBRapUKSI0XvHTZvvYduiNkrvYwGqTCBxAYDVR0jBIG8MIG5gBTgQPEa
LkLIW+mQzK4/dCcpP4pGIqGBlaSBkjCBjzELMAkGA1UEBhMCQ04xEDAOBgNVBAgT
B0JlaUppbmcxEDAOBgNVBAcTB0JlaUppbmcxCzAJBgNVBAoTAk9QMQwwCgYDVQQL
EwMyMUsxDjAMBgNVBAMTBU9QIENBMRAwDgYDVQQpEwdFYXN5UlNBMR8wHQYJKoZI
hvcNAQkBFhAyMWtpeGNAZ21haWwuY29tggkAhMidiIZtxBIwEwYDVR0lBAwwCgYI
KwYBBQUHAwIwCwYDVR0PBAQDAgeAMA0GCSqGSIb3DQEBCwUAA4IBAQBvf7cpwc3m
BbSnm47FXDZYLMTPFtpcOqz7k31hiDRZtnQgw+FxcVHzEMUZ4oBJ3Nbjt2baXQBY
8n8ph9Wuup6MmHGJ7ficO+rwxgYAQl52JnMpZLQKatwj6o07UI9FIakxEg03lPsM
oP9a+TkRV07euQwufi/tn1Q3F8MYfOuP0imnCPfROrp1xlVyWvQ9lhQDQLOPKp9Q
sEn7iwY/6YRyOUziMvnExDhg1ukGEiulniiDtDBVIZ+4gU1649HoPyATVJxqLIzy
Za+4GH7yabmWqqB4oDMAIPVq89xtCMOkEN/rxxADyxe1BNxhtBA8mPgkZi44zHWF
kT1DiEx15q6J
-----END CERTIFICATE-----
</cert>
<key>
-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDcsTVVStsqwwpY
v1is1EbyCwsUebwt1oVOvchVYZiZgUhXBi6nmUS/+XesEuObmnC/BqDNtyYXLmrI
MkFv12y1VX/693P9v8gjhlINkon0pa9t6H2K9lSJOZ2cBe303Gyl4KdMYvzaZ7Td
D8yurT3cotg66Zpg3hZGtMHDSpqa00t/C1VklKSSQsUEqpMIaJSXLeIw+ujj9US+
AXm8RiIOnCG1xgEVXDKHPV9ZhKWlKLLpPsMF96lt/XzO88GypQo00noJChRCBjWX
0OitW/QQH1zbeTkF7jnjNuXRDMtop9OUKYXT8JOH3c9XeSX3X5SYYpQ/jNG6mgYW
+JdbGcq5AgMBAAECggEALhHsMUb0I6Qdl9Mx/ro9qS92+6pCB0ud/ocNuA0snvbn
FAudV61eNbktK0WyL/x4htgqX2dZU0OEVRBwqplM/zm/ArP/ibwsWoYiwOSTWffw
fEApXQX5NcBKT5TJTPFq2OHh6sdLQ4icr/0pXFmb7WAtRXcYnBogilgXjt4XEjSg
YrVy6mm7lg14CfzHvqAgSIzyXoK74Z1j4VOw6SrsVtrX9vaD9rTZVQ8p+RJa+Qr/
0Anw//U5l1rJG15MZv4fHvko/2jTSH4To/m9jKyD3QrQcyW/lE4Y51T7tAvrljnz
Aaq7WFp+17vo8DMc0YuEK6Lw0EDIb95DSpskT3qUkQKBgQD2l0XwmXTzjpzGTtgy
A/hE5NITU3EaUlCgfbCKWDw2Bx7QW29GLeXR3Bwc0BvT9qQK1jreCnMqYFnf4dYG
YrvbLTIfXPoCSXZlMGJHfRzJ7UHOKEzHp8/566aXeKWM60VR7JT8Y0ihBeiysVMl
rVUSCccjJB1hFyHrxlgL3JCaVQKBgQDlHPQzHY6d4DTqh7MsF4vR3S+vvRbx30F6
He5uJik3wt5v1qcjJR9KdX3nH7LhctPBVbp3r+XYUVng9eJv+MvcGJfNpa9tlFB9
ajtZRSpnII0a33FTvtQIqjD8bFt/8SCxFAWJ9mAlNo1qahTqqhpFWNObaVwnVMWR
XRmYTOna1QKBgChFdj+f4DCylrnwQHCSo2Yk9IYBd5Qz40UCoeVGGbc9HHQsqpSM
hF7sko7GEfVg71NxvzVqAXrnN2ZPzJNIZqOZ0vi6R34+Hx7Rcwt3zE7R95BClp94
sYeAS7mrE2ZbOfvyJja9xCu/+kvMl+asUxtaC3KawE2N6JVH1DNDtz3tAoGAZU/s
XD4RtpZST/M5s6Gl3mNklt2Sq9oBZjKeIG8XguTU37eXqN7de1uBFRbbTv4rzS5P
imVpycIPcH7KZqEp5GWrmvBNJrOS9CJppAwFuByYyO1Ne67CrCI2DykLPQQvZJ5p
5Jvh4BLDbe8C2NHnVAr3Z52rdmjyBFma29IHBxECgYEAhC0k04apAO86N3cPSfcU
IL5BzEgYNTkK5n8XXV+vV9jRk9r1jttAB6AohtQoXDHzDR07TTdyuitZqBuQ1BmC
OPJo2WggVlQ+LR8mkiq98bdonMpKGVVHxaacpiNC4Eb2gMh0AnxajjhGAXZUSzQz
UGpKfFYiAlNH+dw3tlaaBqk=
-----END PRIVATE KEY-----
</key>
key-direction 1
<tls-auth>
#
# 2048 bit OpenVPN static key
#
-----BEGIN OpenVPN Static key V1-----
dedf17ed486c4bb736e5eebaf06e9850
1d26650b0f85099f9daed774880654f8
21fb0cc4c4ee4e20defbe15a488f2d5c
33e3dc7d2a5adaa6f7fe66801332f1a8
b676a12e625e25d354719fddd5df2799
04060ca5c08e10ab3f12b54c60b15e64
a5c500a2a71dcd31b2e88b2be87d43cc
4b73cbfa734eba89858fc91b85dd9feb
6e93a4422116b8fcc0b563c0336a0e1a
3d537dc7a54685fc3faafcf429ad4261
535021c3a96c34e1004cd59579289690
d3be5e4d3a546486a19a8bab192bc096
efa13b6dbcbf9c63e5c5488c36ffa59d
945db353e023ffcbd7467a4f8685a060
40a13da4fb822e1b16e998c5941563fc
82011b788e913235dac30d91bc29759b
-----END OpenVPN Static key V1-----
</tls-auth>
