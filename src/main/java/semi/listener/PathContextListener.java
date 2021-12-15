package semi.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

//어플케이션 컨텍스트가 생성될때 소멸될때에 수행될 작업을 구현
@WebListener
public class PathContextListener implements ServletContextListener{
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("[contextInitialized] applicationScope등록 Key-Value(cp-Contextpath)");
		ServletContext application =sce.getServletContext();
		application.setAttribute("cp", application.getContextPath());
	}
	
}
