package com.boot.Service;

import java.util.List;

import com.boot.DTO.boardAttachDTO;
import com.boot.DTO.comBoardAttachDTO;
import com.boot.DTO.noticeBoardAttachDTO;

public interface noticeBoardUploadService {
	public List<noticeBoardAttachDTO> boardGetFileList(int board_no);
	public void boardDeleteFile(List<noticeBoardAttachDTO> fileList);
}
