# jump_install

安装说明
========

- Dockerfile为容器化jumpserver的步骤和配置文件
- 自动化安装分为mysql和jump两部分
- mysql_5.7.tar和jumpserver.tar由于太大没放上来
- jumpserver启动后,最先访问http://10.2.8.236:8080/terminal/terminal/地址激活coco组件
- k8s只完成了mysql的yaml部分，其余继续....



第一步: 修改变量文件
--------------
* 修改groups_vars/all里面的变量
* 修改hosts主机变量: jump主机

第二步: 安装mysql
--------------
* 执行脚本:ansible-playbook -i hosts jump_install.yml --tags mysql_install

第三步: 安装jump
--------------
* 执行脚本:ansible-playbook -i hosts jump_install.yml --tags jump_install
