# İLERİ WEB PROGRAMLAMA ÖDEVİ 

> Eclipse üzerinden projeyi WAR Export ediyoruz.

> Dockerfile Ayarları
````
FROM tomcat:11.0-jdk21
COPY ./Odev1/Odev1.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
````
