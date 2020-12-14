package com.Front;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	//인터페이스는 {}중괄호 바디를 쓰지 않은 추상클래스 오버라이딩을 시키기 위해서 생성해줌
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException; 
	
}
