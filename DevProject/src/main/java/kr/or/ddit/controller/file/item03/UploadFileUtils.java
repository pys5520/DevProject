package kr.or.ddit.controller.file.item03;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) {
		UUID uuid = UUID.randomUUID();
		String savedName = uuid.toString() + "_" + originalName;
		
		// 2023/06/07 폴더 경로를 만들고, /2023/06/07폴더 경로를 리턴한다.
		String savedPath = calcPath(uploadPath);
		File target = new File(uploadPath + savedPath, savedName);
		FileCopyUtils.copy(fileData, target);	// 위에서 만들어진 경로와 파일명을 가지고 파일 복사를 진행한다.
		String formatName = originalName.substring(originalName.lastIndexOf(".") + 1);	// 확장자
		// \2023\06\07 경로를 / 경로로 변경후 /savedName을 붙여서 최종 리턴 경로를 만든다.
		String uploadedFileName = savedPath.replace(File.separatorChar, '/') + "/" + savedName;
		
		// 확장자가 이미지 파일이라면 s_가 붙은 파일의 썸네일 이미지 파일을 생성한다.
		if(MediaUtils.getMediaType(formatName) != null) {
			makeThumbnail(uploadPath, savedPath, savedName);
		}
		return uploadedFileName;
	}
	
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		
		// DecimalFormat("00") :: 두자리에서 빈자리는 0으로 채움 05
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath, monthPath, datePath);
		// /2023/06/07
		return datePath;
	}
	
	// 가변인자
	// 키워드'...'를 사용한다.
	// [사용법]타입...변수명 형태로 사용
	// 순서대로 yearPath, monthPath, datePath가 배열로 들어가 처리
	private static void makeDir(String uploadPath, String...paths) {
		if(new File(paths[paths.length-1]).exists()) {
			return;
		}
		
		for(String path : paths) {
			File dirPath = new File(uploadPath + path);
			
			// /2023/06/07 과 같은 경로에 각 폴더가 없으면 각각 만들어준다.
			if(!dirPath.exists()) {
				dirPath.mkdirs();
			}
		}
	}
	
}



















