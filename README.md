# İLERİ WEB PROGRAMLAMA ÖDEVİ 

> Dosyayı WAR olarak Export etmek gerekiyor.
  - WAR dosyasını Tomcat'in webapps klasörüne kopyalıyoruz

- Dockerfile Ayarları
````
FROM tomcat:9.0-jdk11
COPY target/your-project.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
````

