# 钱进家网络借贷平台
-  接口文档说明 <http://localhost/swagger-ui/#>

## 版本

-   Laravel 5.6
-   PHP 7.2.3


## 开发及构建

### 目录结构

```bash
├── /app/               # 项目核心代码
│ ├── /Common/          # 项目组件
│ ├── /Console/         # artisan命令
│ ├── /Exception/       # 异常处理器
│ ├── /Http/            # 
│ ├── ├──/Controllers/  # 控制器
│ ├── ├──├──/Auth/       # 控制器
│ ├── ├──├──/backend/   # 后台控制器
│ ├── ├──├──/Controller.php      # 权限
│ ├── ├──/Middleware/   # 中间件
│ ├── ├──/Kernel.php/   # kernel
│ ├── /Model/           # Model
│ ├── /Providers/       # 服务提供者
│ ├── /Repositories/    # 工具函数
│ ├── /Service/         # 业务逻辑
│ ├── User.php          # 账号模型    
├── /bootstrap/         # 框架启动和自动载入配置
├── /config/            # 项目配置文件
├── /database/          # 数据迁移填充文件
├── /public/            # 资源文件（图片、Javascript、CSS等）和入口文件
│ ├── /swagger-ui/             # Swagger-UI
├── /resources/         # 视图文件和原生资源文件
├── /routes/            # 项目路由
│ ├── /api/            # 账号路由
│ ├── /backend/         # 后台路由
├── /storage/           # 编译后的 Blade 模版
├── /tests/             # 自动化测试
├── /vendor/            # Composer 依赖
├── .env.example        # 本地项目配置文件
├── artisan             # artisan命令
├── composer.json       # composer
├── package.json        # package
├── readme.md           # readme
├── server.php          # server

```

### 快速开始

克隆项目文件，切换到 develop 分支:


```
git clone ssh://git@192.168.3.33:10022/php/qianjinjiaBackendApi.git
```

进入目录配置项目

    1、配置.env文件，命令：cp .env.example .env
    2、.env中 APP_ENV 值参考config/app.php中配置
    3、配置目录storage和bootstrap/cache可写权限，命令：chmod -R 777 storage/
    4、设置key ( .env文件中的 APP_KEY )，命令：php artisan key:generate
    5、设置jwt secret key，命令：php artisan jwt:secret
    6、在项目根目录下创建目录/filedata/contract/，并且给予可写可执行权限

.env 参考配置

    APP_NAME=Laravel
    APP_ENV=local
    APP_KEY=base64:GD+91cJrvPCa/2eYUUU88QKPdyUPI9iflKO0+uZER68=
    APP_DEBUG=true
    APP_URL=http://localhost

    LOG_CHANNEL=stack

    DB_CONNECTION=mysql
    DB_HOST=192.168.3.33
    DB_PORT=3306
    DB_DATABASE=qianjinjia
    DB_USERNAME=root
    DB_PASSWORD=mysql00

    BROADCAST_DRIVER=log
    CACHE_DRIVER=file
    SESSION_DRIVER=file
    SESSION_LIFETIME=120
    QUEUE_DRIVER=sync

    REDIS_HOST=127.0.0.1
    REDIS_PASSWORD=null
    REDIS_PORT=6379
    
    MAIL_DRIVER=smtp
    MAIL_HOST=smtp.mailtrap.io
    MAIL_PORT=2525
    MAIL_USERNAME=null
    MAIL_PASSWORD=null
    MAIL_ENCRYPTION=null

    PUSHER_APP_ID=
    PUSHER_APP_KEY=
    PUSHER_APP_SECRET=
    PUSHER_APP_CLUSTER=mt1
    
    MIX_PUSHER_APP_KEY="${PUSHER_APP_KEY}"
    MIX_PUSHER_APP_CLUSTER="${PUSHER_APP_CLUSTER}"
    
    JWT_SECRET=pEGpZdDsygTzsVkXp5XWBikm6IGSNuqv
    
    API_STANDARDS_TREE=vnd
    API_PREFIX=api
    API_VERSION=v1
    API_DEBUG=true

启动开发服务器,默认端口8000
```
php artisan serve
[set port]
php artisan serve --port=8080
```

创建控制器：
 php artisan make:controller Backend/XXXXXController
 php artisan make:controller Invest/V1/XXXXXController

定义模型：
模型对应表，默认规则是小写的模型类名复数格式作为与其对应的表名
例如：
创建模型Product:  php artisan make:model Product
对应的表名：products

## 参考

Laravel 5.6：<http://laravelacademy.org/laravel-docs-5_6>
JWT-Auth: <http://jwt-auth.readthedocs.io/en/develop/>
