# Usa uma imagem base que já tem o Java 17, otimizada para aplicações Spring Boot.
# Isso torna a imagem final menor e mais segura.
FROM eclipse-temurin:21-jre-jammy

# Define o diretório de trabalho dentro do contêiner.
WORKDIR /app

# Copia o arquivo JAR da sua aplicação para o contêiner.
# O "target/workshop-springboot-3.jar" é o caminho do arquivo JAR gerado pelo Maven.
# "app.jar" é o nome que ele terá dentro do contêiner.
COPY target/course-api.jar app.jar

# Expõe a porta que a aplicação Spring Boot usa (geralmente a 8080).
EXPOSE 8080

# Comando para rodar a aplicação quando o contêiner for iniciado.
# O "java -jar app.jar" executa o arquivo JAR copiado.
ENTRYPOINT ["java", "-jar", "app.jar"]

