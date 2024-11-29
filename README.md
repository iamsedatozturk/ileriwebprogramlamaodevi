# İLERİ WEB PROGRAMLAMA ÖDEVİ 
''''
# Tomcat 9 kullanıyoruz (Java 11 için uygun)
FROM tomcat:9.0-jdk11

# WAR dosyasını Tomcat'in webapps klasörüne kopyalıyoruz
COPY target/your-project.war /usr/local/tomcat/webapps/

# Tomcat'i başlatıyoruz
CMD ["catalina.sh", "run"]
''''

