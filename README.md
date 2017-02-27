# zhihu仿知乎问答社交平台简介
---------------------
##### 这是一个仿知乎的问答社交平台网站，界面与基本功能均仿照知乎。目前实现包括注册，提问，回答，点赞，关注，私信等功能。
##### 技术选型
后端</br>
核心框架：Spring Framework 4.2.5</br>
视图框架：Spring MVC 4.2.5</br>
持久层框架：MyBatis 3.4.2</br>
缓存框架：Redis 3.2.100</br>
数据库:MySQL 5.7</br>
搜索:ElasticSearch 2.3.4</br>
</br>

前端</br>
JS框架：jQuery 2.1.1</br>
CSS框架：Twitter Bootstrap 3.3.7</br>
富文本编辑器：wangEditor</br>

##### 网站界面
注册
![image](https://github.com/gxh123/picture/blob/master/zhihu/%E6%B3%A8%E5%86%8C.PNG)  
主页
![image](https://github.com/gxh123/picture/blob/master/zhihu/%E4%B8%BB%E9%A1%B5.PNG)
点赞
![image](https://github.com/gxh123/picture/blob/master/zhihu/%E7%82%B9%E8%B5%9E.PNG)  
回答
![image](https://github.com/gxh123/picture/blob/master/zhihu/%E5%9B%9E%E7%AD%94.PNG)  
搜索
![image](https://github.com/gxh123/picture/blob/master/zhihu/%E6%90%9C%E7%B4%A2.png)  
私信
![image](https://github.com/gxh123/picture/blob/master/zhihu/%E7%A7%81%E4%BF%A1.PNG)  


Quick Started
---------------------
1、安装redis，ElasticSearch等软件，注意版本</br>
2、在MySQL中建立zhihu数据库,将data.sql（下方网盘链接）导入</br>
3、将zhihu数据库中需要搜索的数据导入ElasticSearch，这里我采用的导入工具是elasticsearch-jdbc</br>
4、将项目导入IDEA,运行（注意：之前别忘了启动mysql，redis，ElasticSearch）</br>
5、在登录注册界面可以自己注册，也可以使用测试账号登录：用户名：18812345678 密码：123456</br>

<<<<<<< HEAD
####注
1、由于data.sql太大，这里通过百度网盘提供下载：http://pan.baidu.com/s/1dFj6wJf  
2、redis（windows版）下载地址：https://github.com/MSOpenTech/redis/releases  
3、ElasticSearch 提供网盘下载地址：http://pan.baidu.com/s/1jIODE5K  
（包括了elasticsearch-jdbc，要导入的话运行elasticsearch-2.3.4\elasticsearch-jdbc\bin\mysql-simple-example.bat）      
4、目前版本问题bug较多，有一部分只是演示页面，后续会逐渐修复与更新。
=======
>>>>>>> parent of b97af2a... some modify
