#Cheetah

##技术栈
* [dvajs/dva](github.com/dvajs/dva): 集成react+redux-sagas+react-router的快速开发框架
* [ant.desgin pro](ant.desgin): 前端组件
* [Postgresql](https://www.postgresql.org/download/)：数据库
* [Redis](https://redis.io/)：Redis,用于生成自增序列
* [rails](https://guides.ruby-china.org/)：web开发框架

##安装
1. 项目克隆:

    ```terminal
      $ git clone git@github.com:Stan-Wang/cheetah.git  
    ```
2. 安装gem包和前端库及依赖库

    ```terminal
      $ cd cheetah // 切换至项目目录下
      $ bundle i // 安装gem包
      $ cnpm install yarn
      $ yarn config set registry https://registry.npm.taobao.org //yarn切换淘宝镜像
      $ yarn // 安装git提交相关前端库 参考 http://blog.joyoio.net/topics/38
      $ cd frontend // 进入前端项目目录
      $ yarn //安装前端项目依赖库
    ```

3. 创建数据库

    ```terminal
      $ cp config/database.yml.default config/database.yml //配置初始化数据库链接
      $ rails db:create // 创建数据库
      $ rails db:migrate // 执行迁移文件 db/migrate/*
      $ rails db:seed // 初始化基础数据  db/seeds.rb

      

    ```
4.  启动服务器

    ```
      $ cd cheetah
      $ foreman start

    ```
