package com.mystudy.ex02_url;

import java.net.MalformedURLException;
import java.net.URL;

public class URL_Exam {

	public static void main(String[] args) throws MalformedURLException {
		// 프로토콜://호스트(서버):포트/경로(path)?질의(query)
		// https://sports.news.naver.com/nhn?oid=109&aid=0004451288
		
		//URL(String protocol, String host, int port, String file)
		//http://java.mystudy.com:8080/aaa/bbb/index.jsp?id=hong&password=1234#content
		URL url = new URL("http","com.mystudy.java",8080, "aaa/bbb/index.jsp?id=hong&password=1234#content");
		System.out.println("URL:"+url);
		
		url = new URL("http://java.mystudy.com:8080/aaa/bbb/index.jsp?id=hong&password=1234#content");
		String protocol = url.getProtocol();
		String host = url.getHost();
		int port = url.getPort();
		int defaultPort = url.getDefaultPort();
		String Path = url.getPath();
		String query = url.getQuery();
		String ref = url.getRef();
		
		System.out.println("프로토콜(protocol):"+protocol);
		System.out.println("호스트(host):"+host);
		System.out.println("포트번호(port):"+port);//프토번호가 지정되어있으면 
		System.out.println("포트번호(defaultPort):"+defaultPort);//포트번호가 지정되어 있지않으면 
		System.out.println("경로(Path):"+Path);
		System.out.println("질문(query):"+query);
		System.out.println("참조(reference):"+ref);
		
		System.out.println("------------------------------");
		url = new URL("https://sports.news.naver.com/nhn?oid=109&aid=0004451288");
		protocol = url.getProtocol();
		host = url.getHost();
		port = url.getPort();
		defaultPort = url.getDefaultPort();
		Path = url.getPath();
		query = url.getQuery();
		ref = url.getRef();

		System.out.println("프로토콜(protocol):"+protocol);
		System.out.println("호스트(host):"+host);
		System.out.println("포트번호(port):"+port);
		System.out.println("포트번호(defaultPort):"+defaultPort);//443 : HTTPS
		System.out.println("경로(Path):"+Path);
		System.out.println("질문(query):"+query);
		System.out.println("참조(reference):"+ref);



	}

}
