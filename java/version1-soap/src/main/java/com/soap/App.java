package com.soap;

import com.sun.net.httpserver.HttpServer;
import java.net.InetSocketAddress;
import java.net.URL;
import javax.xml.namespace.QName;
import jakarta.xml.ws.Service;

public class App {

    public static void main(String[] args) throws Exception {

        HttpServer server =
                HttpServer.create(
                        new InetSocketAddress(8000),
                        0);

        server.createContext("/", exchange -> {

            String query =
                    exchange.getRequestURI().getQuery();

            String numero =
                    query.split("=")[1];

            URL wsdl = new URL(
                    "https://www.dataaccess.com/webservicesserver/NumberConversion.wso?WSDL");

            QName qname =
                    new QName(
                            "http://www.dataaccess.com/webservicesserver/",
                            "NumberConversion");

            Service service =
                    Service.create(wsdl, qname);

            NumberConversionSoap soap =
                    service.getPort(
                            NumberConversionSoap.class);

            String resultado =
                    soap.numberToWords(
                            Long.parseLong(numero));

            exchange.sendResponseHeaders(
                    200,
                    resultado.length());

            exchange.getResponseBody()
                    .write(resultado.getBytes());

            exchange.close();

        });

        server.start();

        System.out.println(
                "Servidor iniciado en puerto 8000");
    }
}