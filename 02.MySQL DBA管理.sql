d#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++创建用户
#查看字符集
SHOW VARIABLES LIKE 'character_set_%';
#列出MYSQL支持的所有字符集：
SHOW CHARACTER SET;

# 查看mysql 中用户信息
SELECT DISTINCT CONCAT('User: ''',user,'''@''',host,''';') AS query FROM mysql.user;


-- # 查看最大连接数
show variables like '%max_connections%';

-- # 重新设置
set global max_connections=1000

show status like 'Threads%';

-- # TimeZone
select curtime();
select now();
show variables like "%time_zone%";


# 删除mysql 用户 (这个用户需要删除)
drop user root@'::1'
drop user root@'127.0.0.1'
drop user root@'localhost.localdomain'

#创建数据库
create database commercial;


#普通用户
CREATE USER dber@'localhost' IDENTIFIED BY 'dber_pw';
CREATE USER dber@'192.168.%.%' IDENTIFIED BY 'dber_pw';
#管理员
CREATE USER root@'192.168.%.%' IDENTIFIED BY 'Sa*963.-+';
#dba
CREATE USER dba@'localhost' IDENTIFIED BY 'Sa*963.-+';
CREATE USER dba@'192.168.%.%' IDENTIFIED BY 'Sa*963.-+';


CREATE USER gogs@'%' IDENTIFIED BY 'gogs_pw';
grant all privileges on gogs.* to gogs@'%';

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++权限管理
#查看授权
show grants for dba@'192.168.%.%'; 
#撤销授权
revoke all on *.* from dba@'192.168.%.%';

#dber 增、删、改、查
grant select, insert, update, delete, references, index ,show view, execute on commercial.* to dber@'localhost';
grant select, insert, update, delete, references, index ,show view, execute on commercial.* to dber@'192.168.%.%';
grant all privileges on commercial.* to root@'192.168.%.%';

#grant 普通 DBA 管理某个 MySQL 数据库的权限
#所有权限 
#select, insert, update, delete, references, index ,show view, execute
#create, alter, drop, 
#create temporary tables, create view,
#create routine,alter routine,


#grant 高级 DBA 管理 MySQL 中所有数据库的权限：
grant all on *.* to dba@'localhost';
grant all on *.* to dba@'192.168.%.%';


#配置master
grant replication slave on *.* to 'rsync'@'192.168.24.101' identified by 'rsync_pw';
grant replication slave on *.* to 'rsync'@'192.168.24.102' identified by 'rsync_pw';

#配置slave
CHANGE MASTER TO MASTER_HOST='192.168.24.100', MASTER_USER='rsync', MASTER_PASSWORD='rsync_pw',MASTER_LOG_FILE='log.000001',MASTER_LOG_POS=0;


grant select, insert, update, delete, references, index ,show view, execute on rrslogback.* to dber@'localhost';
grant select, insert, update, delete, references, index ,show view, execute on rrslogback.* to dber@'192.168.%.%';
grant all privileges on rrslogback.* to root@'192.168.%.%';

STOP SLAVE;

SET GLOBAL SQL_SLAVE_SKIP_COUNTER = 1;

START SLAVE;

# 导出數據库為dbname的表结构（其中用戶名為root,密码為dbpasswd,生成的脚本名為db.sql）
mysqldump -u root -p dbpasswd -d dbname >db.sql;

# 导出數據库為dbname某张表(test)结构
mysqldump -u root -p dbpasswd -d dbname test>db.sql;

# 导出數據库為dbname所有表结构及表數據（不加-d）
mysqldump -u root -p dbpasswd dbname >db.sql;

# 导出數據库為dbname某张表(test)结构及表數據（不加-d）
mysqldump -u root -p dbpasswd dbname test>db.sql;


#查看group_concat_max_len
show variables like 'group_concat_max_len';

GRANT SELECT ON mysql.proc TO 'root'@'%.%.%.%';

GRANT SELECT ON mysql.proc TO 'dber'@'%.%.%.%';

# 查看最大连接数
show variables like '%max_connections%';
innodb_lock_wait_timeout
#查看服务器状态
命令：show status like '%下面变量%';

Aborted_clients 由于客户没有正确关闭连接已经死掉，已经放弃的连接数量。
Aborted_connects 尝试已经失败的MySQL服务器的连接的次数。
Connections 试图连接MySQL服务器的次数。
Created_tmp_tables 当执行语句时，已经被创造了的隐含临时表的数量。
Delayed_insert_threads 正在使用的延迟插入处理器线程的数量。
Delayed_writes 用INSERT DELAYED写入的行数。
Delayed_errors 用INSERT DELAYED写入的发生某些错误(可能重复键值)的行数。
Flush_commands 执行FLUSH命令的次数。
Handler_delete 请求从一张表中删除行的次数。
Handler_read_first 请求读入表中第一行的次数。
Handler_read_key 请求数字基于键读行。
Handler_read_next 请求读入基于一个键的一行的次数。
Handler_read_rnd 请求读入基于一个固定位置的一行的次数。
Handler_update 请求更新表中一行的次数。
Handler_write 请求向表中插入一行的次数。
Key_blocks_used 用于关键字缓存的块的数量。
Key_read_requests 请求从缓存读入一个键值的次数。
Key_reads 从磁盘物理读入一个键值的次数。
Key_write_requests 请求将一个关键字块写入缓存次数。
Key_writes 将一个键值块物理写入磁盘的次数。
Max_used_connections 同时使用的连接的最大数目。
Not_flushed_key_blocks 在键缓存中已经改变但是还没被清空到磁盘上的键块。
Not_flushed_delayed_rows 在INSERT DELAY队列中等待写入的行的数量。
Open_tables 打开表的数量。
Open_files 打开文件的数量。
Open_streams 打开流的数量(主要用于日志记载）
Opened_tables 已经打开的表的数量。
Questions 发往服务器的查询的数量。
Slow_queries 要花超过long_query_time时间的查询数量。
Threads_connected 当前打开的连接的数量。
Threads_running 不在睡眠的线程数量。
Uptime 服务器工作了多少秒。 

