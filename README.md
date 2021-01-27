# maven_quick
mavn仓库，配置加速镜像



# 如何使用

你可以直接使用Maven Docker镜像运行Maven项目，首先，cd到相应的目录，然后:



```
$ docker run -it --rm --name my-maven-project -v "$(pwd)":/usr/src/mymaven -w /usr/src/mymaven virhuiai/maven_quick:latest mvn clean install
```



也可以直接将`$(pwd)"`指定为你的代码目录。



# 重用已经下载的repository

法一：使用volume



```
$ docker volume create --name maven-repo
$ docker run -it -v maven-repo:/root/.m2 virhuiai/maven_quick:latest mvn archetype:generate # will download artifacts
$ docker run -it -v maven-repo:/root/.m2 virhuiai/maven_quick:latest mvn archetype:generate # will reuse downloaded artifacts
```



法二：直接将`.m2`目录映射：



```
$ docker run -it --rm -v "$PWD":/usr/src/mymaven -v "$HOME/.m2":/root/.m2 -v "$PWD/target:/usr/src/mymaven/target" -w /usr/src/mymaven virhuiai/maven_quick:latest mvn clean package  
```



# 使用你自己的加速镜像



将settings.xml映射到容器中：



```
-v 你的settings.xml路径:/usr/share/maven/conf/settings.xml
```

