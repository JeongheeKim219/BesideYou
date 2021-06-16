package bu.mvc.down;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

/**
 * 파일다운로드 기능 구현 view
 * */

@Component("downLoadView") //생성 <bean class=""  id="downLoadView"/> 대신
public class DownLoadCustomView extends AbstractView{ //ViewResolver의 종류이다 (뷰페이지)
	//AbstractView랑 HttpServlet 같은 역할  -> 뷰페이지
	//@WebServlet("/test") class DownLoadCustonView extends HttpServlet{}
		
	@Override
	protected void renderMergedOutputModel(Map<String, Object> map,
		HttpServletRequest request, HttpServletResponse response) throws Exception {//서블릿  HttpServlet 상속받으면 service재정의 request, response
		
		File file = (File) map.get("fname");//파일객체....(다운로드할 파일객체)
		
		response.setContentType("application/download;charset-UTF-8");
		response.setContentLength((int)file.length());
	
		
		String userAgent = request.getHeader("User-Agent");//브라우저 정보
		
		boolean isInternetExplorer = userAgent.indexOf("MSIE") > -1;
		String fileName = null;
		//익스플로러인지 아닌지에 대한 인코딩처리
		if(isInternetExplorer)
			fileName = URLEncoder.encode(file.getName() , "UTF-8");
		else
			fileName = new String(file.getName().getBytes("UTF-8") , "iso-8859-1") ;
		
		
		response.setHeader("Content-Disposition","attachment;filename=\"" + fileName.replace("+", "%20") + "\";");
		//response.setHeader("Content-Transfer-Encoding", "binary");
		
		OutputStream out = response.getOutputStream(); //쓰기=저장
		FileInputStream fis = null;
		try{
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);//카피카피
			
		}catch(Exception e){
			//map.put("error", e.toString());
			e.printStackTrace();
		}
		finally{
			if(fis != null){
				try{
					fis.close();
				}
				catch(IOException ex){}
			}
		}		
		out.flush();
		
		
	}



	
}







